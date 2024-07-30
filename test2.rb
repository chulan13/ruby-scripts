#!/usr/bin/env ruby
arr=Array.new
while Time.now < Time.now+10
    try=`ioreg -r -k AppleClamshellState -d 4 | grep AppleClamshellState  | head -1`.to_s
    try1=`pmset -g | grep lowpowermode`.to_s
    condom=try.scan("No").count
    condom1=try1.scan("1").count
    arr.append([condom, condom1])
    p "size: #{arr.size}"
    p "array: #{arr}"
    a=arr.rindex{|x| x==[1,0] || x==[1,1]}
    p a
    (0...arr.size).each do |i|
        if arr[i][0]==0 
            p('sudo pmset -a lowpowermode 1')
        elsif arr[i][0]==1 && arr[a]==[1,0]
            p('sudo pmset -a lowpowermode 0')
        end
    end
    sleep(0.5)
end