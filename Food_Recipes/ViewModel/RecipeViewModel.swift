//
//  RecipeViewModel.swift
//  Food_Recipes
//
//  Created by Wejdan Alghamdi on 21/04/1446 AH.
//

import SwiftUI
import Combine


class RecipeViewModel: ObservableObject{
    
//    @Published var title: String = ""
//    @Published var description: String = ""
//    @Published var recipeImage: UIImage? 
//    @Published var ingrediant : [(name: String, type: String, amount: Int)] = []
//    @Published var isActive = true
//    @Published var showAddCakeSheet = false


    
    //@Published var recipe: [Recipe]=[]
//    @Published var recipe: [Recipe]=[.init(title: "Hallomi", description: "semi-hard cheese typically made from the milk of goats, sheep, or cows. It's known for its tangy taste and firm, chewy texture.", recipeImage: UIImage(), ingrediantName: "Palsamic", measurementNo: 2, measurementType: "Spoon"), .init(title: "Hallomi", description: "semi-hard cheese typically made from the milk of goats, sheep, or cows. It's known for its tangy taste and firm, chewy texture.", recipeImage: UIImage(), ingrediantName: "Palsamic", measurementNo: 2, measurementType: "Spoon"), .init(title: "Hallomi", description: "semi-hard cheese typically made from the milk of goats, sheep, or cows. It's known for its tangy taste and firm, chewy texture.", recipeImage: UIImage(), ingrediantName: "Palsamic", measurementNo: 2, measurementType: "Spoon"), .init(title: "Hallomi", description: "semi-hard cheese typically made from the milk of goats, sheep, or cows. It's known for its tangy taste and firm, chewy texture.", recipeImage: UIImage(), ingrediantName: "Palsamic", measurementNo: 2, measurementType: "Spoon")]
        //[.init(name: "Chocolate cake" , flour: 2.5, sugar: 1.25, eggs: 3)]
    
    //@Published private(set) var recipes: [Recipe] = []
   // @Published var recipes: [Recipe]=[.init(title: "Hallomi", description: "emi-hard cheese typically made from the milk of goats, sheep, or cows. It's known for its tangy taste and firm, chewy texture.", recipeImage: UIImage(), ingrediant: ["2 Palsamic Spoon", "2 water Cup"])]
    
    
//    func addNewRecipe(){
//        let newRecipe: Recipe = Recipe(title: title, description: description, recipeImage: UIImage(), ingrediant: [(name: "", type: "", amount: 0)])
//        
//        self.recipes.append(newRecipe)
//        showAddCakeSheet.toggle()
//        
//    }
    
    @Published var recipes: [Recipe] = []
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var selectedImage: UIImage? = nil
    @Published var ingredients: [(name: String, measurement: String, serving: Int)] = []
    
    
  
    
    // Function to add a new recipe
    func addRecipe(title: String, description: String , image: UIImage?, ingredients: [(name: String, measurement: String, serving: Int)]) {
        let newRecipe = Recipe(title: title, description: description, recipeImage: image, ingredients: ingredients)
        recipes.append(newRecipe)
    }
    
    func deleteRecipe(_ recipe: Recipe) {
            // Find the index of the recipe to be deleted
            if let index = recipes.firstIndex(where: { $0.id == recipe.id }) {
                recipes.remove(at: index)
            }
        }
    
}
