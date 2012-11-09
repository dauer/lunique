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

-- Generate unique id with time safe
u3, r1 = lunique.generate_time_safe()
print(u3, r1)
-- Get the time the UUID was generated
t2 = lunique.time(u3)
print(t2)
