//
//  GalleryDetailView.swift
//  GalleryApp
//
//  Created by Abhishek Darak on 23/11/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct GalleryDetailView: View {
    
    let galleryDetail: GalleryModel
    
    var body: some View {
        
        VStack {
            
            WebImage(url: URL(string: galleryDetail.hdUrl))
                .resizable()
                .frame(width: .infinity, height: .infinity, alignment: Alignment.center)
            
            Text(galleryDetail.title)
        }
    }
}

struct GalleryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryDetailView(galleryDetail: GalleryModel(id: "", copyright: "", date: "", explanation: "", hdUrl: "", mediaType: "", serviceVersion: "", title: "", url: ""))
    }
}
