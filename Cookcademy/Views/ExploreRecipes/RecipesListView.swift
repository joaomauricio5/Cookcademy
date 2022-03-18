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
    
    @State private var isSheetVisible = false
    @State private var newRecipe = Recipe()
    
    var body: some View {
        List{
            ForEach(filteredRecipes) { recipe in
                NavigationLink(recipe.mainInformation.name,
                               destination: RecipeDetailView(recipe: recipe))
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
                            Button(action: {
                                recipeData.recipes.append(newRecipe)
                                isSheetVisible = false
                            },
                                   label: {Text("Add")})
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
