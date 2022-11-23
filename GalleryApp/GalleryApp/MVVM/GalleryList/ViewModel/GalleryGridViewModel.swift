//
//  GalleryGridViewModel.swift
//  GalleryApp
//
//  Created by Abhishek Darak on 23/11/22.
//

import Foundation

class GalleryGridViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var galleryData: [GalleryModel] = []
    
    init() {
        getGalleryData()
    }
    
    func getGalleryData() {
        
        self.isLoading = true
        
        ServiceAPI.sharedInstance.execute() { result in
            
            self.isLoading = false

            switch result {
            case .success(let data):
                let resArray = try! JSONDecoder().decode([GalleryModel].self, from: data.rawData())
                self.galleryData = resArray
                
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
}
