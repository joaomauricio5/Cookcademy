//
//  SettingsView.swift
//  Cookcademy
//
//  Created by Joao Mauricio on 08/04/2022.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("hideOptionalSteps") private var hideOptionalSteps = false
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
    
    var body: some View {
        NavigationView{
            Form{
                ColorPicker("List Background Color", selection: $listBackgroundColor).padding()
                    .listRowBackground(listBackgroundColor)
                
                ColorPicker("List Text Color", selection: $listTextColor).padding()
                    .listRowBackground(listBackgroundColor)
                
                Toggle("Hide optional steps", isOn: $hideOptionalSteps).padding()
                    .listRowBackground(listBackgroundColor)
            }
            .navigationTitle("Settings")
            .foregroundColor(listTextColor)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SettingsView()
        }
    }
}
