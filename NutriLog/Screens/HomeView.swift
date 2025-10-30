

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            DailySummaryView()
                .tabItem {
                    Image(systemName: "sun.max.fill")
                    Text("Journée")
                }
            Spacer()
            DailyChartsView()
                .tabItem {
                    Image(systemName: "chart.pie.fill")
                    Text("Graphiques")
                }
        }
    }
}

#Preview {
    HomeView()
}
