//
//  RecipeDetailView.swift
//  Cookcademy
//
//  Created by Joao Mauricio on 10/03/2022.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    var body: some View {
        VStack{
            HStack{
                Text("Author: \(recipe.mainInformation.author)")
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            HStack{
                Text(recipe.mainInformation.description)
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            List {
                Section(header: Text("Ingredients")) {
                    ForEach(recipe.ingredients.indices, id: \.self) { index in
                        Text(recipe.ingredients[index].description)
                    }
                }
                Section(header: Text("Directions")) {
                    ForEach(recipe.directions.indices) { index in
                        let direction = recipe.directions[index]
                        HStack {
                            Text("\(index + 1).").bold()
                            Text("\(direction.isOptional ? "(Optional) " : "")"
                                 + "\(direction.description)")
                        }
                    }
                }
            }
        }.navigationTitle(recipe.mainInformation.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RecipeDetailView(recipe: RecipeData().recipes[1])
        }
    }
}
