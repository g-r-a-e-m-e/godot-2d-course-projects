extends Control

# Reference score node
@onready var score_label = $score

# Reference lives node
@onready var lives_label = $lives_label

func set_score_label(new_score):
	score_label.text = "SCORE: " + str(new_score)

func set_lives_label(new_lives):
	lives_label.text = "x " + str(new_lives)
