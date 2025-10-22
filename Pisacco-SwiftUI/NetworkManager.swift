//
//  NetworkManager.swift
//  Pisacco-SwiftUI
//
//  Created by Dhathri Bathini on 10/22/25.
//
import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func getDataFromServer(url: String) async -> [ImageData] {
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return []
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let fetchedData = try decoder.decode(ImageList.self, from: data)
            return fetchedData.data
        }
        catch {
            print("Error fetching/parsing the data")
            return []
        }
    }
    
    func getImageDataFromServer(url: String) async -> ImageID {
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return ImageID()
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let fetchedData = try decoder.decode(ImageURLFetch.self, from: data)
            return fetchedData.data
        }
        catch {
            print("Error fetching/parsing the data")
            return ImageID()
        }
    }
}
