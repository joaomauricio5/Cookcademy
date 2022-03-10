//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Joao Mauricio on 10/03/2022.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
}
