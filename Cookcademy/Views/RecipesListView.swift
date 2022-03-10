//
//  ContentView.swift
//  Cookcademy
//
//  Created by João Mauricio UWE ID 18030724 on 09/03/2022.
//

import SwiftUI

struct RecipesListView: View {
    
    @StateObject var recipeData = RecipeData()
    
    var body: some View {
        List{
            ForEach(recipes) { recipe in
                Text(recipe.mainInformation.name)
            }
        }
        .navigationTitle(navigationTitle)
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RecipesListView()
        }
    }
}


extension RecipesListView {
    
    var navigationTitle: String {
        "All Recipes"
    }
    
    var recipes: [Recipe] {
        recipeData.recipes
    }
    
}
