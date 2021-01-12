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
    
    @State var selectedDate = Date()

    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        let max = Calendar.current.date(byAdding: .day, value: 7, to: Date())!
        return min...max
    }
    
    
    @State var progress: Float = 0

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
            
            Section {
                DatePicker(
                    selection: $selectedDate,
                    in: dateClosedRange,
                    displayedComponents: .date,
                    label: { Text("Due Date") }
                )
                
            }
            
            
            Section {
                Slider(value: $progress, in: 0...100) { changed in
                    print("changed: \(progress)")
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
