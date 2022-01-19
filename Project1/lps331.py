#!/usr/bin/env python3

import smbus
import sys
import numpy as np

class lps331:
    ''' allows connection from Raspberry pi to I2C connected lps331 '''

    def __init__(self,raspberry_pi_i2c_port=1):
        self.i2c_port_number = raspberry_pi_i2c_port
        self.bus = smbus.SMBus(self.i2c_port_number)
        self.address = self.find_sensor()
        if (self.address == 0):
            print("Error: could not read from sensor at i2c address 0x5d or 0x5c")
            sys.exit()
        self.enable_sensor()
        
    def find_sensor(self):
        ''' read the whoami byte from i2c address 0x5d and confirm to be 0xbb '''
        # Return the address if found (0x5d) and 0 if not found
        
        whoami_reg = 0x0f
        if self.bus.read_byte_data(0x5d, whoami_reg) == 0xbb:
            return 0x5d
        elif self.bus.read_byte_data(0x5c, whoami_reg) == 0xbb:
            return 0x5c
        else:
            return 0

    def i2c_address(self):
        return(self.address)

    def sample_once(self):
        ''' Cause the sensor to sample one time '''
        
        CTRL_REG_2_ADDR = 0x21
        ctrl_reg_2_data = self.bus.read_byte_data(self.address, CTRL_REG_2_ADDR)
        self.bus.write_byte_data(self.address, CTRL_REG_2_ADDR, ctrl_reg_2_data | 0x01)

        # Keep waiting until the bit in the ctrl register has been reset to 0
        while ctrl_reg_2_data & 0x01:
            ctrl_reg_2_data = self.bus.read_byte_data(self.address, CTRL_REG_2_ADDR)
        
        pass
        
    def read_temperature(self):
        ''' Sample, read temperature registers, and convert to degrees C ''' 
        tempC = 0

        self.sample_once()
        temp_l = self.bus.read_byte_data(self.address, 0x2b)
        temp_h = self.bus.read_byte_data(self.address, 0x2c)
        tempC = tempC | temp_h
        tempC = tempC << 8
        tempC = tempC | temp_l

        # Convert from 2s complement to decimal
        tempC = np.int32(tempC)


        # Do scaling to get degC
        tempC /= 480
        tempC += 42.5
        
        return(tempC)

    def read_pressure(self):
        ''' Sample, read pressure registers, and convert to inhg ''' 
        press_inhg = 0
        
        self.sample_once()
        press_xl = self.bus.read_byte_data(self.address,0x28)
        press_l = self.bus.read_byte_data(self.address,0x29)
        press_h= self.bus.read_byte_data(self.address,0x2a)

        press_inhg = press_inhg | press_h
        press_inhg = press_inhg << 8
        press_inhg = press_inhg | press_l
        press_inhg = press_inhg << 8
        press_inhg = press_inhg | press_xl

        # Convert to decimal
        press_inhg = press_inhg - (1 << 24)

        
        return(press_inhg / 4096)
    
    def enable_sensor(self):
        ''' Turn on sensor in control register 1'''

        # first read the data, then 'or' it with 0b10000000 to keep the rest of the data intact
        CTRL_REG_1_ADDR = 0x20
        ctrl_reg_1_data = self.bus.read_byte_data(self.address, CTRL_REG_1_ADDR)
        self.bus.write_byte_data(self.address, CTRL_REG_1_ADDR, 0x80 | ctrl_reg_1_data)
     
        pass
    
    def disable_sensor(self):
        ''' Turn off sensor in control register 1 '''

        # first read the data, then 'and' it with 0b01111111 to keep the rest of the data intact
        CTRL_REG_1_ADDR = 0x20
        ctrl_reg_1_data = self.bus.read_byte_data(self.address, CTRL_REG_1_ADDR)
        self.bus.write_byte_data(self.address, CTRL_REG_1_ADDR, 0x7F & ctrl_reg_1_data)

        pass
        
    def close(self):
        ''' Disable the sensor and close connection to i2c port '''
        self.disable_sensor()
        self.bus.close()
       
if  __name__ == "__main__":
    sensor = lps331(1)
    print("Temperature = %0.2f Deg C "%(sensor.read_temperature()))
    print("Pressure = %0.2f inHg"%(sensor.read_pressure()))
    sensor.close()

