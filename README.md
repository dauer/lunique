# lunique #
Lua library for generating universally unique identifiers using libuuid.
lunique probably only works on Linux operating systems (testet using Ubuntu)...

lunique is very early in development, expect errors etc.

## Requirements ##
* lua 5.1+
* uuid-dev
* luaunit (http://phil.freehackers.org/programs/luaunit/) only required if you want to run the unittests in the ./tests folder

## Documentation ##
Build the library using the Makefile in the ./src folder.

Then have a look at the 'example.lua' file to see how to use the library.

Or run the unittests: cd ./tests;./run-tests.lua

### Features implemented ###
<table>
    <tr>
        <th>UUID</th>
        <th>lunique</th>
    </tr>
    <tr>
        <td>uuid_generate</td>
        <td>generate</td>
    </tr>
    <tr>
    	<td>uuid_generate_time</td>
    	<td>generate_time</td>
    </tr>
    <tr>
    	<td>uuid_generate_time_safe</td>
    	<td>generate_time_safe</td>
    </tr>
    <tr>
    	<td>uuid_generate_random</td>
    	<td>generate_random</td>
    </tr>
    <tr>
    	<td>uuid_time</td>
    	<td>time</td>
    </tr>
    <tr>
    	<td>uuid_compare</td>
    	<td>compare</td>
    </tr>

</table>

## Todo ##
* Do thorough testing
* Write better documentation
