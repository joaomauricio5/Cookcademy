//
//  ModifyDirectionView.swift
//  Cookcademy
//
//  Created by Joao Mauricio on 24/03/2022.
//

import SwiftUI

struct ModifyDirectionView: View {
    
    @Binding var direction: Direction
    @Environment(\.presentationMode) private var mode
    
    let actionForSaveButton: ((Direction) -> Void)
    
    var body: some View {
        Form{
            TextField("Direction description", text: $direction.description)
            
            Toggle("Optional", isOn: $direction.isOptional)
            
            Button(action: {
                actionForSaveButton(direction)
                mode.wrappedValue.dismiss()
            },
                   label: {
                
                HStack {
                    Spacer()
                    Text("Save").bold()
                    Spacer()
                }
                
            })
            
        }
    }
}

struct ModifyDirectionView_Previews: PreviewProvider {
    static var previews: some View {
        ModifyDirectionView(direction: .constant(Direction(description: "TestDirection", isOptional: false)), actionForSaveButton: {_ in })
    }
}
