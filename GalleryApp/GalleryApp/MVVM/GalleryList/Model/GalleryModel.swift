//
//  GalleryModel.swift
//  GalleryApp
//
//  Created by Abhishek Darak on 23/11/22.
//

import Foundation

struct GalleryModel: Codable, Identifiable, Equatable {
    let id: String = UUID().uuidString
    let copyright: String?
    let date: String?
    let explanation: String?
    let hdUrl: String
    let mediaType: String?
    let serviceVersion: String?
    let title: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case copyright
        case date
        case explanation
        case hdUrl = "hdurl"
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title
        case url
    }
}
