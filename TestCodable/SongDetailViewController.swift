//
//  SongDetailViewController.swift
//  TestCodable
//
//  Created by Yvonne on 2019/12/11.
//  Copyright © 2019 Yvonne. All rights reserved.
//

import UIKit
import AVKit

class SongDetailViewController: UIViewController {
    let song: Song
    var player: AVPlayer?
    
    init?(corder: NSCoder,song: Song){
        self.song = song
        
        super.init(coder: corder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        // Do any additional setup after loading the view.
        player = AVPlayer(url: song.previewUrl)
        player?.play()
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
