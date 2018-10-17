//
//  PlayVideoViewController.swift
//  Zan
//
//  Created by Alessandro Santos Pinto on 10/10/2018.
//  Copyright © 2018 Delarge. All rights reserved.
//

import UIKit
import AVKit

class PlayVideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		let api = ConnectionController()
		api.loadVideoWith(category: "3") { [weak self] (video) in
			let v = video[0]
			self?.playVideoFrom(url: v.URL)
		}
    }
	
	func playVideoFrom(url: URL) {
		let player = AVPlayer(url: url)
		let vcPlayer = AVPlayerViewController()
		vcPlayer.player = player
		self.present(vcPlayer, animated: true, completion: nil)
	}
}
