# smtp.nse
nmap after vps server scans results send this results in my email par lua
run shell linux server like vps Shell$ with ./root/ directorie 
the xxxxxx passwd is your email authorization code not login password
shell$ nmap -p-<TARGET> --script smtp -oG 1.txt

send email exemple:
# Nmap 7.92 scan initiated Tue Oct  4 14:22:04 2022 as: nmap -p 80 --script smtp -oG 1.txt 185.54.228.134
Host: 185.54.228.134 ()	Status: Up
Host: 185.54.228.134 ()	Ports: 80     filtered     tcp          http 
