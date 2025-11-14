class_name Healthbar
extends ProgressBar

@onready var timer : Timer = $Timer
@onready var damage_bar : ProgressBar = $Damagebar
@onready var label : Label = $Label

var health = 0 : set = _set_health

func _set_health(new_health):
	var prev_health = health
	health = min(max_value, new_health)
	update_display()
	
	if health <= 0:
		pass
	
	if health < prev_health:
		timer.start()
	else:
		damage_bar.value = health

func update_display():
	value = health
	label.text = str(int(value)) + "/" + str(int(max_value))

func init_health(_health):
	health = _health
	max_value = _health
	update_display()
	damage_bar.max_value = health
	damage_bar.value = health
	



func _on_timer_timeout() -> void:
	damage_bar.value = health
