//
//  RecipeDetails.swift
//  Food_Recipes
//
//  Created by Wejdan Alghamdi on 25/04/1446 AH.
//

import SwiftUI

struct RecipeDetails: View {
    
    @ObservedObject var recipeVM = RecipeViewModel()
    
    var body: some View {
        
        NavigationView {
            
            ScrollView{
                VStack {
                    
                    Image("Halloumi")
                        .resizable()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                               maxHeight: 250)
                    
                    
                    
                    Text(recipeVM.recipes.description)
                    
                    Text("ingrediant")
                    
                    Spacer()
                }}
            .navigationBarItems(
                trailing: NavigationLink( destination: NewRecipe(recipeVM: recipeVM), label: {Text("Edit").foregroundColor(Color(red: 0.984313725490196, green: 0.3803921568627451, blue: 0.07058823529411765))
                }))
            .navigationTitle("Recipe Details")
            .toolbarBackground(Color.clear, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
            
            
            
        }
    }
}


