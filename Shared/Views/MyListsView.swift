//
//  MyListsView.swift
//  Reminders
//
//  Created by Mohammad Azam on 2/17/22.
//

import SwiftUI

struct MyListsView: View {
    var body: some View {
        List(1...20, id: \.self) { index in
            Text("MyList \(index)")
        }
    }
}

struct MyListsView_Previews: PreviewProvider {
    static var previews: some View {
        MyListsView()
    }
}
