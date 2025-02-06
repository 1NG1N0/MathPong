extends Area2D

signal fezgol

func _on_body_entered(body):
	if body is Ball:
		fezgol.emit()
