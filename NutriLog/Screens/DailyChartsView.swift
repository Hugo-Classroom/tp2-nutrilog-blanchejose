import SwiftUI
import Charts

struct DailyChartsView: View {
    var foodEntries: [FoodEntry]
    
    let mealColors: [MealType: Color] = [
        .breakfast: .orange,
        .lunch: .green,
        .dinner: .blue
    ]
    
    struct PerMealData: Identifiable {
        let meal: MealType
        let calories: Double
        var id: MealType { meal }
    }
    var caloriesByMeal: [PerMealData] {
        MealType.allCases.map { type in
            PerMealData(meal: type, calories:
                foodEntries.filter { $0.mealType == type }
                           .reduce(0) { $0 + $1.calories })
        }
    }
    
    struct Macro: Identifiable {
        let id = UUID()
        let name: String
        let value: Double
        let color: Color
    }
    var macrosData: [Macro] {
        [
            Macro(name: "Protéines", value: totalProtein, color: .red),
            Macro(name: "Glucides", value: totalCarbs, color: .purple),
            Macro(name: "Lipides", value: totalFat, color: .blue)
        ]
    }
    var totalProtein: Double {
        foodEntries.reduce(0) { $0 + ($1.food?.protein ?? 0) * $1.servingSize/100 }
    }
    var totalCarbs: Double {
        foodEntries.reduce(0) { $0 + ($1.food?.carbs ?? 0) * $1.servingSize/100 }
    }
    var totalFat: Double {
        foodEntries.reduce(0) { $0 + ($1.food?.fat ?? 0) * $1.servingSize/100 }
    }
    
    struct FoodPortion: Identifiable {
        let name: String
        let serving: Double
        var id: String { name }
    }
    var foodsPortionData: [FoodPortion] {
        let grouped = Dictionary(grouping: foodEntries) { $0.food?.name ?? "-" }
        return grouped.map { (name, entries) in
            FoodPortion(
                name: name,
                serving: entries.reduce(0) { $0 + $1.servingSize }
            )
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 35) {
                Text("Graphiques")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.leading, 18)
                    .padding(.top, 8)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Calories par repas")
                        .font(.headline)
                        .padding(.horizontal, 20)
                    Chart {
                        ForEach(caloriesByMeal) { item in
                            BarMark(
                                x: .value("Repas", item.meal.rawValue),
                                y: .value("Cal", item.calories)
                            )
                            .foregroundStyle(mealColors[item.meal] ?? .gray)
                        }
                    }
                    .frame(height: 200)
                    .padding(.horizontal)
                    HStack(spacing: 22) {
                                           Label("Protéines", systemImage: "circle.fill")
                                               .foregroundColor(.orange)
                                           Label("Glucides", systemImage: "circle.fill")
                                               .foregroundColor(.green)
                                           Label("Lipides", systemImage: "circle.fill")
                                               .foregroundColor(.blue)
                                       }
                                       .font(.caption)
                                       .padding(.leading, 18)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Macros Totaux")
                        .font(.headline)
                        .padding(.horizontal, 20)
                    Chart {
                        ForEach(macrosData) { macro in
                            SectorMark(
                                angle: .value(macro.name, macro.value)
                            )
                            .foregroundStyle(macro.color)
                        }
                    }
                    .frame(height: 180)
                    .padding(.horizontal)
                    
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Distribution des aliments")
                        .font(.headline)
                        .padding(.horizontal, 20)
                    Chart {
                        ForEach(foodsPortionData) { portion in
                            BarMark(
                                x: .value("Quantité", portion.serving),
                                y: .value("Aliment", portion.name)
                            )
                            .annotation(position: .trailing) {
                                Text("\(Int(portion.serving))g")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            .foregroundStyle(Color.orange)
                        }
                    }
                    .frame(height: CGFloat(max(100, foodsPortionData.count * 32)))
                    .padding(.horizontal)
                }
                Spacer(minLength: 40)
            }
        }
        .navigationTitle("Graphiques")
    }
}

#Preview {
    DailyChartsView(foodEntries: MockData.foodEntries)
}
