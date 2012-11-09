package.cpath = package.cpath .. ";./lib/?.so"
require "lunique"

-- Generate uinique id
u1 = lunique.generate()
print(u1)

-- Generate unique id with time
u2 = lunique.generate_time()
print(u2)
-- Get the time the UUID was generated
t1 = lunique.time(u2)
print(t1)
