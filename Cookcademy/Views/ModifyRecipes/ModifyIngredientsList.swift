//
//  ModifyIngredientsList.swift
//  Cookcademy
//
//  Created by Joao Mauricio on 23/03/2022.
//

import SwiftUI

struct ModifyIngredientsList: View {
    
    @State private var newIngredient = Ingredient()
    @Binding var ingredientsList : [Ingredient]
    
    var body: some View {
        
        //////////////////////////////////// Closure to save new ingredient to ingredientsList
        let saveIngredientAction = { (ingredient: Ingredient) -> Void in
            ingredientsList.append(ingredient)
            newIngredient = Ingredient()
        }
        ///////////////////////////
        
        //NavigationView{
            Form{
                if !ingredientsList.isEmpty {
                    ForEach(ingredientsList.indices, id: \.self) { index in
                        Text(ingredientsList[index].description)
                        
                    }
                }
                NavigationLink(destination: ModifyIngredientView(ingredient: $newIngredient, actionForSaveButton: saveIngredientAction),
                               label: {Text("Add a new ingredient...")}).buttonStyle(.borderless)
            }
    }
}


struct ModifyIngredientsList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ModifyIngredientsList(ingredientsList: .constant([Ingredient]() ) )
        }
        
    }
}
