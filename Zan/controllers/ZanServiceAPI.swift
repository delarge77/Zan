//
//  ZanServiceAPI.swift
//  Zan
//
//  Created by Alessandro dos Santos Pinto on 10/09/2018.
//  Copyright © 2018 Delarge. All rights reserved.
//

import Foundation
import Alamofire

struct ZanServiceAPI {
	
}

extension ZanServiceAPI {
	
	func loadVideo(_ video: URLRequestConvertible, completion:@escaping(([Video]) -> Void)) {
		Alamofire.request(video).responseData { (data) in
			
			do{
				let json = try JSONSerialization.jsonObject(with: data, options: [])
				print("\(json)")
				let video = try JSONDecoder().decode([Video].self, from:data)
				
				print("\(video)")
				completion(video)
			} catch (let error) {
				print("\(error)")
			}
		}
	}
	
	func loadCategories(_ categories: URLRequestConvertible, completion:@escaping(([Categorie])->Void)) {
		Alamofire.request(categories).responseData { (data) in
			do {
				let categories = try JSONDecoder().decode([Categorie].self, from: data)
				completion(categories)
			} catch (let error ){
				print("\(error)")
			}
		}
	}
	
	func loadIdioms(_ idioms: URLRequestConvertible, completion:@escaping([Idiom]) -> Void) {
		Alamofire.request(idioms).responseData { (data) in
			let idioms = try! JSONDecoder().decode([Idiom].self, from:data)
			completion(idioms)
		}
	}
	
	func rateVideo(_ rate: URLRequestConvertible, completion:@escaping(String) -> Void) {
		Alamofire.request(rate).responseData { (data) in
			do{
				let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
				print("\(json)")
			} catch (let error) {
				print("\(error)")
			}
		}
	}
	
	func registerUser(_ register: URLRequestConvertible, completion:@escaping(Bool) -> Void) {
		Alamofire.request(register).responseData { (data) in
			do {
				let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
				print("\(json)")
			} catch (let error){
				print("\(error)")
			}
		}
	}
	
	func postVideo(videoData: Data, video: URLRequestConvertible, completion:@escaping(Bool) -> Void){
		Alamofire.upload(videoData, with: video).uploadProgress { (progress) in
			print("Upload Progress: \(progress.fractionCompleted)")
		}
			.responseJSON { (response) in
			debugPrint(response)
		}
	}
	
	func sendVideo(_ video: Data, params:[String:String], completion:@escaping(Bool) -> Void) {
		let headers: HTTPHeaders = [
			"application/json":"Accept",
//            "Content-Type":"text/html; charset=UTF-8"
		]
		Alamofire.upload(multipartFormData: { (multipartFormData) in
            
//            multipartFormData.append(url, withName: "video")//, fileName: "video.mp4", mimeType: "video/mp4")
            multipartFormData.append(video, withName: "video")
            
            for (key, value) in params {
                multipartFormData.append(Data(value.utf8), withName: key)
            }
            
		}, usingThreshold: UInt64.init(), to: URL(string: "https://zan.net.br/zam/uploadj.php")!, method: .post, headers: headers) { (multipartFormData) in
			switch multipartFormData {
			case .success(let upload, _, _):
//                upload.responseJSON { response in
//                    if let JSON = response.result.value as? NSDictionary {
//                        debugPrint("\(JSON)")
//                        completion(true)
//                    } else {
//                        completion(false)
//                        debugPrint(response)
//                    }
//                }
                upload.responseString(completionHandler: { (msg) in
                    debugPrint(msg)
                })
			case .failure(let encodingError):
				debugPrint(encodingError)
				completion(false)
			}
		}
	}
}
