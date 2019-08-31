extends Button

var ps = 0 #ps = pitch scale

func _ready():
	ps = $AudioStreamPlayer.pitch_scale
	pass # Replace with function body.
	
func _process(delta):
	$AudioStreamPlayer.pitch_scale = ps + $"../../../VBoxContainer/Pitch/HSlider".value


func _on_Q_button_down():
	$AudioStreamPlayer.play()

