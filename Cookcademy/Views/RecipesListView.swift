//
//  ContentView.swift
//  Cookcademy
//
//  Created by João Mauricio UWE ID 18030724 on 09/03/2022.
//

import SwiftUI

struct RecipesListView: View {
    var body: some View {
        List{
            Text("Recipe1")
        }.navigationTitle("All Recipes")
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView()
    }
}
