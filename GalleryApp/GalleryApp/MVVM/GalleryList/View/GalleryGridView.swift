//
//  GalleryGridView.swift
//  GalleryApp
//
//  Created by Abhishek Darak on 23/11/22.
//

import SwiftUI

struct GalleryGridView: View {
    
    @StateObject var galleryVM: GalleryGridViewModel = GalleryGridViewModel()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init() {}
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                if galleryVM.isLoading {
                    LoadingView().frame(width: .infinity, height: 200, alignment: .center)
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 4) {
                            ForEach(galleryVM.galleryData.indices, id: \.self) { index in
                                
                                NavigationLink(destination: GalleryDetailView(galleryList: galleryVM.galleryData, page: .withIndex(index))) {
                                    
                                    GalleryGridCell(galleryItem: galleryVM.galleryData[index], allGalleryItems: galleryVM.galleryData)
                                    
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("NASA Image Gallery")
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct GalleryGridView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryGridView()
    }
}
