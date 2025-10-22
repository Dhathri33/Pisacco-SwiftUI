//
//  ImageData.swift
//  Pisacco-SwiftUI
//
//  Created by Dhathri Bathini on 10/22/25.
//
struct ImageData: Decodable {
    var id: Int?
    var title: String?
    var api_link: String?
}

struct ImageList: Decodable {
    var data: [ImageData]
}

struct ImageID: Decodable {
    var image_id: String?
}

struct ImageURLFetch: Decodable {
    var data: ImageID
}
