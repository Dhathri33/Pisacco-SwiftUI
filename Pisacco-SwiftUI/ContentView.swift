//
//  ContentView.swift
//  Pisacco-SwiftUI
//
//  Created by Dhathri Bathini on 10/22/25.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var imageViewModel: ImageViewModel
    
    init(imageViewModel: ImageViewModel) {
        self.imageViewModel = imageViewModel
    }
    
    private var columns: [GridItem] =
        [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        ScrollView {
            Text("Picasso Artworks")
                .font(.title)
                .bold()
            LazyVGrid(columns: columns) {
                ForEach(imageViewModel.imageID.indices, id: \.self) { index in
                    let imgID = imageViewModel.imageID[index].image_id
                    VStack {
                        AsyncImage(url: URL(string: "https://www.artic.edu/iiif/2/\(imgID ?? "")/full/843,/0/default.jpg")) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .clipped()
                                .cornerRadius(8)
                        } placeholder: {
                            ProgressView()
                                .frame(width: 110, height: 110)
                        }
                        Text(imageViewModel.images[index].title ?? "")
                    }
                }
            }
        }
        .task {
            await imageViewModel.getData()
            await imageViewModel.getImageID()
        }
    }

}

#Preview {
    ContentView(imageViewModel: ImageViewModel(shared: NetworkManager.shared))
}
