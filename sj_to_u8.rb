#!/usr/bin/env ruby

pathfiles = ARGV
pathfiles.each do |pathfile|
    pathfile =~ /(.*?)([^\/]+\.[a-zA-Z]+)$/
    path = $1 || '' 
    filename = $2
    open(path + (f = filename.split("."))[0] + "_utf8_." + f[1],"w"){|file_encoded|
        open(path + filename,"rt:shift_jis:utf-8"){|file|
            file_encoded << file.read(nil)
        }
    }
end
