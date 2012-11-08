#include <uuid/uuid.h>
#include "lauxlib.h"

static int Lgenerate(lua_State *L);

static const luaL_Reg API[] = {
    { "generate", Lgenerate },
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

int luaopen_lunique(lua_State *L) {
    luaL_register(L, "lunique", API);
    lua_settable(L, -1);
    return 1;
}
