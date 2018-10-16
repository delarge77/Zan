//
//  ZanServiceAPI.swift
//  Zan
//
//  Created by Alessandro dos Santos Pinto on 10/09/2018.
//  Copyright © 2018 Delarge. All rights reserved.
//

import Foundation

struct ZanServiceAPI {
    static let url = "https://zan.net.br/zam/api/cats.php"
}

extension ZanServiceAPI {
    func loadVideos(completion:@escaping([String])->Void) {
        
        guard let url = URL(string: ZanServiceAPI.url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print("\(json)")
            } catch (let error){
                print("\(error.localizedDescription)")
            }
            
        }.resume()
        
    }
}
