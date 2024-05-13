extends Node2D
@onready var interaction_area = $InteractionArea
@onready var dialogue_box = $"../../Player/Control/DialogueBox"


# Called when the node enters the scene tree for the first time.
func _ready():
	if interaction_area != null:
		interaction_area.interact = Callable(self, "_on_interact")
	
func _on_interact():
	dialogue_box.start("ToastMonologue")
