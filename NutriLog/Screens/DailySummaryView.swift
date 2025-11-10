import SwiftUI

struct DailySummaryView: View {
    @State var foodEntries: [FoodEntry] = MockData.foodEntries
    @State var showAddMeal = false
    @State var showDetail: Food? = nil

    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGray6).ignoresSafeArea()
                ScrollView {
                    
                    VStack(spacing: 14) {
                        HStack {
                            Text("Aujourd'hui")
                                .font(.system(size: 28, weight: .bold))
                            Spacer()
                        }
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .bottomBar) {
                                Button(action: { showAddMeal = true }) {
                                    Label("Ajouter un repas", systemImage: "plus")
                                        .font(.title2)
                                        .foregroundColor(.orange)
                                }
                            }
                        }
                        .sheet(isPresented: $showAddMeal) {
                            AddMealView()
                        }
                        .padding(.horizontal, 8)
                        .padding(.top, 60)

                        CaloriesSection(foodEntries: foodEntries)
                        MacrosSection(foodEntries: foodEntries)

                        ForEach(MealType.allCases) { type in
                            MealRow(
                                mealType: type,
                                entries: foodEntries.filter { $0.mealType == type }
                            ) { food in
                                showDetail = food
                            }
                        }
                        Spacer(minLength: 36)
                    }
                }
            }
           
            .sheet(item: $showDetail) { food in
                FoodDetailView(
                    food: food,
                    entries: foodEntries.filter { $0.food?.name == food.name }
                )
            }
        }
    }
}


#Preview {
    DailySummaryView()
}
