//
//  ContentView.swift
//  Cookcademy
//
//  Created by João Mauricio UWE ID 18030724 on 09/03/2022.
//

import SwiftUI

struct RecipesListView: View {
    
    let category: Category
    @EnvironmentObject var recipeData: RecipeData
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    private var filteredRecipes: [Recipe] {
        recipeData.recipes.filter { $0.mainInformation.category == category}
    }
    
    func binding(for recipe: Recipe) -> Binding<Recipe> {
        guard let index = recipeData.index(of: recipe) else {
            fatalError("Recipe not found")
        }
        return $recipeData.recipes[index]
    }
        
    @State private var isSheetVisible = false
    @State private var newRecipe = Recipe()
    
    var body: some View {
        List{
            ForEach(filteredRecipes) { recipe in
                NavigationLink(recipe.mainInformation.name,
                               destination: RecipeDetailView(recipe: binding(for: recipe)))
            }
            .listRowBackground(listBackgroundColor)
        }
        .toolbar {
            ToolbarItem {
                Button(action: {isSheetVisible = true},
                       label: {Image(systemName: "plus")})
            }
        }
        .sheet(isPresented: $isSheetVisible, onDismiss: nil) {
            NavigationView{
                ModifyRecipeView(recipe: $newRecipe)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction){
                            Button(action: {isSheetVisible = false},
                                   label: {Text("Dismiss").bold()})
                        }
                        
                        ToolbarItem(placement: .confirmationAction){
                            if newRecipe.isValid {
                                Button(action: {
                                    recipeData.add(recipe: newRecipe)
                                    isSheetVisible = false
                                },
                                       label: {Text("Add")})
                            }
                        }
                    }.navigationTitle("Add a New Recipe")
            }
        }
        .navigationTitle("\(category.rawValue) recipes")
        
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RecipesListView(category: Category.breakfast)
                .environmentObject(RecipeData())
        }
    }
}
