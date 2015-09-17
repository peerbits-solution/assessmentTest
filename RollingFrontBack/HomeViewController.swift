//
//  FirstViewController.swift
//  RollingFrontBack
//
//  Created by peerbits_11 on 17/09/15.
//  Copyright (c) 2015 peerbits. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit
import AVFoundation

class HomeViewController: UIViewController {

    @IBOutlet weak var videoView: UIView!
    var moviePlayer : MPMoviePlayerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        playVideo()
    }
    
    // PLAY VIDEO FROM LOCAL RESOURCE
    private func playVideo() {
        if let path = NSBundle.mainBundle().pathForResource("video1", ofType:"mp4"),
            url = NSURL(fileURLWithPath: path),
            moviePlayer = MPMoviePlayerController(contentURL: url) {
                self.moviePlayer = moviePlayer
                moviePlayer.view.frame = self.videoView.bounds
                moviePlayer.view.sizeToFit()
                moviePlayer.prepareToPlay()
                moviePlayer.scalingMode = MPMovieScalingMode.AspectFit
                self.videoView.addSubview(moviePlayer.view)

        } else {
            debugPrintln("Ooops, something wrong when playing video.")
        }
    }
}

