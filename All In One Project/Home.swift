//
//  Home.swift
//  All In One Project
//
//  Created by constantine kos on 11.01.2021.
//

import SwiftUI

struct Home: View {
    
    
    var body: some View {
        
        NavigationView {
            List {
                NavigationLink("Forms", destination: FormsView())
            }
            
            
            
            .navigationTitle("Home list")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
