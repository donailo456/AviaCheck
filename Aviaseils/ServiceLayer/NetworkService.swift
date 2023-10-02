//
//  NetworkService.swift
//  Aviaseils
//
//  Created by Danil Komarov on 25.07.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func getComments(origin: String, destination: String, departAt: String, returnAt: String, complition: @escaping (Result<[Datum], Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {

    func getComments(origin: String, destination: String, departAt: String, returnAt: String, complition: @escaping (Result<[Datum], Error>) -> Void) {
        let topHeadlinesURL = URL(string: "https://api.travelpayouts.com/aviasales/v3/prices_for_dates?origin=\(origin)&destination=\(destination)&departure_at=\(departAt)&return_at=\(returnAt)&unique=false&sorting=price&direct=false&cy=rub&limit=30&page=1&one_way=true&token=dfbf616b84716a125101ed05ae674fb3")
        guard let url = topHeadlinesURL else { return }
        
        let request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 10)
        
        URLSession.shared.dataTask(with: request) { (data, _, error ) in
            if let error = error {
                complition(.failure(error))
                return
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(Welcome.self, from: data)
                    complition(.success(result.data))
                } catch {
                    complition(.failure(error))
                }
            }
            
        }.resume()
    }
    
    
}
