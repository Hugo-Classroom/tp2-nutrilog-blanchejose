import SwiftUI
import SwiftData

struct FoodDetailView: View {
    let food: Food
    
    @Environment(\.dismiss) private var dismiss
    @Query private var allEntries: [FoodEntry]
    
    private var foodEntries: [FoodEntry] {
        let filtered = allEntries.filter { entry in
            guard let entryFood = entry.food else { return false }
            return entryFood.name == food.name
        }.sorted { $0.date > $1.date }
        
        print(" Historique pour \(food.name): \(filtered.count) entrées trouvées")
        for entry in filtered {
            print("   - \(entry.mealType.rawValue) le \(entry.date) (\(Int(entry.servingSize))g)")
        }
        
        return filtered
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack(spacing: 2) {
                    Button(action: {
                        dismiss()
                    }) {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.orange)
                            Text("Aujourd'hui")
                                .font(.subheadline)
                                .foregroundColor(.orange)
                        }
                        .padding(8)
                    }
                    Spacer()
                }
                
                Text(food.name)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.primary)
                    .padding(.horizontal)
                
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("\(Int(food.calories)) cal")
                            .font(.title3)
                            .fontWeight(.regular)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    HStack(spacing: 20) {
                        VStack(spacing: 2) {
                            HStack(spacing: 2) {
                                Text("\(Int(food.protein))")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Text("g")
                                    .font(.caption)
                            }
                            Text("Protéines")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        VStack(spacing: 2) {
                            HStack(spacing: 2) {
                                Text("\(Int(food.carbs))")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Text("g")
                                    .font(.caption)
                            }
                            Text("Glucides")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        VStack(spacing: 2) {
                            HStack(spacing: 2) {
                                Text("\(Int(food.fat))")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Text("g")
                                    .font(.caption)
                            }
                            Text("Lipides")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 8)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Historique de consommation")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding(.horizontal)
                        .padding(.top, 16)
                    
                    if foodEntries.isEmpty {
                        HStack {
                            Spacer()
                            VStack(spacing: 8) {
                               
                                Text("Aucun historique")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 40)
                            Spacer()
                        }
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .padding(.horizontal)
                    } else {
                        VStack(spacing: 0) {
                            ForEach(Array(foodEntries.enumerated()), id: \.element.date) { index, entry in
                                VStack(spacing: 0) {
                                    HStack {
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(entry.mealType.rawValue)
                                                .font(.body)
                                                .fontWeight(.medium)
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
                                    .padding(.vertical, 12)
                                   
                                    if index < foodEntries.count - 1 {
                                        Divider()
                                            .padding(.horizontal)
                                    }
                                }
                            }
                        }
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .background(Color(.systemBackground))
    }
}

#Preview {
    NavigationStack {
        FoodDetailView(
            food: Food(
                name: "Banane",
                calories: 89,
                protein: 1,
                carbs: 23,
                fat: 0,
                desc: "Riche en potassium"
            )
        )
        .modelContainer(for: [Food.self, FoodEntry.self])
    }
}
