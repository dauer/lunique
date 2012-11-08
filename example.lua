package.cpath = package.cpath .. ";./lib/?.so"
require "lunique"

print(lunique.generate())
