//
//  NetworkService.swift
//  WeatherForecast
//
//  Created by Batuhan Mıcık on 3.10.2021.
//

import Foundation

final class NetworkManager<T: Codable>{
    static func fetch(for url: URL, completion: @escaping(Result<T, NetError>)-> Void){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            //error
            guard error == nil else{
                completion(.failure(.error(err: error!.localizedDescription)))
                return
            }
            
            //if response failed
            guard let httpResp = response as? HTTPURLResponse, httpResp.statusCode == 200 else{
                completion(.failure(.invResponse))
                return
            }
            //if data failed
            guard let data = data else{
                completion(.failure(.invData))
                return
            }
            do{
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            }catch let err{
                print(err)
            }
            
        }.resume()
    }
}
enum NetError: Error {
    case invResponse
    case invData
    case error(err: String)
    case decodingError(err:String)
}
