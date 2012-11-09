#include <uuid/uuid.h>
#include "lauxlib.h"

static int Lgenerate(lua_State *L);
static int Lgenerate_time(lua_State *L);
static int Lgenerate_time_safe(lua_State *L);
static int Ltime(lua_State *l);

static const luaL_Reg API[] = {
    { "generate", Lgenerate },
	{ "generate_time", Lgenerate_time },
	{ "generate_time_safe", Lgenerate_time_safe },
	{ "time", Ltime },
    { NULL, NULL }
};

static int Lgenerate(lua_State *L) {
    uuid_t uuid;
    char str[37];
    uuid_generate(uuid);
    uuid_unparse(uuid, str);
    lua_pushlstring(L, str, sizeof(str));
    return 1;
}

static int Lgenerate_time(lua_State *L) {
    uuid_t uuid;
    char str[37];
    uuid_generate_time(uuid);
    uuid_unparse(uuid, str);
    lua_pushlstring(L, str, sizeof(str));
    return 1;
}

static int Lgenerate_time_safe(lua_State *L) {
    uuid_t uuid;
    char str[37] = "";
    int ret;
    ret = uuid_generate_time_safe(uuid);
    uuid_unparse(uuid, str);
    lua_pushlstring(L, str, sizeof(str));
    lua_pushinteger(L, ret);
    return 2;
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

int luaopen_lunique(lua_State *L) {
    luaL_register(L, "lunique", API);
    lua_settable(L, -1);
    return 1;
}
