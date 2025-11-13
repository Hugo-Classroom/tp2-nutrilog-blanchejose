import SwiftUI
import SwiftData

struct DailySummaryView: View {
    @Query(sort: [SortDescriptor(\FoodEntry.date, order: .reverse)]) private var foodEntries: [FoodEntry]
    @Environment(\.modelContext) private var modelContext
    
    @State private var showAddMeal = false
    @State private var showDetail: Food? = nil
    @State private var selectedTab: String = "Journée"
    
    var body: some View {
        VStack(spacing: 0) {
            Group {
                if selectedTab == "Journée" {
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
                                                .foregroundColor(.orange)
                                                .padding(8)
                                        }
                                    }
                                    .padding(.horizontal, 18)
                                    .padding(.top, 10)
                                    
                                    CaloriesSection(foodEntries: foodEntries)
                                    MacrosSection(foodEntries: foodEntries)
                                    
                                    ForEach(MealType.allCases) { type in
                                        MealRow(
                                            mealType: type,
                                            entries: foodEntries.filter { $0.mealType == type },
                                            onTap: { food in showDetail = food },
                                            onDelete: { _ in }
                                        )
                                    }
                                    
                                    Spacer(minLength: 32)
                                }
                            }
                        }
                        .sheet(isPresented: $showAddMeal) {
                            AddMealView()
                                .environment(\.modelContext, modelContext)
                        }
                        .sheet(item: $showDetail) { food in
                            
                            FoodDetailView(food: food)
                                .environment(\.modelContext, modelContext)
                        }
                    }
                } else if selectedTab == "Graphiques" {
                    DailyChartsView(foodEntries: foodEntries)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Divider()
            
            HStack(spacing: 50) {
                Button(action: { selectedTab = "Journée" }) {
                    VStack(spacing: 4) {
                        Image(systemName: "sun.max.fill")
                            .font(.system(size: 22))
                            .foregroundColor(selectedTab == "Journée" ? .orange : .gray)
                        Text("Journée")
                            .font(.caption)
                            .foregroundColor(selectedTab == "Journée" ? .orange : .gray)
                    }
                }
                
                Button(action: { selectedTab = "Graphiques" }) {
                    VStack(spacing: 4) {
                        Image(systemName: "chart.pie.fill")
                            .font(.system(size: 22))
                            .foregroundColor(selectedTab == "Graphiques" ? .orange : .gray)
                        Text("Graphiques")
                            .font(.caption)
                            .foregroundColor(selectedTab == "Graphiques" ? .orange : .gray)
                    }
                }
            }
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray6))
        }
        .animation(.easeInOut, value: selectedTab)
    }
}

#Preview() {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Food.self, FoodEntry.self, configurations: config)
        let context = container.mainContext

        for food in MockData.foods {
            context.insert(food)
        }

        let entries = [
            FoodEntry(food: MockData.banana, servingSize: 100, mealType: .breakfast),
            FoodEntry(food: MockData.boiledEgg, servingSize: 60, mealType: .breakfast),
            FoodEntry(food: MockData.proteinFood, servingSize: 150, mealType: .lunch),
            FoodEntry(food: MockData.firmTofu, servingSize: 120, mealType: .dinner)
        ]
        for entry in entries {
            context.insert(entry)
        }

        return DailySummaryView()
            .modelContainer(container)
    } catch {
        fatalError("Erreur de preview : \(error.localizedDescription)")
    }
}

