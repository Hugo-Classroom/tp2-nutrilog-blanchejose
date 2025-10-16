import SwiftUI
import SwiftData

@main
struct NutriLogApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(PersistenceController.shared.container)
    }
}
