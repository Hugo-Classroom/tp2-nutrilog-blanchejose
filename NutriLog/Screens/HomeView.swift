import SwiftUI
import SwiftData

struct HomeView: View {
    var body: some View {
        Text("Vue Onglets pour Journée et Graphiques")
    }
}

#Preview {
    HomeView()
        .modelContext(PersistenceController.preview.context)
}
