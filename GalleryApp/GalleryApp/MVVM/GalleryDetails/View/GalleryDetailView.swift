//
//  GalleryDetailView.swift
//  GalleryApp
//
//  Created by Abhishek Darak on 23/11/22.
//

import SwiftUI
import SDWebImageSwiftUI
import SwiftUIPager

struct GalleryDetailView: View {
    
    let galleryList: [GalleryModel]
    @StateObject var page: Page = .withIndex(0) //Default index
    
    var body: some View {
        
        Pager(page: page,
              data: galleryList,
              id: \.id,
              content: { galleryDetail in
            
            VStack {
                ScrollView {
                    Text(galleryDetail.title)
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .padding(.leading, 15)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    WebImage(url: URL(string: galleryDetail.hdUrl))
                        .resizable()
                        .placeholder {
                            LoadingView().frame(maxWidth: .infinity, minHeight: 200, alignment: .center)
                        }
                        .indicator(.activity)
                        .transition(.fade(duration: 0.5))
                        .scaledToFit()
                        .frame(width: .infinity, height: .infinity, alignment: Alignment.center)
                    
                    Text(galleryDetail.explanation!).padding(10)
                }
                .navigationTitle("Details")
            }
        })
        
    }
}

/*
 struct GalleryDetailView_Previews: PreviewProvider {
 static var previews: some View {
 GalleryDetailView(galleryDetail: GalleryModel(id: "", copyright: "", date: "", explanation: "", hdUrl: "", mediaType: "", serviceVersion: "", title: "", url: ""))
 }
 }*/
