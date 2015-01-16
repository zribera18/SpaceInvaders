//
//  GameViewController.swift
//  SKInvaders
//
//  Created by Riccardo D'Antoni on 15/07/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Configure the view.
    let skView = self.view as SKView
    skView.showsFPS = true
    skView.showsNodeCount = true
    
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = true
    
    // Create and configure the scene.
    let scene = GameScene(size: skView.frame.size)
    skView.presentScene(scene)
    
    // Pause the view (and thus the game) when the app is interrupted or backgrounded
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleApplicationWillResignActive:", name: UIApplicationWillResignActiveNotification, object: nil)
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleApplicationDidBecomeActive:", name: UIApplicationDidBecomeActiveNotification, object: nil)
  }
  
  override func shouldAutorotate() -> Bool {
    return true
  }
  
  override func supportedInterfaceOrientations() -> Int {
    
    return Int(UIInterfaceOrientationMask.Portrait.rawValue)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Release any cached data, images, etc that aren't in use.
  }
  
  
  func handleApplicationWillResignActive (note: NSNotification) {
    
    let skView = self.view as SKView
    skView.paused = true
  }
  
  func handleApplicationDidBecomeActive (note: NSNotification) {
    
    let skView = self.view as SKView
    skView.paused = false
  }
  
}
