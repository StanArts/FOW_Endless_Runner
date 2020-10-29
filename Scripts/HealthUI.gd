extends Control

var hearts = 3 setget set_hearts
var max_hearts = 3 setget set_max_hearts

onready var heartUIFull = $HeartsUIFull
onready var heartUIEmpty = $HeartsUIEmpty

func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	if heartUIFull != null:
		heartUIFull.rect_size.x = hearts * 16

func set_max_hearts(value):
	max_hearts = max(value, 1)
	if heartUIEmpty != null:
		heartUIEmpty.rect_size.x = max_hearts * 16

func _ready():
	self.max_hearts = Globals.max_health
	self.hearts = Globals.health
	Globals.connect("health_changed", self, "set_hearts")