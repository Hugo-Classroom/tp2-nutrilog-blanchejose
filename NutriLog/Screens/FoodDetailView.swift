import SwiftUI
// 🔹 Vue de détail d'un aliment (à créer)
struct FoodDetailView: View {
    let entry: FoodEntry
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(entry.food?.name ?? "Aliment")
                    .font(.title)
                    .fontWeight(.bold)
                
                if let desc = entry.food?.desc {
                    Text(desc)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                // Informations nutritionnelles
                VStack(alignment: .leading, spacing: 12) {
                    Text("Informations nutritionnelles")
                        .font(.headline)
                    
                    HStack {
                        Text("Calories:")
                        Spacer()
                        Text("\(Int(entry.calories)) kcal")
                            .fontWeight(.semibold)
                    }
                    
                    HStack {
                        Image(systemName: "p.circle.fill")
                            .foregroundColor(.red)
                        Text("Protéines:")
                        Spacer()
                        Text("\(String(format: "%.1f", (entry.food?.protein ?? 0) * entry.servingSize / 100)) g")
                            .fontWeight(.semibold)
                    }
                    
                    HStack {
                        Image(systemName: "g.circle.fill")
                            .foregroundColor(.purple)
                        Text("Glucides:")
                        Spacer()
                        Text("\(String(format: "%.1f", (entry.food?.carbs ?? 0) * entry.servingSize / 100)) g")
                            .fontWeight(.semibold)
                    }
                    
                    HStack {
                        Image(systemName: "l.circle.fill")
                            .foregroundColor(.blue)
                        Text("Lipides:")
                        Spacer()
                        Text("\(String(format: "%.1f", (entry.food?.fat ?? 0) * entry.servingSize / 100)) g")
                            .fontWeight(.semibold)
                    }
                    
                    HStack {
                        Text("Portion:")
                        Spacer()
                        Text("\(Int(entry.servingSize)) g")
                            .fontWeight(.semibold)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Détail")
        .navigationBarTitleDisplayMode(.inline)
    }
}


