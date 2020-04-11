//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Elena Džojić on 10/04/2020.
//  Copyright © 2020 Stjepan Dzojic. All rights reserved.
//

import Foundation

class NetworkManager{
    let apiKey = "?api_key=83b595bfa80ba9db23c49b34eaf80035"
    
    func getData(from url: String, _ completed: @escaping([MovieList]?)->Void){
        guard let safeUrl = URL(string: url + apiKey)else{return}
        URLSession.shared.dataTask(with: safeUrl){ data, urlResponse, error in
            guard let safeData = data, error == nil, urlResponse != nil else {
                completed(nil)
                return
            }
            do{
                if let decodedObject: Response<[MovieList]> = SerializationManager.parseData(jsonData: safeData){
                    DispatchQueue.main.async {
                        completed(decodedObject.results)
                    }
                }else{
                    print("ERROR: palo parsanje")
                    completed(nil)
                }
            }catch let error{
                print("Error: \(error.localizedDescription)")
                completed(nil)
            }
        }.resume()
    }
    
    /*func getDataGenre(from url: String, _ completed: @escaping([Genre]?)->Void){
        guard let safeUrl = URL(string: url + apiKey)else{return}
        URLSession.shared.dataTask(with: safeUrl){ data, urlResponse, error in
            guard let safeData = data, error == nil, urlResponse != nil else {
                completed(nil)
                return
            }
            do{
                if let decodedObject: Response<[Genre]> = SerializationManager.parseData(jsonData: safeData){
                    DispatchQueue.main.async {
                        completed(decodedObject.genres)
                    }
                }else{
                    print("ERROR: palo parsanje")
                    completed(nil)
                }
            }catch let error{
                print("Error: \(error.localizedDescription)")
                completed(nil)
            }
        }.resume()
    }*/
}

