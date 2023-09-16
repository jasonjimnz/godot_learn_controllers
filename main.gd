extends Node2D

func call_env(ev, pressed, ev_index):
	"""
	This function will take event instance and some parameters
	
	The pressed argument will vary if it is a button or trigger,
	it has to be a boolean in order to let the function know if it
	is pressed or not
	
	The ev_index argument will take the index that the system 
	recognize from the Input Enum, useful for custom button 
	functionality
	"""
	print(ev.as_text() + " " + str(ev_index) + " " + str(pressed))
	if pressed:
		setInputMessage(ev.as_text())
	else:
		setInputMessage("")
	
func _input(event):
		
	if event is InputEventJoypadButton:
		call_env(event, event.pressed, event.button_index)
	elif event is InputEventJoypadMotion:
		call_env(event, event.axis_value  != 0.0, event.axis)
		

func _process(delta):
	pass

func setInputMessage(input_message):
	$CanvasLayer/InputMessage.text = input_message
