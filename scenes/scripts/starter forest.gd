extends Node2D

signal chat_done()
signal chat_start()

func send_info(name,text):
	$CanvasLayer/DialogBox.set_actor_name(name)
	$CanvasLayer/DialogBox.queue_lines(text)


func _on_npc_dialog(name, text):
	send_info(name,text)
	chat_start.emit()


func _on_npc_2_dialog(name, text):
	send_info(name,text)
	chat_start.emit()

func _on_npc_3_dialog(name, text):
	send_info(name,text)
	chat_start.emit()


func _on_dialog_box_dialog_complete():
	chat_done.emit()
