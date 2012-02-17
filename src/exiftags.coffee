exec = require('child_process').exec

exports.tags = (path, callback)->
	#console.log "exiftags -avu -s ' | ' '#{path}'"
	exec "exiftags -avuqs '|' '#{path}'", (err, stdout, stderr)->
		if stdout
			lines = stdout.split "\n"
			result = {}
			for line in lines
				val = line.split '|'
				result[val[0]] = val[1] if val[1]
			callback null, result
		else if stderr
			callback
					type   : "stderr"
					message: stderr
		else if err
			callback
					type   : "error"
					message: err

