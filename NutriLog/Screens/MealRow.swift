import SwiftUI

struct MealRow: View {
    var mealType: MealType
    var entries: [FoodEntry]
    var onTap: (Food) -> Void

    var totalCalories: Int {
        entries.reduce(0) { $0 + Int($1.calories) }
    }

    var body: some View {
        if entries.isEmpty { EmptyView() }
        else {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(mealType.rawValue)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                    Spacer()
                    HStack(spacing: 4) {
                        if totalCalories > 0 {
                            if let firstEntry = entries.first, let food = firstEntry.food {
                                if food.protein > 0 { MacroCircle(color: .red, letter: "P") }
                                if food.carbs > 0 { MacroCircle(color: .purple, letter: "G") }
                                if food.fat > 0 { MacroCircle(color: .blue, letter: "L") }
                            }
                            Text("\(totalCalories) CAL")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding(.horizontal, 18)
                .padding(.top, 12)

                VStack(spacing: 10) {
                    ForEach(entries, id: \.id) { entry in
                        Button {
                            if let food = entry.food { onTap(food) }
                        } label: {
                            HStack {
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(entry.food?.name ?? "-")
                                    .foregroundColor(.black)

                                    if let desc = entry.food?.desc {
                                        Text(desc)
                                            .font(.caption2)
                                            .foregroundColor(.gray)
                                    }
                                }
                                Spacer()
                                HStack(spacing: 4) {
                                    
                                    Text("\(Int(entry.calories)) kcal")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding(.horizontal, 18)
                            .padding(.vertical, 10)
                            .background(Color(.systemBackground))
                            .cornerRadius(12)
                            .shadow(color: Color(.systemGray5), radius: 2, x: 0, y: 2)
                        }
                    }
                }
                .padding(.bottom, 10)
            }
            .background(Color(.clear))
            .cornerRadius(14)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
        }
    }
}

struct MacroCircle: View {
    let color: Color
    let letter: String
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: 18, height: 18)
            Text(letter)
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    struct PreviewHolder: View {
        @State var showDetail: Food? = nil
        var body: some View {
            MealRow(
                mealType: .breakfast,
                entries: MockData.foodEntries.filter { $0.mealType == .breakfast },
                onTap: { _ in }
            )
        }
    }
    return PreviewHolder()
}
