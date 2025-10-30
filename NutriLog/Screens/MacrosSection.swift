
import SwiftUI

struct MacrosSection: View {
    let foodEntries: [FoodEntry]
    let proteinGoal: Double = 150
    let carbsGoal: Double = 125
    let fatGoal: Double = 100

    var protein: Double {
        foodEntries.reduce(0) { $0 + (($1.food?.protein ?? 0) * $1.servingSize / 100) }
    }
    var carbs: Double {
        foodEntries.reduce(0) { $0 + (($1.food?.carbs ?? 0) * $1.servingSize / 100) }
    }
    var fat: Double {
        foodEntries.reduce(0) { $0 + (($1.food?.fat ?? 0) * $1.servingSize / 100) }
    }

    var body: some View {
        HStack(spacing: 18) {
            macroPill(color: .red, title: "Protéines", value: protein, goal: proteinGoal, icon: "p.circle.fill")
            macroPill(color: .purple, title: "Glucides", value: carbs, goal: carbsGoal, icon: "g.circle.fill")
            macroPill(color: .blue, title: "Lipides", value: fat, goal: fatGoal, icon: "l.circle.fill")
        }
        .padding(.horizontal)
    }

    func macroPill(color: Color, title: String, value: Double, goal: Double, icon: String) -> some View {
        VStack(alignment: .center, spacing: 2) {
            HStack(spacing: 4) {
                Image(systemName: icon).foregroundColor(color)
                Text(title).font(.caption2).foregroundColor(.secondary)
            }
            Text("\(Int(value))/\(Int(goal))g")
                .font(.subheadline).fontWeight(.medium)
        }
        .frame(maxWidth: .infinity)
    }
}
