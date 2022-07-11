extends Area2D


@export var speed := 50

var moving := false

@onready var sprite: Sprite2D = $Sprite
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _process(delta: float) -> void:
	moving = false
	if Input.is_action_pressed("ui_left"):
		sprite.flip_h = true
		_move(-speed * delta, 0)
	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = false
		_move(speed * delta, 0)
	if Input.is_action_pressed("ui_up"):
		_move(0, -speed * delta)
	if Input.is_action_pressed("ui_down"):
		_move(0, speed * delta)
	
	if moving:
		animation_player.play("run")
	else:
		animation_player.play("idle")


func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	scale *= 1.1


func _move(x_speed: float, y_speed: float):
	position.x += x_speed
	position.y += y_speed
	moving = true
