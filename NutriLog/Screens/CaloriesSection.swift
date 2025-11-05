import SwiftUI

struct CaloriesSection: View {
    let foodEntries: [FoodEntry]
    let dailyGoal: Double = 2500
    
    var totalCalories: Double {
        foodEntries.reduce(0) { $0 + $1.calories }
    }
    var progress: Double{
        min(totalCalories/dailyGoal, 1.0)
    }
    
    var body: some View {
        Text("CALORIES")
            .foregroundColor(.gray)
            .padding(.leading, 12)
        HStack(spacing: 0) {
            
            VStack(spacing: 2) {
                Text("Restantes")
                Text("\(Int(dailyGoal - totalCalories)) cal")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding()
            
            VStack(){
                ZStack(){
                Circle()
                    .stroke(lineWidth: 10)
                    .opacity(0.3)
                    .foregroundColor(Color(.systemGray3))
                                       
                    Circle()
                    .trim(from: 0.0, to: progress)
                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .foregroundColor(.green)
                    .rotationEffect(Angle(degrees: -90))
                                       
                                     
                }
                .frame(width: 60, height: 40)
                
            }

            Divider()
                .frame(width: 1, height: 80)
                .background(Color.gray.opacity(0.3))
          
            VStack(spacing: 2) {
                Text("Consommées")
                Text("\(Int(totalCalories)) cal")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
        .background(Color.white)
        .cornerRadius(14)
        .padding(.horizontal)
    }
}

#Preview {
    ZStack {
        Color(.systemGray6).ignoresSafeArea()
        CaloriesSection(foodEntries: MockData.foodEntries)
    }
}
