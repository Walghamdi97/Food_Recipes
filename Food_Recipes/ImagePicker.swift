//
//  ImagePicker.swift
//  Food_Recipes
//
//  Created by Wejdan Alghamdi on 19/04/1446 AH.
//

import Foundation
import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    @Binding var isPickerShowing: Bool
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> PhotoCoordinator {
        return PhotoCoordinator(self)
    }
}

class PhotoCoordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var parent: ImagePicker
    init(_ picker: ImagePicker) {
        self.parent = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Run code when the user selected an image
        
        print("Image Selected")
       
        if let image = info[UIImagePickerController.InfoKey.originalImage]as? UIImage {
            
            DispatchQueue.main.async {
                self.parent.selectedImage = image
            }
           
        }
        parent.isPickerShowing = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Run code when the user has cancelled the picker UI
        
        print("Cancelled")
        
        parent.isPickerShowing = false
    }
}
