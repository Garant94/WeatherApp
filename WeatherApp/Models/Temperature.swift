import Foundation

struct Temperature: Codable, Equatable {
    let temp: Double
    let tempMax: Double
    let tempMin: Double
    
    private enum CodingKeys: String, CodingKey {
        case temp
        case tempMax = "temp_max"
        case tempMin = "temp_min"
    }
}
