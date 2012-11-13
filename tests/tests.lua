package.cpath = package.cpath .. ";../lib/?.so"
require "lunique"
require "luaunit"

function valid(uuid)
    local len = string.len(uuid)
    local pos = string.find(uuid, '[^a-f0-9-]')
    return len, pos
end

Testing = {}

function Testing:testGenerate()
    -- It is hard to test if the string is unique...
    -- I test that the length is 36 and that the string only contains
    -- letters: a-z
    -- numbers: 0-9
    -- dashes: -
    local uuid = lunique.generate()
    local len, pos = valid(uuid)
    assertEquals(len, 36)
    assertEquals(pos, nil)
end

function Testing:testGenerateTime()
    -- This test might fail, I can't be 100% sure the time is not off by a
    -- second. Maybe I should change to test if diff < X number of seconds...
    local uuid = lunique.generate_time()
    local t = os.date('*t')
    local len, pos = valid(uuid)
    local time1 = os.time(t)
    local time2, valid = lunique.time(uuid)
    assertEquals(len, 36)
    assertEquals(pos, nil)
    assertEquals(time1, time2)
    assertEquals(valid, 0)
end

function Testing:testGenerateTimeSafe()
    -- This test might fail, I can't be 100% sure the time is not off by a
    -- second. Maybe I should change to test if diff < X number of seconds...
    local uuid, status = lunique.generate_time_safe()
    local t = os.date('*t')
    local len, pos = valid(uuid)
    local time1 = os.time(t)
    local time2, valid = lunique.time(uuid)
    status = (status == -1 or status == 0)
    assertEquals(len, 36)
    assertEquals(pos, nil)
    assertEquals(time1, time2)
    assertEquals(status, true)
    assertEquals(valid, 0)
end

function Testing:testGenerateRandom()
    local uuid = lunique.generate_random()
    local len, pos = valid(uuid)
    assertEquals(len, 36)
    assertEquals(pos, nil)
end

function Testing:testTime()
    -- UUID is generated Thu Nov 8 13:36:36 2012
    local time1 = 1352381796
    local time2, valid = lunique.time("51715676-29a9-11e2-8668-001a4b53924b")
    assertEquals(time1, time2)
    assertEquals(valid, 0)
end

function Testing:testCompare()
    local uuid1 = "778d279d-dad5-4d32-b2a6-d325affeadbf"
    local uuid2 = "833fb502-51eb-412c-800e-03902045e0cb"
    local eq = lunique.compare(uuid1, uuid1)
    local lt = lunique.compare(uuid1, uuid2)
    local gt = lunique.compare(uuid2, uuid1)
    assertEquals(eq, 0)
    assertEquals(lt, -1)
    assertEquals(gt, 1)
end

function Testing:testValid()
    local result
    -- Test a hardcoded valid, invalid and empty uuid string
    result  = lunique.valid("778d279d-dad5-4d32-b2a6-d325affeadbf")
    assertEquals(result, true)
    result = lunique.valid("778d279d+dad5-4d32-b2a6-d325affeadbf")
    assertEquals(result, false)
    result = lunique.valid("")
    assertEquals(result, false)
    -- Test all the uuid generator functions
    result = lunique.valid(lunique.generate())
    assertEquals(result, true)
    result = lunique.valid(lunique.generate_time())
    assertEquals(result, true)
    result = lunique.valid(lunique.generate_time_safe())
    assertEquals(result, true)
    result = lunique.valid(lunique.generate_random())
    assertEquals(result, true)
end

LuaUnit:run()
