import SwiftUI
import LocalAuthentication

struct LoginView: View {
    var onLoginSuccess: () -> Void

    var body: some View {
        ZStack {
            Color(red: 0.984, green: 0.976, blue: 0.953).ignoresSafeArea()
            VStack {
                Spacer()
                Image("Image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 250)
                    .padding()
                Spacer()
              
                Button(action: authenticateFaceID) {
                    HStack(spacing: 8) {
                        Image(systemName: "faceid")
                            .font(.title3)
                        Text("Se connecter")
                            .font(.system(size: 18, weight: .bold))
                    }
                    .foregroundColor(.white)
                    .frame(width: 200, height: 44)
                    .background(Color(red: 0.961, green: 0.62, blue: 0.043))
                    .cornerRadius(10)
                }
                .padding(.bottom, 70)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    private func authenticateFaceID() {
        let context = LAContext()
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Connexion via Face ID") { success, error in
            if success {
                DispatchQueue.main.async {
                    onLoginSuccess()
                }
            }
        }
    }
}

#Preview {
    LoginView(onLoginSuccess: {})
}
