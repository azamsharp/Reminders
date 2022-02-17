//
//  SideBar.swift
//  Reminders-macOS
//
//  Created by Mohammad Azam on 2/17/22.
//

import SwiftUI

struct SideBar: View {
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            MyListsView()
            
            Button {
                isPresented = true
            } label: {
                HStack {
                    Image(systemName: Constants.Icons.plusCircle)
                    Text("Add List")
                }
            }.buttonStyle(.plain)
                .padding()

        }.sheet(isPresented: $isPresented, onDismiss: { }) {
            AddNewListView { newListName, colorCode in
                    // save
            }.frame(width: 600, height: 400)
                .foregroundColor(.black)
        }
    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar()
    }
}
