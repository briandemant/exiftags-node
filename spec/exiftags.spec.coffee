exiftags = require '../lib/exiftags.js'

describe 'exiftags', ->
	it 'should export a tags function', ->
		expect(exiftags.tags).not.toBeUndefined()
		expect(typeof exiftags.tags).toBe("function")

describe 'get tags for valid image', ->
	it 'should call callback with tags', ->
		callback = jasmine.createSpy()
		runs ->
			exiftags.tags(__dirname + '/fixtures/map.jpg', callback)
		waits 50
		runs ->
			expect(callback).toHaveBeenCalledWith null,
					'Camera Software'        : 'Adobe Photoshop CS3 Windows',
					'Image Orientation'      : 'Top, Left-Hand',
					'Horizontal Resolution'  : '72 dpi',
					'Vertical Resolution'    : '72 dpi',
					'Image Created'          : '2007:09:19 14:04:30',
					'Color Space Information': 'Uncalibrated',
					'Image Width'            : '6400',
					'Image Height'           : '3200',
					'Resolution Unit'        : 'i',
					'Exif IFD Pointer'       : '164',
					'Compression Scheme'     : 'JPEG Compression (Thumbnail)',
					'Offset to JPEG SOI'     : '302',
					'Bytes of JPEG Data'     : '4608'

describe 'get tags for non existing path', ->
	it 'should call callback with error', ->
		callback = jasmine.createSpy()
		runs ->
			exiftags.tags('fixtures/xxx.jpg', callback)
		waits 10
		runs ->
			expect(callback).toHaveBeenCalledWith
					type   : 'stderr'
					message: "exiftags: No such file or directory (fixtures/xxx.jpg)\n"

describe 'get tags for image without exifdata', ->
	it 'should call callback with stderr', ->
		callback = jasmine.createSpy()
		runs ->
			exiftags.tags(__dirname + '/fixtures/noexif.jpg', callback)
		waits 10
		runs ->
			expect(callback).toHaveBeenCalledWith
					type   : 'stderr'
					message: "exiftags: couldn't find Exif data\n"
