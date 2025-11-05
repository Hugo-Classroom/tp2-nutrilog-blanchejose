import Foundation

enum MealType: String, CaseIterable, Identifiable, Codable {
    case breakfast = "DÉJEUNER"
    case lunch = "DÎNER"
    case dinner = "SOUPER"
    
    var id: String { rawValue }
}
