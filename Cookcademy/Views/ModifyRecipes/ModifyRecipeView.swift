//
//  ModifyRecipeView.swift
//  Cookcademy
//
//  Created by Joao Mauricio on 18/03/2022.
//

import SwiftUI

enum EditSelection: String, CaseIterable{
    case MainInformation
    case Ingredients
    case Directions
}

struct ModifyRecipeView: View {
    
    @Binding var recipe: Recipe
    @State private var informationToEdit = EditSelection.MainInformation
    
    var body: some View {
        VStack{
          //  Form{
                Picker("Select recipe component", selection: $informationToEdit) {
                    ForEach(EditSelection.allCases, id: \.self) {selectionType in
                        Text(selectionType.rawValue)
                    }
                }.pickerStyle(.segmented)
                .padding()
           // }
            
            switch informationToEdit {
            case .MainInformation:
                ModifyMainInformationView(mainInformation: $recipe.mainInformation)
            case .Directions:
                Text("Edit directions")
            case .Ingredients:
                ModifyIngredientsList(ingredientsList: $recipe.ingredients)
            }
            
            Spacer()
            
        }

        
        
        //        Button(action: {
        //            recipe.mainInformation = MainInformation(name: "test",
        //                                                     description: "test",
        //                                                     author: "test",
        //                                                     category: .breakfast)
        //            recipe.directions = [Direction(description: "test",
        //                                           isOptional: false)]
//
//            recipe.ingredients = [Ingredient(name: "test",
//                                             quantity: 1.0,
//                                             unit: .cups)]
//        },
//               label: {Text("Fill in the recipe with test data")})
    }
}

struct ModifyRecipeView_Previews: PreviewProvider {
    static var previews: some View {
            ModifyRecipeView(recipe: .constant(Recipe()))
        
    }
}
