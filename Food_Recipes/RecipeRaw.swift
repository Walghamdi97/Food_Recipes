//
//  RecipeRaw.swift
//  Food_Recipes
//
//  Created by Wejdan Alghamdi on 24/04/1446 AH.
//

import SwiftUI

struct RecipeRaw: View {
    
    var recipes = RecipeViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("Halloumi")
                    .resizable()
                //.aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 250)
                // .aspectRatio(contentMode: .fit)
                Rectangle()
                    .background(.thinMaterial)
                    .frame(width: 400, height: 250)
                    .opacity(0.25)
                
                    //.ignoresSafeArea()
                
                VStack(alignment: .leading){
                    Text(recipes.title)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        
                    HStack{
                        Text(recipes.description)
                            .font(.caption)
                            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.white)
                        NavigationLink(destination: ContentView()){
                            Text("See All")
                                .font(.caption)
                                .foregroundColor(Color(red: 0.984313725490196, green: 0.3803921568627451, blue: 0.07058823529411765))
                                .padding(.top)
                            
                        }
                
                    }
                    
                }.padding(.horizontal)
                 .offset(y: 50)
            }
            
        }
    }
}

#Preview {
    RecipeRaw(recipes: RecipeViewModel())
}
