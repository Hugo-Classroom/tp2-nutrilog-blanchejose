import SwiftUI

struct RootView: View {
    // TODO: Cette partie sera vue en classe pour l'expliquer comme il faut
    @State private var isAuthenticated = true
    
    var body: some View {
        if (isAuthenticated) {
            HomeView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    RootView()
}
