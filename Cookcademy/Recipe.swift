//
//  Recipe.swift
//  Cookcademy
//
//  Created by João Mauricio UWE ID 18030724 on 09/03/2022.
//

import Foundation

enum Category {
    case Breakfast
    case Lunch
    case Dinner
    case Dessert
}

enum Unit: String {
    case oz = "Ounces"
    case g = "Grams"
    case cups = "Cups"
    case tbs = "Tablespoons"
    case tsp = "Teaspoons"
    case none = "No units"
}

struct MainInformation {
    var name: String
    var description: String
    var author: String
    var category: Category
}

struct Ingredient {
    var name: String
    var quantity: Double
    var unit: Unit
}

struct Direction {
    var description: String
    var isOptional: Bool
}

struct Recipe {
    var mainInformation: MainInformation
    var ingredients: [Ingredient]
    var directions: [Direction]
}


