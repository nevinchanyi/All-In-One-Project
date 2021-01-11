//
//  FaceIDView.swift
//  All In One Project
//
//  Created by constantine kos on 11.01.2021.
//

import SwiftUI
import LocalAuthentication

// MARK: The app's Info.plist must contain an NSFaceIDUsageDescription key

struct FaceIDView: View {
    @State private var isLogged = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Hello, please enable Face ID and login")
            
            Button(action: {
                loginWithFaceID()
            }, label: {
                Image(systemName: "faceid")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.pink)
            })
            .fullScreenCover(isPresented: $isLogged, content: {
                Home()
            })
        }
    }
    private func loginWithFaceID() {
        let scanner = LAContext()
        
        scanner.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "to go to the next screen") { (status, error) in
            if error != nil {
                print(error?.localizedDescription)
            }
            print(status)
            isLogged = status
            
        }
    }
}

struct FaceIDView_Previews: PreviewProvider {
    static var previews: some View {
        FaceIDView()
    }
}
