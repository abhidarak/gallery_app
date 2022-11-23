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
                    LoadingView()
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 2) {
                            ForEach(galleryVM.galleryData.indices, id: \.self) { index in
                                GalleryGridCell(galleryItem: galleryVM.galleryData[index])
                            }
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct GalleryGridView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryGridView()
    }
}
