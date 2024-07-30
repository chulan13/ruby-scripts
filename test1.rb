#!/usr/bin/env ruby
try1=`system_profiler SPUSBDataType`.to_s
while Time.now < Time.now + 10
    urmom1=try1.scan(/Product ID:/).count
    sleep(0.5)
    try2=`system_profiler SPUSBDataType`.to_s
    urmom2=try2.scan(/Product ID:/).count
    !(urmom2 == urmom1) ? (p "ur were fucked at #{Time.now}") : (p "all good")
end