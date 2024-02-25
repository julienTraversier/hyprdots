from PIL import Image, ImageStat
from sys import argv,exit

def brightness( im_file:str ):
   im = Image.open(im_file).convert('L')
   stat = ImageStat.Stat(im)
   return stat.mean[0]


if __name__ == '__main__':
   pathToFile = argv[1]
   b = brightness(pathToFile)
   if b < 125 :
      exit("0")
   else:
      exit("1")
 
