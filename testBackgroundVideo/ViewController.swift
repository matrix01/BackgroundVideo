//
//  ViewController.swift
//  testBackgroundVideo
//
//  Created by AAPBD on 5/18/16.
//  Copyright © 2016 AAPBD. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var myCustomView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let background = UIView.videoBackgroundWithName("Mahas.mp4", type: "mov", view: self.view)
        self.view.addSubview(background!)
        self.view.sendSubviewToBack(background!)
    }
    func addBackgroundVideo(name: String, type: String) {
        //http://stackoverflow.com/questions/5361145/looping-a-video-with-avfoundation-avplayer
        //http://stackoverflow.com/questions/29261692/how-do-i-add-a-gif-video-to-landing-screen-background-in-xcode-6-using-swift
        let filePath = NSBundle.mainBundle().pathForResource("\(name)", ofType: "\(type)")
        let myPlayerView = UIView(frame: self.view.bounds)
        myPlayerView.backgroundColor = UIColor.blackColor()
        self.view.addSubview(myPlayerView)
        self.view.sendSubviewToBack(myPlayerView)
        
        // Use a local or remote URL
        let url =  NSURL.fileURLWithPath(filePath!) // See the note on NSURL above
        
        // Make a player
        let myPlayer = AVPlayer(URL: url)
        myPlayer.actionAtItemEnd = AVPlayerActionAtItemEnd.None
        myPlayer.play()
        
        // Make the AVPlayerLayer and add it to myPlayerView's layer
        let avLayer = AVPlayerLayer(player: myPlayer)
        avLayer.frame = myPlayerView.bounds
        avLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        myPlayerView.layer.addSublayer(avLayer)
        
        //Notification to play the video in infinite loop
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(ViewController.playerItemDidReachEnd(_:)),
                                                         name: AVPlayerItemDidPlayToEndTimeNotification,
                                                         object: myPlayer.currentItem)
    }
    //Function to handle notification
    func playerItemDidReachEnd(notification: NSNotification) {
        if let playerItem: AVPlayerItem = notification.object as? AVPlayerItem {
            playerItem.seekToTime(kCMTimeZero)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

