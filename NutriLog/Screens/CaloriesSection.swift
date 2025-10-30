
import SwiftUI

struct CaloriesSection: View {
    let foodEntries: [FoodEntry]
    let dailyGoal: Double = 2500

    var totalCalories: Double {
        foodEntries.reduce(0) { $0 + $1.calories }
    }

    var body: some View {
        HStack(spacing: 14) {
            VStack(alignment: .center, spacing: 2) {
                Text("Restantes").font(.caption).foregroundColor(.secondary)
                Text("\(Int(dailyGoal-totalCalories)) cal").font(.title3).fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(14)

            VStack(alignment: .center, spacing: 2) {
                Text("Consommées").font(.caption).foregroundColor(.secondary)
                Text("\(Int(totalCalories)) cal").font(.title3).fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(14)
        }
        .padding(.horizontal)
    }
}
