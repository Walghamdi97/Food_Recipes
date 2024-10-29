//
//  Recipe.swift
//  Food_Recipes
//
//  Created by Wejdan Alghamdi on 21/04/1446 AH.
//

import SwiftUI



//struct Ingrediant: Identifiable{
//    let id: UUID = .init()
//    let ingrediantName: String
//    let measurementNo: Int
//    let measurementType: String
//    
//    
//}
struct Recipe: Identifiable{
    let title: String
    let description: String
    let recipeImage: UIImage?
    let ingredients: [(name: String, measurement: String, serving: Int)]
   
    
    let id: UUID = .init()
    
}
