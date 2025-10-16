import Foundation

enum MealType: String, CaseIterable, Identifiable, Codable {
    case breakfast = "Déjeuner"
    case lunch = "Dîner"
    case dinner = "Souper"
    
    var id: String { rawValue }
}
