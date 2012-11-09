#include <uuid/uuid.h>
#include "lauxlib.h"

#define UUID_LEN 37

static int Lgenerate(lua_State *L);
static int Lgenerate_time(lua_State *L);
static int Lgenerate_time_safe(lua_State *L);
static int Lgenerate_random(lua_State *L);
static int Ltime(lua_State *L);
static int Lcompare(lua_State *L);

static const luaL_Reg API[] = {
    { "generate", Lgenerate },
    { "generate_time", Lgenerate_time },
    { "generate_time_safe", Lgenerate_time_safe },
    { "generate_random", Lgenerate_random },
    { "time", Ltime },
    { "compare", Lcompare },
    { NULL, NULL }
};

static int Lgenerate(lua_State *L) {
    uuid_t uuid;
    char str[UUID_LEN];
    uuid_generate(uuid);
    uuid_unparse(uuid, str);
    lua_pushlstring(L, str, sizeof(str));
    return 1;
}

static int Lgenerate_time(lua_State *L) {
    uuid_t uuid;
    char str[UUID_LEN];
    uuid_generate_time(uuid);
    uuid_unparse(uuid, str);
    lua_pushlstring(L, str, sizeof(str));
    return 1;
}

static int Lgenerate_time_safe(lua_State *L) {
    uuid_t uuid;
    char str[UUID_LEN];
    int ret;
    ret = uuid_generate_time_safe(uuid);
    uuid_unparse(uuid, str);
    lua_pushlstring(L, str, sizeof(str));
    lua_pushinteger(L, ret);
    return 2;
}

static int Lgenerate_random(lua_State *L) {
    uuid_t uuid;
    char str[UUID_LEN];
    uuid_generate_random(uuid);
    uuid_unparse(uuid, str);
    lua_pushlstring(L, str, sizeof(str));
    return 1;
}

static int Ltime(lua_State *L) {
    uuid_t uuid;
    struct timeval ret_tv;
    time_t t;
    const char *in = luaL_checkstring(L, 1);
    uuid_parse(in, uuid);
    t = uuid_time(uuid, &ret_tv);
    lua_pushinteger(L, (unsigned int)t);
    return 1;
}

static int Lcompare(lua_State *L) {
    uuid_t uuid1;
    uuid_t uuid2;
    int compare;
    const char *ustr1 = luaL_checkstring(L, 1);
    const char *ustr2 = luaL_checkstring(L, 2);
    uuid_parse(ustr1, uuid1);
    uuid_parse(ustr2, uuid2);
    compare = uuid_compare(uuid1, uuid2);
    lua_pushinteger(L, compare);
    return 1;
}

int luaopen_lunique(lua_State *L) {
    luaL_register(L, "lunique", API);
    lua_settable(L, -1);
    return 1;
}
