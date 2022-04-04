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
        VStack {
            HStack {
                Text("\(Component.componentName.capitalized)s").font(.headline).padding()
                Spacer()
                EditButton().padding()
            }
            Form{
                    if !componentsList.isEmpty {
                        ForEach(componentsList.indices, id: \.self) { index in
                            NavigationLink(destination: {DestinationView(component: $componentsList[index], createAction: {_ in return})}) {
                                Text(componentsList[index].description)
                            }
                        }.onDelete(perform: {_ in })
                            .onMove(perform: {_,_ in })
                    }
                    NavigationLink(destination: DestinationView(component: $newComponent, createAction: saveComponentAction),
                                   label: {Text("Add a new \(Component.componentName)...")}).buttonStyle(.borderless)
            }
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
