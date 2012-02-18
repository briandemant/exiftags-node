Exiftags for node.js
=============

A tiny wrapper around  [exiftags](http://johnst.org/sw/exiftags/) written in coffeescript but
usable from javascript (without coffeescript)


Usage
-----

It's very simplistic:

    var exiftags = require('exiftags');

    exiftags.read path_to_file, function(err, data) {
        if (err) throw err;
        console.log data;
    }



Installation
-----------

    npm install exiftags


Testing
-------

the tests are written in mocha and uses expect.js

    mocha spec/exiftags_spec.coffee


Contributing
------------

1. Fork it.
2. Create a branch (`git checkout -b my_branch`)
3. Commit your changes (`git commit -am "Added a sweet feature!"`)
4. Push to the branch (`git push origin my_branch`)
5. Send a pull request
6. Enjoy a refreshing Cup of Coffee® and wait