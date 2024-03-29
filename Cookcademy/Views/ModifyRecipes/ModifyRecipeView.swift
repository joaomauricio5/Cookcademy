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
                Picker("Select recipe component", selection: $informationToEdit) {
                    ForEach(EditSelection.allCases, id: \.self) {selectionType in
                        Text(selectionType.rawValue)
                    }
                }.pickerStyle(.segmented)
                .padding()
            
            switch informationToEdit {
            case .MainInformation:
                ModifyMainInformationView(mainInformation: $recipe.mainInformation)
            case .Directions:
                ModifyComponentsView<Direction, ModifyDirectionView>(componentsList: $recipe.directions)
            case .Ingredients:
                ModifyComponentsView<Ingredient, ModifyIngredientView>(componentsList: $recipe.ingredients)
            }
            
            Spacer()
        }
    }
}

struct ModifyRecipeView_Previews: PreviewProvider {
    static var previews: some View {
            ModifyRecipeView(recipe: .constant(Recipe()))
        
    }
}
