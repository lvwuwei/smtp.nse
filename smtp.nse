local shortport = require "shortport"
local smtp = require "smtp"

description = [[send the scan result use smtp]]
author = "reborn"
license = "Same as Nmap--See http://nmap.org/book/man-legal.html"
categories = {"default"}
--[[
    example:nmap <TARGET> --script smtp -oG 1.txt
    1.txt is the smtp.nse use ,if you want replace or rename , modify the code.
]]

postrule = function () return true end
action = function(host, port)
    local socket,resp = smtp.connect("smtp.163.com",25,{ssl = false,recv_before = true})

    if ( not(socket) ) then return fail("Failed to connect to SMTP server") end
    local st, resp =smtp.ehlo(socket,"smtp.163.com")
    local status, err =smtp.login(socket,"lvwuwei@163.com","xxxxxxxxxxx","LOGIN")
    if(status) then
        local mail_st,mail_response = smtp.mail(socket,"lvwuwei@163.com",nil)

        local recipient_st,recipient_response = smtp.recipient(socket,"lvwuwei@163.com")
        local result = ''
        for line in io.lines("/root/1.txt") do
            line = string.gsub(line,"/","     ")
            line = string.gsub(line,",","\r\n")
            result = result .. line .. "\r\n"
        end    
        senddata="subject:The scan result\r\n" .. "from:reborn\r\n" .."\r\n".. result
        local st2 ,resp2 = smtp.datasend(socket,senddata)  
        print(st2,resp2)
        smtp.quit(socket)
        socket:close()
    end
    return "send mail test...."
end
