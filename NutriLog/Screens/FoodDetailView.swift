import SwiftUI

struct FoodDetailView: View {
    let food: Food
    let entries: [FoodEntry]
    @Environment(\.dismiss) private var dismiss  // permet de revenir en arrière

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 2) {  // réduit l'espacement
                Button(action: {
                    dismiss() // revient à l'écran précédent / accueil
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.orange)
                        .padding(8)
                }

                Button(action: {
                    dismiss() // même action si on clique sur "Aujourd'hui"
                }) {
                    Text("Aujourd'hui")
                        .font(.subheadline)
                        .foregroundColor(.orange)
                        .padding(.vertical, 8)
                        .padding(.trailing, 8)
                }

                Spacer()
            }

            Text(food.name)
                .font(.system(size: 32))
                .foregroundColor(.primary)
                .padding(.horizontal, 8)

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
                        HStack(spacing:2){
                            Text("\(Int(food.protein))")
                                .font(.headline)
                                .fontWeight(.bold)
                            Text("g")
                        }
                        Text("Protéines")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                    VStack(spacing: 2) {
                        HStack(spacing:2){
                            Text("\(Int(food.carbs))")
                                .font(.headline)
                                .fontWeight(.bold)
                            Text("g")
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
                        }
                        Text("Lipides")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top)

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
        food: MockData.banana,
        entries: MockData.foodEntries.filter { $0.food?.name == MockData.banana.name }
    )
}
