#!/usr/bin/python -tt
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Library General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
# copyright (c) 2008 Red Hat Inc - written by Seth Vidal

import os
import sys
import glob

transition_time = '10.0' # less than 10s makes them flick from one to the next
duration_time = '300.0' # probably should be 5+ minutes

# take a dir, iterate, look for all, jpg and png files
# generate xml for gnome rotation script
# print xml


def firstimg(img):
    msg = """
 <static>
  <duration>%s</duration>
  <file>%s</file>
 </static>

 <transition type="overlay">
  <duration>%s</duration>
  <from>%s</from>
""" % (duration_time, img, transition_time, img)
    return msg

def lastimg(img):
    msg = """  <to>%s</to>
 </transition>

 <static>
  <duration>%s</duration>
  <file>%s</file>
 </static>
""" % (img, duration_time, img)
    return msg
    
def middleimg(img):
    msg = """  <to>%s</to>
 </transition>

 <static>
  <duration>%s</duration>
  <file>%s</file>
 </static>

 <transition type="overlay">
  <duration>%s</duration>
  <from>%s</from>
""" % (img, duration_time, img, transition_time, img)
    return msg


def main(dirs):
    imgs = []
    for d in dirs:
        if not os.path.exists(d):
            continue
        for imgtype in ('*.jpg', '*.png'):
            g = os.path.join(d, imgtype)
            imgs.extend(glob.glob(g))

    msg ="""<background>"""
    msg += firstimg(imgs[0])
    for img in imgs[1:-1]:
        msg += middleimg(img)
    msg += lastimg(imgs[-1])
    msg += """</background>"""
    

    print msg                        
                 

if __name__ == "__main__":
    if len(sys.argv) == 1:
        print "Must give one directory of images\n"
        sys.exit(1)
        
    main(sys.argv[1:])

