extends Control

# Reference final_score node
@onready var final_score_label = $Panel/final_score

func set_final_score_label(final_score):
	final_score_label.text = "SCORE: " + str(final_score)

func _on_retry_button_pressed():
	get_tree().reload_current_scene()
