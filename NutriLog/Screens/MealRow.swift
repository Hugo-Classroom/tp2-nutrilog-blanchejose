
import SwiftUI

struct MealRow: View {
    var mealType: MealType
    var entries: [FoodEntry]

    var body: some View {
        if entries.isEmpty { EmptyView() }
        else {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(mealType.rawValue)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                    Spacer()
                    let totalCalories = entries.reduce(0) { $0 + $1.calories }
                    if totalCalories > 0 {
                        Text("\(Int(totalCalories)) CAL")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top,8)
                ForEach(entries.indices, id: \.self) { i in
                    let entry = entries[i]
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(entry.food?.name ?? "-")
                                .font(.body).fontWeight(.medium)
                            if let desc = entry.food?.desc {
                                Text(desc)
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                            }
                        }
                        Spacer()
                        macroIcons(entry)
                        Text("\(Int(entry.calories)) kcal")
                            .font(.subheadline)
                            .frame(minWidth: 56, alignment: .trailing)
                            .padding(.leading, 4)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                }
            }
            .background(Color(.systemBackground))
            .cornerRadius(10)
            .shadow(color: Color(.systemGray5), radius: 1, y: 1)
            .padding(.vertical, 2)
            .padding(.horizontal)
        }
    }

    func macroIcons(_ entry: FoodEntry) -> some View {
        HStack(spacing: 2) {
            if (entry.food?.protein ?? 0) > 0 {
                Image(systemName: "p.circle.fill").foregroundColor(.red).font(.caption)
            }
            if (entry.food?.carbs ?? 0) > 0 {
                Image(systemName: "g.circle.fill").foregroundColor(.purple).font(.caption)
            }
            if (entry.food?.fat ?? 0) > 0 {
                Image(systemName: "l.circle.fill").foregroundColor(.blue).font(.caption)
            }
        }
    }
}
