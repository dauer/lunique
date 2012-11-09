# lunique #
Lua library for generating universally unique identifiers using libuuid.
lunique probably only works on Linux operating systems (testet using Ubuntu)...

lunique is very early in development, expect errors etc.

## Requirements ##
* lua 5.1+
* uuid-dev

## Documentation ##
Build the library using the Makefile in the ./src folder.

Then have a look at the 'example.lua' file to see how to use the library.

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
    	<td>uuid_time</td>
    	<td>time</td>
    </tr>
</table>

## Todo ##
* Implement more functions from the UUID library
* Do thorough testing (unittests...)
* Write better documentation
