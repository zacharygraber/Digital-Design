#!/usr/bin/env python3

import smbus
import sys

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
        
        # @@@@ Your Code Here @@@@ 
        
        pass
        
    def read_temperature(self):
        ''' Sample, read temperature registers, and convert to inhg ''' 
        tempC = 0

        # @@@@ Your Code Here @@@@ 
        
        return(tempC)

    def read_pressure(self):
        ''' Sample, read pressure registers, and convert to inhg ''' 
        press_inhg = 0
        
        # @@@@ Your Code Here @@@@ 
        
        return(press_inhg)
    
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

