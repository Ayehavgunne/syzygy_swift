import Raylib

struct Window {
    let config: Config
    init(config: Config, title: String) {
        self.config = config
        Raylib.initWindow(
            config.graphics.resolution.width,
            config.graphics.resolution.height,
            title
        )
    }

    func render() {
        Raylib.beginDrawing()
        Raylib.clearBackground(.rayWhite)
        if config.show_fps {
            Raylib.drawFPS(10, 10)
        }
        Raylib.endDrawing()
    }

    func clean() {
        Raylib.closeWindow()
    }
}
