//
//  AddNewListView.swift
//  Reminders
//
//  Created by Mohammad Azam on 2/17/22.
//

import SwiftUI

struct AddNewListView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var newListName: String = ""
    @State private var selectedColor: Color = .green
    
    var onSave: (String, String) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                Button("Done") {
                    // onSave
                    
                    onSave(newListName, selectedColor.hex)
                    
                    presentationMode.wrappedValue.dismiss()
                }.disabled(newListName.isEmpty)
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            VStack {
                Image(systemName: Constants.Icons.line3HorizontalCircleFill)
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 64))
                    .foregroundColor(selectedColor)
                
                TextField("List Name", text: $newListName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
            .frame(height: 200)
            .background(Color(red: 1.0, green: 1.0, blue: 1.0))
                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            
            VStack {
                ColorPickerView(selectedColor: $selectedColor)
                    .font(.system(size: 32))
            }.frame(maxWidth: .infinity, maxHeight: 200)
                .background(Color(red: 1.0, green: 1.0, blue: 1.0))
                    .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            
            Spacer()
        }.padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.949, green: 0.946, blue: 0.966))
    }
}

struct AddNewListView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewListView { _, _ in }
    }
}
