import Foundation

extension MockData {

    static let foodEntries: [FoodEntry] = [
        FoodEntry(food: oatmeal, servingSize: 80, mealType: .breakfast, date: Date().addingTimeInterval(-3600)),
        FoodEntry(food: banana, servingSize: 100, mealType: .breakfast, date: Date().addingTimeInterval(-3500)),
        FoodEntry(food: boiledEgg, servingSize: 60, mealType: .breakfast, date: Date().addingTimeInterval(-3400)),
        FoodEntry(food: rice, servingSize: 150, mealType: .lunch, date: Date().addingTimeInterval(-7200)),
        FoodEntry(food: grilledSalmon, servingSize: 180, mealType: .lunch, date: Date().addingTimeInterval(-7100)),
        FoodEntry(food: broccoli, servingSize: 100, mealType: .lunch, date: Date().addingTimeInterval(-7000)),

        FoodEntry(food: proteinFood, servingSize: 200, mealType: .dinner, date: Date().addingTimeInterval(-10800)),
        FoodEntry(food: sweetPotato, servingSize: 150, mealType: .dinner, date: Date().addingTimeInterval(-10700)),
        FoodEntry(food: spinach, servingSize: 80, mealType: .dinner, date: Date().addingTimeInterval(-10600)),

 
    ]
}
