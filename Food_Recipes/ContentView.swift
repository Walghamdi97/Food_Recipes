//
//  ContentView.swift
//  Food_Recipes
//
//  Created by Wejdan Alghamdi on 18/04/1446 AH.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var recipeVM = RecipeViewModel()
    
    var body: some View {
        
        NavigationView{
            VStack{
                if recipeVM.recipes.isEmpty{
                    
                    
                    Image("forkandknif")
                    Text("There are no recipes yet.")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Please add your recipes")
                   
                }else { // List of saved recipes
                    ScrollView{
                        VStack(spacing: 20){
                        ForEach (recipeVM.recipes){ recipe in
                           
                            ZStack(alignment: .bottomLeading){
                                    if let selectedImage = recipe.recipeImage {
                                        Image(uiImage: selectedImage)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 400, height: 230)
                                    }
                                    
//                                    Rectangle()
//                                        .background(.thinMaterial)
//                                        .frame(width: 400, height: 230)
//                                        .opacity(0.25)
                                    
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.black.opacity(0.9), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top
                                    )
                                    //.ignoresSafeArea()
                                    
                                    VStack(alignment: .leading){
                                        Text(recipe.title)
                                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                        
                                        HStack{
                                            Text(recipe.description)
                                                .font(.caption)
                                                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                                                .foregroundColor(Color.white)
                                            //                                                NavigationLink(destination: RecipeDetails()){
                                            Text("See All")
                                                .font(.caption)
                                                .foregroundColor(Color(red: 0.984313725490196, green: 0.3803921568627451, blue: 0.07058823529411765))
                                                .padding(.top)
                                            
                                            
                                            
                                        }
                                        
                                    }.padding(.horizontal)
                                        .offset(y: 50)
                                    
                                }}}
                        Spacer()
                    }}
                
            }.padding()
                .navigationBarItems(
                    trailing: NavigationLink( destination: NewRecipe(recipeVM: recipeVM), label: {Image(systemName: "plus").foregroundColor(Color(red: 0.984313725490196, green: 0.3803921568627451, blue: 0.07058823529411765))
                    }))
                .navigationTitle("Food Recipes")
                .toolbarBackground(Color.clear, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            
            
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
