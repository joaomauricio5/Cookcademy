//
//  ModifyMainInformationView.swift
//  Cookcademy
//
//  Created by Joao Mauricio on 22/03/2022.
//

import SwiftUI

struct ModifyMainInformationView: View {
    @Binding var mainInformation : MainInformation
    
    var body: some View {
        Form{
            Section(content: {
                TextField("Recipe Name", text: $mainInformation.name)
            },
                    header: {Text("Recipe name")})
            
            Section(content: {
                TextField("Author", text: $mainInformation.author)
            },
                    header: {Text("Author name")})
            
            Section(content: {
                TextEditor(text: $mainInformation.description)
            },
                    header: {Text("Description")})
            
            Section(content: {
                Picker("Recipe type", selection: $mainInformation.category) {
                    Text("Breakfast").tag(Category.breakfast)
                    Text("Lunch").tag(Category.lunch)
                    Text("Dinner").tag(Category.dinner)
                    Text("Dessert").tag(Category.dessert)
                }.pickerStyle(.menu)
            },
                    header: {Text("Recipe Category")})
            
        }
    }
}

struct ModifyMainInformationView_Previews: PreviewProvider {
    static var previews: some View {
        ModifyMainInformationView(mainInformation: .constant(MainInformation(name: "testName", description: "testDescription", author: "testAuthor", category: .breakfast)))
    }
}
