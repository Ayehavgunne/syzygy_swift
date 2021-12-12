import Raylib

let TITLE = "Syzygy"

enum GameState {
    case LOADING
	case ON_MAIN_MENU
	case ON_ESCAPE_MENU
	case ON_GAME_MENU
	case IN_TOWN
	case IN_DUNGEON
	case IN_WORLD_MAP
	case IN_BATTLE
	case IN_CUTSCENE
	case PAUSED
	case QUIT
}

struct Game {
	var state: GameState
	let window: Window
	var config: Config
	var is_running = true
	var delta_time: Double = 0
	var adjusted_delta_time: Double = 0

	init() {
		state = .IN_BATTLE
		do {
			config = try read_config_file()
		}
		catch {
			print("Failed to load configs from file, using default values")
			config = Config(
				graphics: Config.Graphics(resolution: Config.Graphics.Resolution())
			)
		}
		window = Window(config: config, title: TITLE)
	}

	mutating func loop() {
		Raylib.setTargetFPS(config.graphics.target_framerate)
		var last_time = Raylib.getTime()

		while Raylib.windowShouldClose == false {
			let current = Raylib.getTime()
			delta_time = current - last_time
			adjusted_delta_time = delta_time * 60

			handle_input()
			update()

			last_time = current
		}
	}

	func handle_input() {
		handle_key_pressed();
		handle_key_down();
	}

	func handle_key_pressed() {
		// Raylib.isKeyPressed(.right)
	}

	func handle_key_down() {
		// Raylib.isKeyDown(.right)
	}

	func clean() {
		window.clean()
	}

	func update() {
		window.render()
	}

	mutating func run() {
		loop()
		clean()
	}
}
