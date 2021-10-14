//
//  NetworkService.swift
//  MVC-N
//
//  Created by Sergey Lobanov on 14.10.2021.
//

import Foundation

// Singleton
class NetworkService {
    static let shared = NetworkService()
    private init() {}

    public func getData(url: URL, completion: @escaping (Any) -> ()) {
        let session = URLSession.shared

        session.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                
                // теперь надо передать json в комплишен. Комплишен ведет к обновлению UI. Поэтому помещаем его в GCD
                DispatchQueue.main.async {
                    completion(json)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
