extends CanvasLayer

signal start_game

@export var game_over_text = 'Game Over!'
@export var start_text = 'Dodge the Creeps!'

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

func show_game_over():
	show_message(game_over_text)

	await $MessageTimer.timeout

	$MessageLabel.text = start_text
	$MessageLabel.show()

	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)

func _on_start_button_pressed() -> void:
	$StartButton.hide()
	start_game.emit()

func _on_message_timer_timeout() -> void:
	$MessageLabel.hide()
