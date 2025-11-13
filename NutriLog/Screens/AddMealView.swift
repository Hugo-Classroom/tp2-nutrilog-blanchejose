import SwiftUI
import SwiftData

struct AddMealView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @Query private var allFoods: [Food]

    @State private var selectedFoodIndex: Int = 0
    @State private var portion: Double = 120
    @State private var mealType: MealType = .dinner

    let orange = Color(red: 245/255, green: 158/255, blue: 11/255)

    var selectedFood: Food? {
        allFoods.isEmpty ? nil : allFoods[selectedFoodIndex]
    }

    var macros: (calories: Double, protein: Double, carbs: Double, fat: Double) {
        guard let food = selectedFood else { return (0,0,0,0) }
        let coef = portion / 100
        return (
            calories: food.calories * coef,
            protein: food.protein * coef,
            carbs: food.carbs * coef,
            fat: food.fat * coef
        )
    }

    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()
            
            VStack(spacing: 16) {
                HStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.title3)
                            .foregroundColor(.gray)
                            .padding(6)
                    }
                    Spacer()
                    Text("Ajouter une entrée")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Spacer()
                    Color.clear.frame(width: 36)
                }
                .padding(.horizontal)

                Picker("", selection: $selectedFoodIndex) {
                    ForEach(0..<allFoods.count, id: \.self) { i in
                        Text(allFoods[i].name)
                    }
                }
                .pickerStyle(.menu)
                .accentColor(orange)
                .labelsHidden()
                .padding(.horizontal)

                HStack {
                    Text("Portions : \(Int(portion)) g")
                        .font(.system(size: 15))
                    Spacer()
                    HStack(spacing: 0) {
                        Button { if portion > 10 { portion -= 10 } } label: {
                            Image(systemName: "minus")
                                .padding(8)
                                .foregroundColor(.black)
                        }
                        Divider().frame(height: 20)
                        Button { portion += 10 } label: {
                            Image(systemName: "plus")
                                .padding(8)
                                .foregroundColor(.black)
                        }
                    }
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                }
                .padding(.horizontal)

                HStack(spacing: 10) {
                    ForEach(MealType.allCases) { type in
                        Button {
                            mealType = type
                        } label: {
                            Text(type.rawValue)
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.black)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 18)
                                .background(mealType == type ? Color.white : Color(.systemGray6))
                                .cornerRadius(12)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(4)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 10) {
                    Text("Macros pour \(Int(portion)) g")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)

                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Calories:")
                            Text("Protéines:")
                            Text("Glucides:")
                            Text("Gras:")
                        }
                        Spacer()
                        VStack(alignment: .trailing, spacing: 8) {
                            Text("\(macros.calories, specifier: "%.1f") kcal").fontWeight(.semibold)
                            Text("\(macros.protein, specifier: "%.1f") g").fontWeight(.semibold)
                            Text("\(macros.carbs, specifier: "%.1f") g").fontWeight(.semibold)
                            Text("\(macros.fat, specifier: "%.1f") g").fontWeight(.semibold)
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(13)
                .padding(.horizontal)

                Spacer()

                Button(action: saveEntry) {
                    Text("Sauvegarder")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .font(.system(size: 19, weight: .bold))
                        .background(orange)
                        .foregroundColor(.white)
                        .cornerRadius(13)
                        .padding(.horizontal)
                }
                .disabled(selectedFood == nil)
                .opacity(selectedFood == nil ? 0.6 : 1)
                .padding(.bottom, 20)

            }
        }
    }

    private func saveEntry() {
        guard let food = selectedFood else { return }

        let entry = FoodEntry(
            food: food,
            servingSize: portion,
            mealType: mealType,
            date: Date()
        )

        modelContext.insert(entry)
        do {
            try modelContext.save()
            print(" Entrée sauvegardée: \(food.name), \(Int(portion))g, \(mealType.rawValue)")
        } catch {
            print("Erreur: \(error.localizedDescription)")
        }

        dismiss()
    }
}

#Preview {
    AddMealView()
        .modelContainer(for: [Food.self, FoodEntry.self])
}
