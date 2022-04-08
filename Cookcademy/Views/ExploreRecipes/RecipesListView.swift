//
//  ContentView.swift
//  Cookcademy
//
//  Created by João Mauricio UWE ID 18030724 on 09/03/2022.
//

import SwiftUI

struct RecipesListView: View {
    
    enum ViewStyle{
        case SingleCategory(category: Category)
        case Favorites
    }
    
    let viewStyle: ViewStyle
    @EnvironmentObject var recipeData: RecipeData
    
    @AppStorage("listBackgroundColor") var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") var listTextColor = AppColor.foreground
    
    private var filteredRecipes: [Recipe] {
        switch viewStyle {
        case .SingleCategory(let category):
            return recipeData.recipes.filter { $0.mainInformation.category == category}
        case .Favorites:
            return recipeData.favoriteRecipes
        }
    }
    
    var navigationTitle: String {
        switch viewStyle {
        case .SingleCategory(let category):
            return "\(category.rawValue) recipes"
        case .Favorites:
            return "Favorite recipes"
        }
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
            .foregroundColor(listTextColor)
        }
        .toolbar {
            ToolbarItem {
                Button(action: {
                    isSheetVisible = true
                    switch viewStyle {
                    case .SingleCategory(let category):
                        newRecipe.mainInformation.category = category
                    case .Favorites:
                        newRecipe.isFavorite = true
                    }
                },
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
        }.navigationTitle(navigationTitle)
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RecipesListView(viewStyle: .SingleCategory(category: .breakfast))
                .environmentObject(RecipeData())
        }
    }
}
