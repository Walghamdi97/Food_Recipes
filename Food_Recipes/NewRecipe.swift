//
//  NewRecipe.swift
//  Food_Recipes
//
//  Created by Wejdan Alghamdi on 19/04/1446 AH.
//

import SwiftUI

struct NewRecipe: View {
    
    @ObservedObject var recipeVM: RecipeViewModel
    
    @State var isPickerShowing = false
    @State var showPopup = false
    @State private var selectedImage: UIImage?
    @State private var ingredients: [(name: String, measurement: String, serving: Int)] = []
    
    @State private var title = ""
    @State private var description = ""
    @State private var ingredientsName = ""
    @State private var ingredientsType = ""
    @State private var ingredientsNo = 1
    @State private var navigateToHome = false
    
    //@Environment(\.presentationMode) var presentationMode
   @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        ZStack{
            NavigationView{
                ScrollView{
                    VStack {
                        
                        ZStack{
                            Rectangle()
                                .stroke(style: StrokeStyle(lineWidth: 2, dash: [6]))
                                .frame(width: 400.0, height: 185.0)
                                .foregroundColor(Color(red: 0.984313725490196, green: 0.3803921568627451, blue: 0.07058823529411765))
                                .background(Rectangle().fill(.gray.opacity(0.23)))
                            // .padding(.top)
                            
                            
                            Button (action: {
                                isPickerShowing = true
                            })
                            { if let image = selectedImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: 400.0, height: 185.0)
                                
                            } else {
                                VStack{
                                    Image(systemName:"photo.badge.plus")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 80, height: 60)
                                        .foregroundColor(Color(red: 0.984313725490196, green: 0.3803921568627451, blue: 0.07058823529411765))
                                    Text("Upload Photo")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(red: 0.984313725490196, green: 0.3803921568627451, blue: 0.07058823529411765))
                                    //.offset(y: 55)
                                }
                            }
                                
                            }
                            
                            
                        } .padding(.top, -30)
                        
                        
                        VStack{
                            Text("Title").font(.title2).fontWeight(.bold).frame(maxWidth: .infinity, alignment: .leading).padding()
                                .frame(alignment: .top)
                            
                            TextField("Title", text: $title)
                                .padding()
                                .frame(width: 360.0, height: 50.0)
                                .background(Color.gray.opacity(0.23).cornerRadius(10))
                                .padding(.all, -10)
                            
                            Text("Description").font(.title2).fontWeight(.bold).frame(maxWidth: .infinity, alignment: .leading).padding()
                                .frame(alignment: .top)
                            TextField("Description", text:$description)
                                .padding()
                                .frame(width: 360.0, height: 150.0, alignment: .topLeading)
                                .background(Color.gray.opacity(0.23).cornerRadius(10))
                                .padding(.all, -10)
                            
                            HStack{
                                Text("Add Ingrediant")
                                    .font(.title2).fontWeight(.bold).frame(maxWidth: .infinity, alignment: .leading).padding()
                                Button(action:{
                                    
                                    withAnimation{
                                        showPopup.toggle()
                                    }
                                    
                                }){
                                    Image(systemName: "plus")
                                        .foregroundColor(Color(red: 0.984313725490196, green: 0.3803921568627451, blue: 0.07058823529411765))
                                    
                                }.padding()
                                
                            }
                            
                            VStack{
                                ForEach(ingredients, id: \.name) { ingredient in
                                    HStack {
                                        Text("\(ingredient.serving)")
                                            .foregroundColor(.orange)
                                        Text(ingredient.name)
                                            .fontWeight(.bold)
                                            .foregroundColor(.orange)
                                        Spacer()
                                        Text(ingredient.measurement)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .padding(.leading ,2)
                                            .frame(width: 95, height: 29)
                                            .background(Color.orange)
                                            .cornerRadius(4)
                                       
                                    }
                                    .padding()
                                    .frame(width: 370, height: 52)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                                    
                                }
                            }
                            
                        }
                    }.padding(.top,40)
                    
                }.navigationBarBackButtonHidden(true)
                    .toolbar{
                        ToolbarItem(placement: .navigationBarLeading){
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }){
                                Image(systemName: "chevron.left").foregroundColor(Color(red: 0.984313725490196, green: 0.3803921568627451, blue: 0.07058823529411765))
                                    Text("back")
                                        .foregroundColor(Color(red: 0.984313725490196, green: 0.3803921568627451, blue: 0.07058823529411765))
                            }
                        }
                                   
                        ToolbarItem(placement: .navigationBarTrailing)
                                   {
                                Button(action: {
                                    recipeVM.addRecipe(title: title, description: description, image: selectedImage, ingredients: ingredients)
                                    presentationMode.wrappedValue.dismiss()
                                    //navigateToHome=true
                                }){
                                    Text("Save")
                                    .foregroundColor(Color(red: 0.984313725490196, green: 0.3803921568627451, blue: 0.07058823529))}
                            }
                                   
                    }
                                   
                    .navigationTitle("New Recipes")
                    .toolbarBackground(Color.clear, for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                
                    .sheet(isPresented: $isPickerShowing, onDismiss: nil){
                        ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
                    }
                
               
               
            }.navigationBarBackButtonHidden(true)
           
            if showPopup {
                IngrediantPopuoView(show: $showPopup, ingredients: $ingredients)
                
            }
        }
        
    }}

#Preview {
    NewRecipe(recipeVM: RecipeViewModel())
}



struct BlurView : UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
    
}

struct IngrediantPopuoView : View {
    
    @Binding var show : Bool
    @Binding var ingredients: [(name: String, measurement: String, serving: Int)]
    @State var ingrediantName = ""
    let measurement = ["🥄 Spoon", "🥛 Cup"]
    @State var measurType = ""
    @State var selectedMeasur = false
    @State var measurCount = 1
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
            VStack(spacing: 25){
                VStack{
                    Text("Ingrediant Name").font(.title2).fontWeight(.bold).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 5)
                        .frame(alignment: .top)
                    
                    TextField("Ingrediant Name", text: $ingrediantName)
                        .padding()
                        .frame(width: 300.0, height: 50.0)
                        .background(Color.gray.opacity(0.23).cornerRadius(10))
                        .padding(.all, -10)
                }
                
                VStack(alignment: .leading){
                    Text("Measurement").font(.title2).fontWeight(.bold).frame(maxWidth: .infinity, alignment: .leading).padding(10)
                        .frame(alignment: .top)
                    
                    HStack(alignment:.top,spacing: 10){
                        
                        Button{
                            measurType = "🥄 Spoon"
                        }label:{
                            Text("\(measurement[0])")
                                .padding(.horizontal, 8)
                                .frame(width: 100, height: 26)
                                .foregroundColor(.white)
                        }.buttonStyle(.borderedProminent)
                            .tint(Color(red: 0.984313725490196, green: 0.3803921568627451, blue: 0.07058823529411765))
                        
                        
                        Button{
                            measurType = "🥛 Cup"
                        }label:{
                            Text("\(measurement[1])")
                                .padding(.horizontal, 8)
                                .frame(width: 100, height: 26)
                                .foregroundColor(.white)
                        }.buttonStyle(.borderedProminent)
                            .tint(Color(red: 0.984313725490196, green: 0.3803921568627451, blue: 0.07058823529411765))
                        
                    }
                }
                
                
                VStack(alignment: .leading){
                    Text("Serving").font(.title2).fontWeight(.bold).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 5)
                        .frame(alignment: .top)
                    
                    HStack(spacing: 30){
                        HStack(spacing: 20){
                            Button{
                                
                                measurCount = measurCount - 1
                                
                            }label: {
                                Image(systemName: "minus")
                                    .padding(40)
                                    .foregroundColor(Color(red: 0.984313725490196, green: 0.3803921568627451, blue: 0.07058823529411765))
                                    .frame(maxWidth: 30, maxHeight: 30)
                                
                            }.background(Color.gray.opacity(0.23))
                                .border(Color(red: 0.984313725490196, green: 0.3803921568627451, blue: 0.07058823529411765))
                            
                            Text("\(measurCount)")
                                .font(.system(size: 25))
                            
                            Button{
                                
                                measurCount = measurCount + 1
                                
                            }label: {
                                Image(systemName: "plus")
                                    .padding(40)
                                    .foregroundColor(Color(red: 0.984313725490196, green: 0.3803921568627451, blue: 0.07058823529411765))
                                    .frame(maxWidth: 30, maxHeight: 30)
                                
                            }.background(Color.gray.opacity(0.23))
                                .border(Color(red: 0.984313725490196, green: 0.3803921568627451, blue: 0.07058823529411765))
                        }
                        
                        
                        
                        Button{
                            
                        }label:{
                            Text("\(measurType)")
                                .padding(.horizontal, 8)
                                .frame(width: 110, height: 26)
                                .foregroundColor(.white)
                        }.buttonStyle(.borderedProminent)
                            .tint(Color(red: 0.984313725490196, green: 0.3803921568627451, blue: 0.07058823529411765))
                        
                    }.background(.gray.opacity(0.23))
                    
                    
                }
                
                HStack{
                    
                    Button{
                        withAnimation{
                            show.toggle()
                        }
                    }label:{
                        Text("Cancel")
                            .padding(.horizontal, 8)
                            .frame(width: 130, height: 26)
                            .foregroundColor(Color(red: 0.984313725490196, green: 0.3803921568627451, blue: 0.07058823529411765))
                    }.buttonStyle(.borderedProminent)
                        .tint(Color.gray.opacity(0.23))
                    
                    
                    Button{
                        if !ingrediantName.isEmpty{
                            ingredients.append((name: ingrediantName, measurement: measurType, serving: measurCount))
                        }
                        show=false
                    }label:{
                        Text("Add")
                            .padding(.horizontal, 8)
                            .frame(width: 130, height: 26)
                            .foregroundColor(.white)
                    }.buttonStyle(.borderedProminent)
                        .tint(Color(red: 0.984313725490196, green: 0.3803921568627451, blue: 0.07058823529411765))
                    
                }
           
            }
            .frame(width: 306, height: 400)
            .padding(.vertical,20)
            .padding(.horizontal,20)
            .background(Color.white)
            .cornerRadius(15)
            
            
            
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        .background(Color.primary.opacity(0.35))
    }
}
