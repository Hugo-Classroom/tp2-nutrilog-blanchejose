import SwiftUI

struct AddMealView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedFood: Food? = nil
    @State private var portion: Double = 100
    @State private var mealType: MealType = .breakfast
    @State var showAddMeal = false

    
    var body: some View {
        Image("test2")
        
        Spacer()
        
        NavigationView {
            Form {
                Picker("Aliment", selection: $selectedFood) {
                    ForEach(MockData.foods, id: \.name) { food in
                        Text(food.name).tag(Optional(food))
                    }
                }
                Stepper("Portion : \(Int(portion)) g", value: $portion, in: 10...500, step: 10)
                
                Picker("Repas", selection: $mealType) {
                    ForEach(MealType.allCases) { type in
                        Text(type.rawValue)
                    }
                }
                
                if let food = selectedFood {
                    Section(header: Text("Macros pour \(Int(portion))g")) {
                        Text("Calories : \(food.calories * portion/100, specifier: "%.1f") kcal")
                        Text("Protéines : \(food.protein * portion/100, specifier: "%.1f") g")
                        Text("Glucides : \(food.carbs * portion/100, specifier: "%.1f") g")
                        Text("Lipides : \(food.fat * portion/100, specifier: "%.1f") g")
                    }
                }
            }
        }
        Button(action: {
            // Ajouter foodEntry ici
            dismiss()
        }) {
            Text("Sauvegarder")
                .foregroundColor(.white)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(selectedFood == nil ? Color(.systemGray4) : .orange)
                .cornerRadius(1)

        }
    }
}


#Preview {
    AddMealView()
}
