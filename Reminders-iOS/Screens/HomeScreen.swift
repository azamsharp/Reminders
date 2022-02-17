//
//  HomeScreen.swift
//  Reminders-iOS
//
//  Created by Mohammad Azam on 2/17/22.
//

import SwiftUI

struct HomeScreen: View {
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                MyListsView()
                Divider()
                Button("Add List") {
                    isPresented = true
                }.frame(maxWidth: .infinity, alignment: .trailing)
                    .padding()
                    .sheet(isPresented: $isPresented) {
                        AddNewListView { newListName, colorCode in
                            // save
                        }
                    }
            }
            
            .navigationTitle("My Lists")
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
