import SwiftUI

struct DailySummaryView: View {
    @State var foodEntries: [FoodEntry] = MockData.foodEntries
    @State var showAddMeal = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("Aujourd'hui")
                        .font(.system(size: 28, weight: .bold))
                    Spacer()
                    Button {
                        showAddMeal = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.title2)
                    }
                }.padding(.horizontal)

                CaloriesSection(foodEntries: foodEntries)
                    .padding(.top, 10)

                MacrosSection(foodEntries: foodEntries)

                ForEach(MealType.allCases) { type in
                    MealRow(mealType: type, entries: foodEntries.filter { $0.mealType == type })
                }
            }
            .padding(.top)
        }
        .sheet(isPresented: $showAddMeal) {
            AddMealView()
        }
    }
}
#Preview {
    DailySummaryView()
}
