class_name Menu extends VBoxContainer

signal actioned(item: Control)
@export var pointer: Node
@export var pointer_player2: Node
var player1_index = 0 
var player2_index = 0 

func _ready() -> void:
	get_viewport().gui_focus_changed.connect(_on_focus_changed)
	configure_focus()

func _unhandled_input(event):
	if not visible: return
	get_viewport().set_input_as_handled() 
	var items = get_itens()
	if event.is_action_pressed("cima"):
		player2_index = max(player2_index - 1, 0)
		update_pointers()
	elif event.is_action_pressed("baixo"):
		player2_index = min(player2_index + 1, items.size() - 1)
		update_pointers()
	elif event.is_action_pressed("selecionar"):
		actioned.emit(items[player2_index])  # Player 2 confirma ação

func get_itens() -> Array[Control]:
	var itens: Array[Control] = []
	for child in get_children():
		if not child is Control: continue
		if "heading" in child.name: continue
		if "divider" in child.name: continue
		itens.append(child)
		
	return itens

func configure_focus()-> void:
	var itens = get_itens()
	for item in itens:
		item.focus_mode = Control.FOCUS_NONE

func _on_focus_changed(item: Control) -> void:
	if not item: return
	if not item in get_children(): return
	upgrade_Selection()

func upgrade_Selection(): #e update, errei
	update_pointers()
	
	
func get_focused_item() -> Control:
	var item = get_viewport().gui_get_focus_owner()
	return item if item in get_children() else null
	
func update_pointers() -> void:
	var items = get_itens()
	if pointer and player1_index < items.size():
		var item1 = items[player1_index]
		pointer.global_position = Vector2(global_position.x, item1.global_position.y + item1.size.y * 0.5)
	
	if pointer_player2 and player2_index < items.size():
		var item2 = items[player2_index]
		pointer_player2.global_position = Vector2(global_position.x + 200, item2.global_position.y + item2.size.y * 0.5)  # Ajuste para não sobrepor
