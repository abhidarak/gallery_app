//
//  GalleryGridCell.swift
//  GalleryApp
//
//  Created by Abhishek Darak on 23/11/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct GalleryGridCell: View {
    
    let galleryItem: GalleryModel
    
    var body: some View {
        
        NavigationLink(destination: GalleryDetailView(galleryDetail: galleryItem)) {
            
            VStack {
                WebImage(url: URL(string: galleryItem.url))
                    .resizable()
                    .frame(width: .infinity, height: 80, alignment: Alignment.center)
                
            }
        }
    }
}

struct GalleryGridCell_Previews: PreviewProvider {
    static var previews: some View {
        GalleryGridCell(galleryItem: GalleryModel(id: "", copyright: "", date: "", explanation: "", hdUrl: "", mediaType: "", serviceVersion: "", title: "Test Title", url: ""))
    }
}
