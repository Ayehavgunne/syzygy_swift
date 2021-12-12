import Foundation
import Yams

struct Config: Codable {
    var debug = false
    var show_fps = true
    struct Graphics: Codable {
        var target_framerate: Int32 = 600
        var fullscreen = false
        var hardware_acceleration = false
        var vsync = false
        var scaled = true
        struct Resolution: Codable {
            var width: Int32 = 1920
            var height: Int32 = 1080
        }
        var resolution: Resolution
    }
    var graphics: Graphics
}

func read_config_file() throws -> Config {
    let decoder = YAMLDecoder()
    let url = URL(fileURLWithPath: "syzygy.yaml")
    let data = try Data(contentsOf: url)
    return try decoder.decode(Config.self, from: data)
}
