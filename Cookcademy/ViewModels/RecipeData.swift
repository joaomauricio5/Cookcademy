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
            try! self.save()
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
    
    private var recipesFileURL: URL {
        let documentsDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return documentsDirectory.appendingPathComponent("recipeData").appendingPathExtension(for: .json)
    }
    
    func save() throws {
        let data = try JSONEncoder().encode(recipes)
        try data.write(to: recipesFileURL)
    }
    
    func load() throws {
        guard FileManager.default.isReadableFile(atPath: recipesFileURL.path) else {return}
        let data = try Data(contentsOf: recipesFileURL)
        recipes = try JSONDecoder().decode([Recipe].self, from: data)
    }
    
    
}
