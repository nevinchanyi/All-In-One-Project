//
//  FormsView.swift
//  All In One Project
//
//  Created by constantine kos on 11.01.2021.
//

import SwiftUI

struct FormsView: View {
    @State private var textField = ""
    @State private var secureField = ""
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("header"), footer: Text("footer")) {
                    TextField("This is an text field", text: $textField)
                    SecureField("Secure field", text: $secureField)
                    Button(action: {
                        
                        
                        hideKeyboard()
                    }, label: {
                        Text("Action")
                    })
                }
            }
        }
        .navigationTitle("Forms")
        .onTapGesture { hideKeyboard() }
    }
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct FormsView_Previews: PreviewProvider {
    static var previews: some View {
        FormsView()
    }
}
