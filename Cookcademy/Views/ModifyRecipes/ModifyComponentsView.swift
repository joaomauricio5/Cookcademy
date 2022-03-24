//
//  ModifyIngredientsList.swift
//  Cookcademy
//
//  Created by Joao Mauricio on 23/03/2022.
//

import SwiftUI

protocol ModifyComponentView: View {
    associatedtype Component
    init(component: Binding<Component>, createAction: @escaping (Component) -> Void)
}


struct ModifyComponentsView<Component: RecipeComponent, DestinationView: ModifyComponentView>: View where DestinationView.Component == Component{
    
    @State private var newComponent = Component()
    @Binding var componentsList : [Component]
    
    var body: some View {
        
        //////////////////////////////////// Closure to save new component to componentsList
        let saveComponentAction = { (component: Component) -> Void in
            componentsList.append(component)
            newComponent = Component()
        }
        ///////////////////////////
        
            Form{
                if !componentsList.isEmpty {
                    ForEach(componentsList.indices, id: \.self) { index in
                        Text(componentsList[index].description)
                        
                    }
                }
                NavigationLink(destination: DestinationView(component: $newComponent, createAction: saveComponentAction),
                               label: {Text("Add a new component...")}).buttonStyle(.borderless)
            }
    }
}


struct ModifyComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ModifyComponentsView<Ingredient, ModifyIngredientView>(componentsList: .constant([Ingredient]() ) )
        }
        
    }
}
