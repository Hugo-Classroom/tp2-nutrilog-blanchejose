import SwiftUI

struct DailySummaryView: View {
    @State var foodEntries: [FoodEntry] = MockData.foodEntries
    @State var showAddMeal = false
    @State var showDetail: Food? = nil
    @State var selectedTab: Int = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            
            NavigationView {
                ZStack {
                    Color(.systemGray6).ignoresSafeArea()
                    ScrollView {
                        VStack(alignment: .leading, spacing: 14) {
                            HStack {
                                Text("Aujourd'hui")
                                    .font(.system(size: 28, weight: .bold))
                                Spacer()
                                Button(action: { showAddMeal = true }) {
                                    Image(systemName: "plus")
                                        .font(.system(size: 22, weight: .bold))
                                        .foregroundColor(Color.orange)
                                        .padding(8)
                                }
                            }
                            .padding(.horizontal, 18)
                            .padding(.top, 10)

                            VStack(alignment: .leading, spacing: 8) {
                              
                                CaloriesSection(foodEntries: foodEntries)
                            }

                            VStack(alignment: .leading, spacing: 8) {
                              
                                MacrosSection(foodEntries: foodEntries)
                            }

                            ForEach(MealType.allCases) { type in
                                MealRow(
                                    mealType: type,
                                    entries: foodEntries.filter { $0.mealType == type },
                                    onTap: { food in showDetail = food },
                                    onDelete: { entry in
                                        if let index = foodEntries.firstIndex(where: { $0.id == entry.id }) {
                                            foodEntries.remove(at: index)
                                        }
                                    }
                                )
                            }


                            Spacer(minLength: 32)
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .sheet(isPresented: $showAddMeal) { AddMealView() }
                .sheet(item: $showDetail) { food in
                    FoodDetailView(
                        food: food,
                        entries: foodEntries.filter { $0.food?.name == food.name }
                    )
                }
            }
            .tabItem {
                Image(systemName: "sun.max.fill")
                Text("Journée")
            }
            .tag(0)

            NavigationView {
                DailyChartsView(foodEntries: foodEntries)
                    .navigationTitle("Graphiques")
            }
            .tabItem {
                Image(systemName: "chart.pie.fill")
                Text("Graphiques")
            }
            .tag(1)
        }
        .accentColor(.orange) 
    }
}

#Preview {
    DailySummaryView()
}
