extends Area2D

var is_player_in_range = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("interact"):
		$dia.visible = true
		print("ako ay nakikipagusap sayo tang ina mo!")



func _on_body_entered(body: Node2D) -> void:
	print("Body entered")
	is_player_in_range = true

func _on_body_exited(body: Node2D) -> void:
	print("Body exited")
	is_player_in_range = false
	$dia.visible = false
