//
//  UIView+AVPlayer.swift
//  testBackgroundVideo
//
//  Created by Milan Mia on 5/20/16.
//  Copyright © 2016 AAPBD. All rights reserved.
//

import UIKit
import AVFoundation

extension UIView {
    public class func videoBackgroundWithName(name:String, type:String, view:UIView) -> UIView? {
        
        guard let filePath = NSBundle.mainBundle().pathForResource("\(name)", ofType: "\(type)") else {
            print("Video not found!")
            return nil
        }
        let url =  NSURL.fileURLWithPath(filePath)
        let myPlayerView = createViewWithVideo(url, view: view)
        return myPlayerView
    }
    public class func createViewWithVideo(videoUrl:NSURL, view:UIView) -> UIView{
        let myPlayerView = UIView(frame:view.bounds)
        myPlayerView.backgroundColor = UIColor.blackColor()
        
        let myPlayer = AVPlayer(URL: videoUrl)
        myPlayer.actionAtItemEnd = AVPlayerActionAtItemEnd.None
        myPlayer.play()
        
        // Make the AVPlayerLayer and add it to myPlayerView's layer
        let avLayer = AVPlayerLayer(player: myPlayer)
        avLayer.frame = myPlayerView.bounds
        avLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        myPlayerView.layer.addSublayer(avLayer)

        //Notification to play the video in infinite loop
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(UIView.playerItemDidReachEnd(_:)),
                                                         name: AVPlayerItemDidPlayToEndTimeNotification,
                                                         object: myPlayer.currentItem)
        return myPlayerView
    }
    //Function to handle notification
    public class func playerItemDidReachEnd(notification: NSNotification) {
        for _ in 1...100{}
        if let playerItem: AVPlayerItem = notification.object as? AVPlayerItem {
            playerItem.seekToTime(kCMTimeZero)
        }
    }
}
