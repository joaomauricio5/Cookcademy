//
//  MainTabView.swift
//  Cookcademy
//
//  Created by Joao Mauricio on 08/04/2022.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject var recipeData = RecipeData()
    
    var body: some View {
        TabView{
            
            RecipeCategoryGridView()
                .tabItem{ Label("Recipes", systemImage: "list.dash") }
            
            NavigationView{
                RecipesListView(viewStyle: .Favorites)
            } .tabItem{ Label("Favorites", systemImage: "heart.fill") }
            
            SettingsView()
                .tabItem{ Label("Settings", systemImage: "gear") }
        }
        .environmentObject(recipeData)
        .onAppear{try! recipeData.load()}
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
