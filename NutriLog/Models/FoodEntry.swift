import Foundation
import SwiftData

@Model
class FoodEntry {
    var date: Date
    var servingSize: Double // en grammes 
    var food: Food?
    var mealType: MealType
    
    init(food: Food?, servingSize: Double, mealType: MealType, date: Date = .now) {
        self.food = food
        self.servingSize = servingSize
        self.mealType = mealType
        self.date = date
    }

    // Exemple de calcul pour déterminer le nombre de calories de l'aliment par 100g de portion
    var calories: Double {
        guard let food else { return 0 }
        return food.calories * servingSize / 100
    }
}
