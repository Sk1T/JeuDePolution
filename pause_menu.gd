extends CanvasLayer

var previous_music_value: float = 50.0
var previous_sfx_value: float = 50.0
var is_muted: bool = false

func _ready() -> void:
	hide()
	$SettingsPanel.hide()
	$Background/VBoxContainer.show()

	_apply_music_volume($SettingsPanel/MusicSlider.value)
	_apply_sfx_volume($SettingsPanel/SFXSlider.value)
	_update_mute_button_text()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		toggle_pause()

func toggle_pause() -> void:
	var is_paused: bool = !get_tree().paused
	get_tree().paused = is_paused
	visible = is_paused

	if visible:
		$SettingsPanel.hide()
		$Background/VBoxContainer.show()

func _on_continue_button_pressed() -> void:
	toggle_pause()

func _on_settings_button_pressed() -> void:
	$Background/VBoxContainer.hide()
	$SettingsPanel.show()

func _on_back_settings_pressed() -> void:
	$SettingsPanel.hide()
	$Background/VBoxContainer.show()

func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false
	visible = false
	$SettingsPanel.hide()
	$Background/VBoxContainer.show()
	get_tree().change_scene_to_file("res://scene/menu.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_music_slider_value_changed(value: float) -> void:
	if value > 0.0:
		previous_music_value = value

	_apply_music_volume(value)
	_update_mute_button_text()

func _on_sfx_slider_value_changed(value: float) -> void:
	if value > 0.0:
		previous_sfx_value = value

	_apply_sfx_volume(value)
	_update_mute_button_text()

func _on_mute_button_pressed() -> void:
	var music_slider: HSlider = $SettingsPanel/MusicSlider
	var sfx_slider: HSlider = $SettingsPanel/SFXSlider

	if not is_muted:
		previous_music_value = music_slider.value
		previous_sfx_value = sfx_slider.value
		music_slider.value = 0.0
		sfx_slider.value = 0.0
		is_muted = true
	else:
		music_slider.value = previous_music_value
		sfx_slider.value = previous_sfx_value
		is_muted = false

	_apply_music_volume(music_slider.value)
	_apply_sfx_volume(sfx_slider.value)
	_update_mute_button_text()

func _apply_music_volume(value: float) -> void:
	var bus_index: int = AudioServer.get_bus_index("Music")
	if bus_index == -1:
		return

	if value <= 0.0:
		AudioServer.set_bus_volume_db(bus_index, -80.0)
	else:
		AudioServer.set_bus_volume_db(bus_index, linear_to_db(value / 100.0))

func _apply_sfx_volume(value: float) -> void:
	var bus_index: int = AudioServer.get_bus_index("SFX")
	if bus_index == -1:
		return

	if value <= 0.0:
		AudioServer.set_bus_volume_db(bus_index, -80.0)
	else:
		AudioServer.set_bus_volume_db(bus_index, linear_to_db(value / 100.0))

func _update_mute_button_text() -> void:
	var music_value: float = $SettingsPanel/MusicSlider.value
	var sfx_value: float = $SettingsPanel/SFXSlider.value

	if music_value <= 0.0 and sfx_value <= 0.0:
		is_muted = true
		$SettingsPanel/MuteButton.text = "Unmute"
	else:
		is_muted = false
		$SettingsPanel/MuteButton.text = "Mute"
