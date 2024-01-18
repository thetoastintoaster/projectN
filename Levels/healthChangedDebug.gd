extends Control

@export var healthChangedLabel : PackedScene
@export var damageColor : Color = Color.DARK_RED
@export var healColor : Color = Color.DARK_GREEN

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.connect("onHealthChanged", onSignalHealthChanged)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func onSignalHealthChanged(node: Node, amountChanged : int):
	var labelInstance : Label = healthChangedLabel.instantiate()
	node.add_child(labelInstance)
	labelInstance.text = str(amountChanged)

	if(amountChanged >= 0):
		labelInstance.modulate = healColor
	else:
		labelInstance.modulate = damageColor
