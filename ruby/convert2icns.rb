#/usr/bin/env irb

require "RMagicK"
require "FileUtils"

filename = ARGV[0]

image = Magick::Image::read(filename)
puts image[0]

image512r = image[0].resize(1024, 1024)
image512 = image[0].resize(512, 512)
image256 = image[0].resize(256, 256)
image128 = image[0].resize(128, 128)
image64 = image[0].resize(64, 64)
image32 = image[0].resize(32, 32)
image16 = image[0].resize(16, 16)

dirpath = filename.split(".")[0]+".iconset"

FileUtils::mkdir_p(dirpath)

image512r.write(dirpath+"/icon_512x512@2x.png")
image512.write(dirpath+"/icon_512x512.png")
image512.write(dirpath+"/icon_256x256@2x.png")
image256.write(dirpath+"/icon_256x256.png")
image256.write(dirpath+"/icon_128x128@2x.png")
image128.write(dirpath+"/icon_128x128.png")
image64.write(dirpath+"/icon_32x32@2x.png")
image32.write(dirpath+"/icon_32x32.png")
image32.write(dirpath+"/icon_16x16@2x.png")
image16.write(dirpath+"/icon_16x16.png")

cmd = 'iconutil -c icns "'+dirpath+'"'

puts cmd

exec cmd
