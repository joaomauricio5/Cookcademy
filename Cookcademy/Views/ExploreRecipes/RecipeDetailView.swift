//
//  RecipeDetailView.swift
//  Cookcademy
//
//  Created by Joao Mauricio on 10/03/2022.
//

import SwiftUI

struct RecipeDetailView: View {
    @Binding var recipe: Recipe
    
    @AppStorage("listBackgroundColor") var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") var listTextColor = AppColor.foreground
    
    @AppStorage("hideOptionalSteps") var hideOptionalSteps = false
    
    @State private var isPresenting = false
    
    @EnvironmentObject var recipeData: RecipeData
    
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
                        if hideOptionalSteps && direction.isOptional {
                            EmptyView()
                        } else {
                            HStack{
                                let indexOfDirection = recipe.index(of: recipe.directions[index], excludingOptionalDirections: hideOptionalSteps)!
                                Text("\(indexOfDirection + 1).").bold()
                                Text("\(direction.isOptional ? "(Optional) " : "")"
                                     + "\(direction.description)")
                            }
                        }
                        
                    }.listRowBackground(listBackgroundColor)
                }
            }
        }
        .onDisappear{try! recipeData.save()}
        .navigationTitle(recipe.mainInformation.name)
            .toolbar {
                ToolbarItem{
                    HStack {
                        Button(action: {isPresenting = true},
                               label: {Text("Edit")})
                        
                        Button(action: {recipe.isFavorite.toggle()},
                               label: {Image(systemName: recipe.isFavorite ? "heart.fill" : "heart")})
                    }
                }
            }
            .sheet(isPresented: $isPresenting, onDismiss: {}, content: {
                NavigationView{
                    ModifyRecipeView(recipe: $recipe)
                        .toolbar {
                            ToolbarItem(placement: .confirmationAction){
                                Button("Save") {
                                    isPresenting = false
                                }
                            }
                        }.navigationTitle("Edit Recipe")
                }
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
