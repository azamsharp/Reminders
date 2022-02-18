//
//  HomeScreen.swift
//  Reminders-iOS
//
//  Created by Mohammad Azam on 2/17/22.
//

import SwiftUI

struct HomeScreen: View {
    
    @State private var isPresented: Bool = false
    @StateObject private var vm: HomeViewModel
    
    init(vm: HomeViewModel) {
        _vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                MyListsView(myLists: vm.myLists)
                Divider()
                Button("Add List") {
                    isPresented = true
                }.frame(maxWidth: .infinity, alignment: .trailing)
                    .padding()
                    .sheet(isPresented: $isPresented) {
                        AddNewListView { newListName, colorCode in
                            // save
                            vm.saveNewList(newListName: newListName, colorCode: colorCode)
                        }
                    }
            }
            
            .navigationTitle("My Lists")
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        let vm = HomeViewModel()
        HomeScreen(vm: vm)
    }
}
