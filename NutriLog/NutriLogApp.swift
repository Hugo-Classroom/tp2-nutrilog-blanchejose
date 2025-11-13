import SwiftUI
import SwiftData

@main
struct NutriLogApp: App {
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([Food.self, FoodEntry.self])
        let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            let container = try ModelContainer(for: schema, configurations: [config])
            
            let context = container.mainContext
            let existingFoods = try context.fetch(FetchDescriptor<Food>())
            if existingFoods.isEmpty {
                MockData.foods.forEach { context.insert($0) }
                try context.save()
                print("MockData insérée")
            }
            
            return container
        } catch {
            fatalError("Impossible de créer le ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            RootView() 
        }
        .modelContainer(sharedModelContainer)
    }
}
