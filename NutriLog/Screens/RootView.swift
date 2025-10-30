import SwiftUI

struct RootView: View {
    @State private var isAuthenticated = false

    var body: some View {
        if isAuthenticated {
            DailySummaryView()
        } else {
            LoginView(onLoginSuccess: {
                isAuthenticated = true
            })
        }
    }
}

#Preview {
    RootView()
}
