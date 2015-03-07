########
# You need to install "youtube-dl" and "id3" first
# usage: python ytdl.py <file>
# <file> has to contain valid youtube links ONLY 
#
# author: pez
########

from sys import argv
import subprocess
import os

script , filename = argv
txt = open(filename)

for line in txt:
    subprocess.call(["youtube-dl","--extract-audio","--audio-format","mp3","--audio-quality","0",line[:-1]])

# Adding id3 tags
for i in os.listdir():
    if i[-3:]=="mp3":
        artist, title, hsh = i.split('-')
        subprocess.call(["id3","-a",artist,"-t",title,i])
        os.rename(i,artist+"-"+title+".mp3")
