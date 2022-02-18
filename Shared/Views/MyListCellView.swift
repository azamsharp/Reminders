//
//  MyListCellView.swift
//  Reminders
//
//  Created by Mohammad Azam on 2/18/22.
//

import SwiftUI

struct MyListCellView: View {
    
    let vm: MyListViewModel
    
    var body: some View {
        HStack {
            Image(systemName: Constants.Icons.line3HorizontalCircleFill)
                .foregroundColor(Color.colorFromHex(vm.colorCode))
            Text(vm.name)
            Spacer()
          
        }
    }
}

