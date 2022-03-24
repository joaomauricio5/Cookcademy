//
//  ModifyIngredientView.swift
//  Cookcademy
//
//  Created by Joao Mauricio on 23/03/2022.
//

import SwiftUI

extension NumberFormatter {
    static var oneDecimalPlace: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        return formatter
    }
}

struct ModifyIngredientView: ModifyComponentView {

    @Binding var ingredient: Ingredient
    @Environment(\.presentationMode) private var mode
    let actionForSaveButton: ((Ingredient) -> Void)
    
    init(component: Binding<Ingredient>, createAction: @escaping (Ingredient) -> Void) {
        self._ingredient = component
        self.actionForSaveButton = createAction
    }
    
    var body: some View {
        Form{
            TextField("Name of ingredient", text: $ingredient.name)
            Stepper(value: $ingredient.quantity,
                    in: 0...100,
                    step: 0.5,
                    label: {
                Text("Quantity:")
                TextField("Quantity", value: $ingredient.quantity, formatter: NumberFormatter.oneDecimalPlace).keyboardType(.numbersAndPunctuation)
            })
            
            Picker("Units", selection: $ingredient.unit) {
                ForEach(Unit.allCases, id: \.self) { unit in
                    HStack {
                        Text(unit.rawValue)
                    }
                }
            }.pickerStyle(.inline)
            
            
            Button(action: {
                actionForSaveButton(ingredient)
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

struct ModifyIngredientView_Previews: PreviewProvider {
    static var previews: some View {
        ModifyIngredientView(component: .constant( Ingredient()), createAction: {_ in})
    }
}
