import SwiftUI

struct FoodDetailView: View {
    let food: Food
    let entries: [FoodEntry]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Header
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(food.name)
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.primary)
                    Text("\(Int(food.calories)) cal")
                        .font(.title3)
                        .fontWeight(.regular)
                        .foregroundColor(.secondary)
                }
                Spacer()
                HStack(spacing: 20) {
                    VStack(spacing: 2) {
                        Text("\(Int(food.protein))")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text("g")
                            .font(.caption2)
                        Text("Protéines")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                    VStack(spacing: 2) {
                        Text("\(Int(food.carbs))")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text("g")
                            .font(.caption2)
                        Text("Glucides")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                    VStack(spacing: 2) {
                        Text("\(Int(food.fat))")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text("g")
                            .font(.caption2)
                        Text("Lipides")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top)

            // Historique
            Text("Historique de consommation")
                .font(.headline)
                .foregroundColor(.primary)
                .padding(.horizontal)
                .padding(.top, 16)
            
            VStack(spacing: 0) {
                ForEach(entries, id: \.date) { entry in
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(entry.mealType.rawValue)
                                .font(.body)
                            Text(entry.date, style: .date)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Text("\(Int(entry.servingSize)) g")
                            .foregroundColor(.secondary)
                            .font(.body)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                }
            }
            .background(Color(.systemBackground))

            Spacer()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemBackground))
    }
}

#Preview {
    FoodDetailView(
        food: MockData.banana, // ou MockData.proteinFood selon le cas
        entries: MockData.foodEntries.filter { $0.food?.name == MockData.banana.name }
    )
}

