package.cpath = package.cpath .. ";./lib/?.so"
require "lunique"

-- Generate uinique id
u1 = lunique.generate()
print("----- generate() -----")
print(u1)

-- Generate unique id with time
u2 = lunique.generate_time()
print("----- generate_time() -----")
print(u2)
-- Get the time the UUID was generated
t1 = lunique.time(u2)
print(t1)

-- Generate unique id with time safe
u3, r1 = lunique.generate_time_safe()
print("----- generate_time_safe() -----")
print(u3, r1)
-- Get the time the UUID was generated
t2 = lunique.time(u3)
print(t2)

-- Generate random uinique id
u4 = lunique.generate_random()
print("----- generate_random() -----")
print(u4)

-- Compare 2 uuid's
c1 = lunique.compare(u3, u4)
c2 = lunique.compare(u4, u3)
c3 = lunique.compare(u4, u4)
print("----- compare() -----")
print(c1)
print(c2)
print(c3)
