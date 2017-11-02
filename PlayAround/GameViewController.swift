//
//  GameViewController.swift
//  PlayAround
//
//  Created by Nick van der Boor on 31-10-17.
//  Copyright © 2017 Nick van der Boor. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     
        
        
        
/*
        if let view = self.view as! SKView? {

            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
        

                
                // Present the scene
                view.presentScene(scene)
            }
         
         
            
            
            print("\(UIDevice.current.modelName)" )
 
        }*/
        
        
        let newView = SKView()
        
            
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                
                
                
                // Present the scene
                newView.presentScene(scene)
            }
        
        
        self.view.backgroundColor = .red
        self.view.addSubview(newView)
        newView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            let guide = self.view.safeAreaLayoutGuide
            newView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
            newView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
            newView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
            newView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
            
        }

        newView.ignoresSiblingOrder = true
        
        newView.showsFPS = true
        newView.showsNodeCount = true
        
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
