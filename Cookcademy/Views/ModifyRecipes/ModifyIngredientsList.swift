//
//  ModifyIngredientsList.swift
//  Cookcademy
//
//  Created by Joao Mauricio on 23/03/2022.
//

import SwiftUI

struct ModifyIngredientsList: View {
    
    @State private var newIngredient = Ingredient(name: "", quantity: 1.0, unit: .none)
    @Binding var ingredientsList : [Ingredient]
    
    var body: some View {
        //NavigationView{
            Form{
                if !ingredientsList.isEmpty {
                    ForEach(ingredientsList.indices, id: \.self) { index in
                        Text(ingredientsList[index].name)
                        
                    }
                }
                NavigationLink(destination: ModifyIngredientView(ingredient: $newIngredient),
                               label: {Text("Add a new ingredient...")}).buttonStyle(.borderless)
            }
      //  }
    }
}


struct ModifyIngredientsList_Previews: PreviewProvider {
    static var previews: some View {
        ModifyIngredientsList(ingredientsList: .constant([Ingredient]() ) )
    }
}