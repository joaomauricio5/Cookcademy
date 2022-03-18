//
//  ModifyRecipeView.swift
//  Cookcademy
//
//  Created by Joao Mauricio on 18/03/2022.
//

import SwiftUI

struct ModifyRecipeView: View {
    
    @Binding var recipe: Recipe
    
    var body: some View {
        Button(action: {
            recipe.mainInformation = MainInformation(name: "test",
                                                     description: "test",
                                                     author: "test",
                                                     category: .breakfast)
            recipe.directions = [Direction(description: "test",
                                           isOptional: false)]
            
            recipe.ingredients = [Ingredient(name: "test",
                                             quantity: 1.0,
                                             unit: .cups)]
        },
               label: {Text("Fill in the recipe with test data")})
    }
}

struct ModifyRecipeView_Previews: PreviewProvider {
    static var previews: some View {
            ModifyRecipeView(recipe: .constant(Recipe()))
        
    }
}
