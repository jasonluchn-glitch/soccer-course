extends Panel


func _process(delta: float) -> void:
	if Input.is_physical_key_pressed(KEY_P):
		show()
		get_tree().create_timer(5).timeout.connect(hide)
		
