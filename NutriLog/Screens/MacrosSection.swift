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
        Text("MACROS")
            .foregroundColor(.gray)
            .padding(.leading, 12)
        
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 18) {
                macroPill(color: .red, title: "Protéines", value: protein, goal: proteinGoal, icon: "p.circle.fill")
                macroPill(color: .purple, title: "Glucides", value: carbs, goal: carbsGoal, icon: "g.circle.fill")
                macroPill(color: .blue, title: "Lipides", value: fat, goal: fatGoal, icon: "l.circle.fill")
            }
            .padding(.horizontal)
        }
        .padding(.vertical, 12)
        .background(Color.white)
        .cornerRadius(14)
        .padding(.horizontal)
    }

    func macroPill(color: Color, title: String, value: Double, goal: Double, icon: String) -> some View {
        VStack(spacing: 6) {
            HStack(spacing: 4) {
                Image(systemName: icon)
                Text(title)
                    .fontWeight(.semibold)
            }
            .foregroundColor(color)
            ProgressView(value: min(max(value / goal, 0), 1))
                .progressViewStyle(.linear)
                .tint(color)
                .frame(height: 6)

            
            Text("\(Int(value))/\(Int(goal)) g")

        }
    }
}

#Preview {
    ZStack {
        Color(.systemGray6).ignoresSafeArea()
        MacrosSection(foodEntries: MockData.foodEntries)
    }
}

