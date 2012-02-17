(function() {
  var exec;

  exec = require('child_process').exec;

  exports.tags = function(path, callback) {
    return exec("exiftags -avuqs '|' '" + path + "'", function(err, stdout, stderr) {
      var line, lines, result, val, _i, _len;
      if (stdout) {
        lines = stdout.split("\n");
        result = {};
        for (_i = 0, _len = lines.length; _i < _len; _i++) {
          line = lines[_i];
          val = line.split('|');
          if (val[1]) result[val[0]] = val[1];
        }
        return callback(null, result);
      } else if (stderr) {
        return callback({
          type: "stderr",
          message: stderr
        });
      } else if (err) {
        return callback({
          type: "error",
          message: err
        });
      }
    });
  };

}).call(this);
