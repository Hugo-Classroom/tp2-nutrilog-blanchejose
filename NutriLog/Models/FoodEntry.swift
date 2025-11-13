import Foundation
import SwiftData


@Model
class FoodEntry: Identifiable {
    var date: Date
    var servingSize: Double // en grammes
    var mealType: MealType
    
    var food: Food?
    
    init(food: Food?, servingSize: Double, mealType: MealType, date: Date = .now) {
        self.food = food
        self.servingSize = servingSize
        self.mealType = mealType
        self.date = date
    }

    // Calculs des macros
    var calories: Double {
        guard let food else { return 0 }
        return food.calories * servingSize / 100
    }
    
    var protein: Double {
        guard let food else { return 0 }
        return food.protein * servingSize / 100
    }
    
    var carbs: Double {
        guard let food else { return 0 }
        return food.carbs * servingSize / 100
    }
    
    var fat: Double {
        guard let food else { return 0 }
        return food.fat * servingSize / 100
    }
}
