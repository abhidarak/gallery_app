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
    let selectedIndex: Int
    
    @StateObject var page: Page = .withIndex(0)

    var body: some View {
                
        Pager(page: page,
              data: galleryList,
              id: \.id,
              content: { galleryDetail in
            // create a page based on the data passed
            
            //let galleryDetail: GalleryModel = try! galleryList[Int.init(from: index as! Decoder)]
            
            VStack {
            
            WebImage(url: URL(string: galleryDetail.hdUrl))
                    .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                        .placeholder(Image(systemName: "photo")) // Placeholder Image
                        // Supports ViewBuilder as well
                        .placeholder {
                            Rectangle().foregroundColor(.gray)
                        }
                        .indicator(.activity) // Activity Indicator
                        .transition(.fade(duration: 0.5)) // Fade Transition with duration
                        .scaledToFit()
                    .frame(width: .infinity, height: .infinity, alignment: Alignment.center)
                    
                
            
            
            Text(galleryDetail.title)
                
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
