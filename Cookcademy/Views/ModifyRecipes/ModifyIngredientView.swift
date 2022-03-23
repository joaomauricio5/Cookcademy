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

struct ModifyIngredientView: View {

    @Binding var ingredient: Ingredient
    
    var body: some View {
        Form{
            TextField("Name of ingredient", text: $ingredient.name)
            Stepper(value: $ingredient.quantity,
                    in: 0...100,
                    step: 0.5,
                    label: {
                Text("Quantity:")
                TextField("Quantity", value: $ingredient.quantity, formatter: NumberFormatter.oneDecimalPlace)
                
            })
            
            Picker("Units", selection: $ingredient.unit) {
                ForEach(Unit.allCases, id: \.self) { unit in
                    HStack {
                        Text(unit.rawValue)
                    }
                }
            }.pickerStyle(.inline)
        }
    }
}

struct ModifyIngredientView_Previews: PreviewProvider {
    static var previews: some View {
        ModifyIngredientView(ingredient: .constant( Ingredient(name: "testName", quantity: 5.0, unit: .cups)))
    }
}
