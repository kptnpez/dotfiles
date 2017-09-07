#!/usr/bin/env python

"""
A little script to tag songs downloaded with youtube-dl 
from youtube. 

by @kptnpez
"""

import eyed3
from glob import glob
import os

def tagThis(filename):
    tmp = filename[:-16]
    artist, title = tmp.split('-', 1)
    
    audiofile = eyed3.load(filename)
    audiofile.tag.artist = unicode(artist, "utf-8")
    audiofile.tag.title = unicode(title, "utf-8")
    audiofile.tag.save()

    os.rename(filename, filename[:-16]+".mp3")

allsongs = glob("*.mp3")
for s in allsongs:
    print s
    tagThis(s)
