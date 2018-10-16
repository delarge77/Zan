//
//  DataRequest+Request.swift
//  Zan
//
//  Created by Alessandro Santos Pinto on 28/09/2018.
//  Copyright © 2018 Delarge. All rights reserved.
//

import Foundation
import Alamofire

extension DataRequest {
	@discardableResult
	func responseArray(completion: @escaping (NSArray) -> Void) -> Self {
		return responseJSON { response in
			guard let httpResponse = response.response else {
				return
			}
			
			if httpResponse.statusCode == 200 {
				if let data = response.data {
					guard let object = try? JSONSerialization.jsonObject(with:data),
						let json = object as? NSArray else {
							return
					}
					completion(json)
				}
			}
		}
	}
	
	@discardableResult
	func responseData(completion: @escaping (Data) -> Void) -> Self {
		return responseJSON { response in
			guard let httpResponse = response.response else { return }
			if httpResponse.statusCode == 200 {
				if let data = response.data {
					completion(data)
				}
			}
		}
	}
}

