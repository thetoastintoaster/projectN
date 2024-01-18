extends Node

class_name State

@export var can_move : bool = true

var character: CharacterBody2D
var playback: AnimationNodeStateMachinePlayback
var nextState : State

signal interrupt_state(new_state : State)

func state_process(delta):
	pass
	
func state_input(event):
	pass

func onEnter():
	pass
	
func onExit():
	pass
