//
//  FormsView.swift
//  All In One Project
//
//  Created by constantine kos on 11.01.2021.
//

import SwiftUI


class FormsViewClass: ObservableObject {
    @State var textField = ""
    @State var secureField = ""
}


struct FormsView: View {
    @StateObject var controlls = FormsViewClass()
    
    var body: some View {
            Form {
                Section(header: Text("header"), footer: Text("footer")) {
                    TextField("This is an text field", text: $controlls.textField)
                    SecureField("Secure field", text: $controlls.secureField)
                    Button(action: {
                        
                        hideKeyboard()
                    }, label: {
                        Text("Action")
                    })
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
