#!/usr/bin/env ruby
myDir=Dir.pwd
p myDir
filenames=Dir.children(myDir).select{|f| File.file?(f)}
p filenames
filenames.each do |filename|
    m=filename.match(/_\d+.txt/)
    ex=filename.scan('.rb').count
    if m==nil && ex==0
        name=filename.chomp(".txt")
        file=File.open(filename,"r")
        s=file.readlines.count
        arr=[name,"_",s,".txt"]
        arr=arr.join()
        File.rename(filename,arr)
    end
end