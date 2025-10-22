//
//  ImageViewModel.swift
//  Pisacco-SwiftUI
//
//  Created by Dhathri Bathini on 10/22/25.
//

import Combine

class ImageViewModel: ObservableObject {
    
    var shared: NetworkManager
    @Published var images: [ImageData] = []
    @Published var imageID: [ImageID] = []
    init(shared: NetworkManager){
        self.shared = shared
    }
    
    func getData() async {
        images = await shared.getDataFromServer(url: Constants.endPoint)
    }
    
    func getImageID() async {
        for image in images {
            imageID.append(await shared.getImageDataFromServer(url: image.api_link ?? ""))
        }
    }
}
