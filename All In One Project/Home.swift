//
//  Home.swift
//  All In One Project
//
//  Created by constantine kos on 11.01.2021.
//

import SwiftUI

struct Home: View {
    @State private var textField = ""
    @State private var secureField = ""
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("header"), footer: Text("footer")) {
                    TextField("This is an text field", text: $textField)
                    SecureField("Secure field", text: $secureField)
                }
                
                
                Button(action: {
                    
                }, label: {
                    Text("Action")
                })
            }
            
            .navigationTitle("List")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
