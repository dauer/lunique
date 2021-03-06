# lunique #
Lua library for generating universally unique identifiers using libuuid.
lunique probably only works on Linux operating systems (testet using Ubuntu)...

lunique is very early in development, expect errors etc.

## Requirements ##
* lua5.1+
* liblua5.1-0-dev+
* uuid-dev
* luaunit (http://phil.freehackers.org/programs/luaunit/) only required if you want to run the unittests in the ./tests folder

## Documentation ##
Build the library using the Makefile in the ./src folder.

Then have a look at the 'example.lua' file to see how to use the library.

Or run the unittests: cd ./tests;./run-tests.lua

[UUID documentation](http://linux.die.net/man/3/uuid)

### Features implemented ###
<table>
    <tr>
        <th>UUID</th>
        <th>lunique</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>uuid_generate</td>
        <td>string generate()</td>
        <td>Create a new unique UUID (http://linux.die.net/man/3/uuid_generate)</td>
    </tr>
    <tr>
        <td>uuid_generate_time</td>
        <td>string generate_time()</td>
        <td>Create a new unique UUID (http://linux.die.net/man/3/uuid_generate)</td>
    </tr>
    <tr>
        <td>uuid_generate_time_safe</td>
        <td>string, int generate_time_safe()</td>
        <td>
            Create a new unique UUID and returns zero if it has been generated in a safe manner, -1 otherwise.
            (http://linux.die.net/man/3/uuid_generate)
        </td>
    </tr>
    <tr>
        <td>uuid_generate_random</td>
        <td>string generate_random()</td>
        <td>Create a new unique UUID (http://linux.die.net/man/3/uuid_generate)</td>
    </tr>
    <tr>
        <td>uuid_time</td>
        <td>int, int time(string uuid)</td>
        <td>
            Extract the time at which the UUID was created also returns integer indicating if UUID was valid
            (http://linux.die.net/man/3/uuid_time)
        </td>
    </tr>
    <tr>
        <td>uuid_compare</td>
        <td>int, int compare(string uuid1, string uuid2)</td>
        <td>
            Compare whether two UUIDs are the same (http://linux.die.net/man/3/uuid_compare).
            First return value is the result of the comparision, second return tells if any of the params are invalid (0 ok, -1 first param, -2 second param, -3 all parameters invalid)
         </td>
    </tr>
    <tr>
        <td>uuid_parse</td>
        <td>bool valid(string uuid)</td>
        <td>Validates if a specified string is a valid UUID (http://linux.die.net/man/3/uuid_parse)</td>
    </tr>
</table>
