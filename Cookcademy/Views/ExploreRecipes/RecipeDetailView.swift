//
//  RecipeDetailView.swift
//  Cookcademy
//
//  Created by Joao Mauricio on 10/03/2022.
//

import SwiftUI

struct RecipeDetailView: View {
    @Binding var recipe: Recipe
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    @State private var isPresenting = false
    
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
                }.listRowBackground(listBackgroundColor)
                Section(header: Text("Directions")) {
                    ForEach(recipe.directions.indices) { index in
                        let direction = recipe.directions[index]
                        HStack {
                            Text("\(index + 1).").bold()
                            Text("\(direction.isOptional ? "(Optional) " : "")"
                                 + "\(direction.description)")
                        }
                    }
                }.listRowBackground(listBackgroundColor)
            }
        }.navigationTitle(recipe.mainInformation.name)
            .toolbar {
                ToolbarItem{
                    Button(action: {isPresenting.toggle()},
                           label: {Text("Edit")})
                }
            }
            .sheet(isPresented: $isPresenting, onDismiss: {}, content: {
                ModifyRecipeView(recipe: $recipe)
            })
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RecipeDetailView(recipe: .constant(RecipeData().recipes[1]))
        }
    }
}
