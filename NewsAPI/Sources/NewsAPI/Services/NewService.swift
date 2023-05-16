//
//  NewService.swift
//  
//
//  Created by Alper Ban on 16.05.2023.
//

import Foundation
import Alamofire

public protocol PopularNewServiceProtocol {
    func fetchPopularNews(completion: @escaping (Result<[New], Error>) -> Void)
}


public class PopularNewService: PopularNewServiceProtocol {
    public init() {}
    
    
    public func fetchPopularNews(completion: @escaping (Result<[New], Error>) -> Void) {
        
        let urlString = "https://api.nytimes.com/svc/topstories/v2/home.json?api-key=1BbfdRTHFXNCKtq06y2Dv5CCeGgMBRiH"
        AF.request(urlString).responseData { response in
            switch response.result {
                
            case .success(let data):
                let decoder = Decoders.dateDecoder
                
                do {
                    let response = try decoder.decode(PopularNewResponse.self, from: data)
                    completion(.success(response.results))
                }catch{
                    print("************** JSON DECODE ERROR ************")
                }
            case .failure(let error):
                print("***************** GEÇİCİ BİR SORUN OLUŞTU ******************* \(error.localizedDescription)")
            }
        }
    }
}
