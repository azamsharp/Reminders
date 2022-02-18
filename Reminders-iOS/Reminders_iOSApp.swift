//
//  Reminders_iOSApp.swift
//  Reminders-iOS
//
//  Created by Mohammad Azam on 2/17/22.
//

import SwiftUI

@main
struct Reminders_iOSApp: App {
    var body: some Scene {
        WindowGroup {
            let _ = UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            HomeScreen(vm: HomeViewModel())
        }
    }
}
