//
//  Extensions.swift
//  Food_Recipes
//
//  Created by Wejdan Alghamdi on 19/04/1446 AH.
//

import SwiftUI

// MARK: Custom View Property Extensions

extension View{
    // MARK: Building a custom modifier for custom popup
    
    func ingrediantPopupView<Content: View>(horizontalPadding: CGFloat = 50, show: Binding<Bool>, @ViewBuilder content: @escaping ()-> Content)->some View{
        
        return self
        
            .overlay {
                if show.wrappedValue {
                    // MARK: Geometry reader for reading container frame
                    GeometryReader{ proxy in
                        
                        let size = proxy.size
                        
                        NavigationView{
                            
                            content()
                        }
                        .frame(width: size.width - horizontalPadding, height: size.height / 1.7, alignment: .center)
                        // corner redius
                        .cornerRadius(15)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        
                    }
                }
            }
    }
    
}
