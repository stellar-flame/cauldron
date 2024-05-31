class_name AreaDimensions

extends Object

var x1;
var x2;
var y1;
var y2;

static func _new(x1, x2, y1, y2):
	var ad = AreaDimensions.new()
	ad.x1 = x1
	ad.x2 = x2
	ad.y1 = y1
	ad.y2 = y2
	return ad
	
