//
//  RecipeViewModel.swift
//  Food_Recipes
//
//  Created by Wejdan Alghamdi on 21/04/1446 AH.
//

import Foundation

final class RecipeViewModel: ObservableObject{
    @Published var cakeName: String = ""
    @Published var flour: Double = 2.5
    @Published var sugar: Double = 1.25
    @Published var eggs: Int = 3
    @Published var isActive = true
    @Published var showAddCakeSheet = false

    @Published var cakes: [Cake] = [ .init(name: "Chocolate cake" , flour: 2.5, sugar: 1.25, eggs: 3)]

    
    func addCake(){
        let newCake: Cake = Cake(name: cakeName, flour: flour, sugar: sugar, eggs: eggs)
        
        self.cakes.append(newCake)
        showAddCakeSheet.toggle()
    }
}
