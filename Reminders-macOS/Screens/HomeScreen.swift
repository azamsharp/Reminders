//
//  HomeScreen.swift
//  Reminders-macOS
//
//  Created by Mohammad Azam on 2/17/22.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            SideBar()
            Text("Details")
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
