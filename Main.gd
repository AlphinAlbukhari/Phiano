extends Node2D

var panner = AudioEffectPanner.new()
var reverb = AudioEffectReverb.new()
var amplify = AudioEffectAmplify.new()
var chorus = AudioEffectChorus.new()

func _ready():
	AudioServer.add_bus_effect(0, panner)
	AudioServer.add_bus_effect(0, reverb)
	AudioServer.add_bus_effect(0, chorus)
	AudioServer.add_bus_effect(0, amplify)
	pass # Replace with function body.

func _process(delta):
	$GridContainer.margin_right = get_viewport().size.x/1.931
	$GridContainer.margin_top = get_viewport().size.y - 314
	#Effects
	panner.pan = $VBoxContainer/Pan/HSlider.value
	reverb.room_size = $"VBoxContainer/Room Size/HSlider".value
	reverb.damping = $VBoxContainer/Damping/HSlider.value
	reverb.spread = $VBoxContainer/Spread/HSlider.value
	reverb.hipass = $VBoxContainer/Hipass/HSlider.value
	reverb.dry = $VBoxContainer/Dry/HSlider.value
	reverb.wet = $VBoxContainer/Wet/HSlider.value
	chorus.voice_count = $VBoxContainer/VoiceCount/HSlider.value
	chorus.dry = $VBoxContainer/ChDry/HSlider.value
	chorus.wet = $VBoxContainer/ChWet/HSlider.value
	amplify.volume_db = $"VBoxContainer/Master Volume/HSlider".value
	#Reverb
	AudioServer.set_bus_effect_enabled(0, 2, $VBoxContainer/Reverb/CheckBox.pressed)
	$"VBoxContainer/Room Size/HSlider".editable = $VBoxContainer/Reverb/CheckBox.pressed
	$VBoxContainer/Damping/HSlider.editable = $VBoxContainer/Reverb/CheckBox.pressed
	$VBoxContainer/Spread/HSlider.editable = $VBoxContainer/Reverb/CheckBox.pressed
	$VBoxContainer/Hipass/HSlider.editable = $VBoxContainer/Reverb/CheckBox.pressed
	$VBoxContainer/Dry/HSlider.editable = $VBoxContainer/Reverb/CheckBox.pressed
	$VBoxContainer/Wet/HSlider.editable = $VBoxContainer/Reverb/CheckBox.pressed
	#Chorus
	AudioServer.set_bus_effect_enabled(0, 3, $VBoxContainer/Chorus/CheckBox.pressed)
	$VBoxContainer/VoiceCount/HSlider.editable = $VBoxContainer/Chorus/CheckBox.pressed
	$VBoxContainer/ChDry/HSlider.editable = $VBoxContainer/Chorus/CheckBox.pressed
	$VBoxContainer/ChWet/HSlider.editable = $VBoxContainer/Chorus/CheckBox.pressed
