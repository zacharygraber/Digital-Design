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
            print("Error: could not read from sensor at i2c address 0x5d")
            sys.exit()
        self.enable_sensor()
        
    def find_sensor(self):
        ''' read the whoami byte from i2c address 0x5d and confirm to be 0xbb '''
        # Return the address if found (0x5d) and 0 if not found
        
        # @@@@ Your Code Here @@@@ 
        
        return(0);   # if the sensor was not located on either bus, return -1

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

        # @@@@ Your Code Here @@@@ 
     
        pass
    
    def disable_sensor(self):
      ''' Turn off sensor in control register 1 '''

        # @@@@ Your Code Here @@@@ 

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

