//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Joao Mauricio on 10/03/2022.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
    let categories = Category.allCases
    
    func add(recipe: Recipe) {
        if recipe.isValid {
            recipes.append(recipe)
        }
    }
    
    var favoriteRecipes: [Recipe] {
        return recipes.filter{$0.isFavorite}
    }
    
    func index(of recipe: Recipe) -> Int? {
        for i in recipes.indices {
            if recipes[i].id == recipe.id {
                return i
            }
        }
        return nil
    }
    
    
}
