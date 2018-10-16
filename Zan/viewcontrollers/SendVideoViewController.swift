//
//  SendVideoViewController.swift
//  Zan
//
//  Created by Alessandro Santos Pinto on 10/10/2018.
//  Copyright © 2018 Delarge. All rights reserved.
//

import UIKit
import AVKit
import MobileCoreServices

class SendVideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	@IBAction func playVideo(_ sender: AnyObject) {
		VideoHelper.startMediaBrowser(delegate: self, sourceType: .savedPhotosAlbum)
	}
}

// MARK: - UIImagePickerControllerDelegate

extension SendVideoViewController: UIImagePickerControllerDelegate {
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		
		guard let mediaType = info[UIImagePickerControllerMediaType] as? String,
			mediaType == (kUTTypeMovie as String),
			let url = info[UIImagePickerControllerMediaURL] as? URL
			else { return }
		
		let api = ConnectionController()
		do {
			let video = try Data(contentsOf: url)
			api.postVideo(video: video) { (posted) in
				print("\(posted)")
			}
		} catch (let error) {
			print("\(error)")
		}
		
		dismiss(animated: true, completion: nil)
	}
}

// MARK: - UINavigationControllerDelegate

extension SendVideoViewController: UINavigationControllerDelegate {
}
