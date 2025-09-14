extends Node

# Adds a toggle under the Accessibility menu to uninvert Tachi aim

const MOD_DIR := "Blackwater-TachiAimChange"
const LOG_NAME := "Blackwater-TachiAimChange:Main"

var mod_dir_path := ""
var extensions_dir_path := ""
var translations_dir_path := ""


func _init() -> void:
	ModLoaderLog.info("Init", LOG_NAME)
	mod_dir_path = ModLoaderMod.get_unpacked_dir().path_join(MOD_DIR)
	
	install_script_extensions()
	install_script_hook_files()

func install_script_extensions() -> void:
	extensions_dir_path = mod_dir_path.path_join("extensions")
	
	# Adds the toggle button
	ModLoaderMod.install_script_extension(extensions_dir_path.path_join("Scripts/Menus/AccessibilityPanel.gd"))
	# Adds the flag that tracks the toggle, and the functinoality to save/load the flag to/from the save file
	ModLoaderMod.install_script_extension(extensions_dir_path.path_join("Globals/SaveManager.gd"))

func install_script_hook_files() -> void:
	extensions_dir_path = mod_dir_path.path_join("extensions")
	
	# Changes trajectory of saber based on aim inversion toggle
	ModLoaderMod.install_script_hooks("res://Scripts/Hosts/SaberBot/ControlledSaber.gd", extensions_dir_path.path_join("Scripts/Hosts/SaberBot/ControlledSaber.hooks.gd"))
	# Changes direction of AI Tachi aim to be consistent with the trajectory of the saber
	ModLoaderMod.install_script_hooks("res://Scripts/Hosts/SaberBot/SaberBotAI.gd", extensions_dir_path.path_join("Scripts/Hosts/SaberBot/SaberBotAI.hooks.gd"))

func _ready() -> void:
	ModLoaderLog.info("Ready", LOG_NAME)


