//
//  GameScene.swift
//  IOSSpriteKitParallaxScrollingTutorial
//
//  Created by dylan.k on 2020/07/13.
//  Copyright © 2020 dylan.k. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        createBackground()
    }
    
    func createBackground() {
        for i in 0...2 {
            let sky = SKSpriteNode(imageNamed: "clouds")
            sky.name = "clouds"
            sky.size = CGSize(width: (self.scene?.size.width)!, height: (self.scene?.size.height)!)
            sky.position = CGPoint(x: CGFloat(i) * sky.size.width , y: (self.frame.size.height / 2))

            self.addChild(sky)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        scrollBackground()
    }
    
    func scrollBackground(){
        self.enumerateChildNodes(withName: "clouds", using: ({
            (node, error) in
            // 1
            node.position.x -= 4
            print("node position x = \(node.position.x)")
            // 2
            if node.position.x < -(self.scene?.size.width)! {
                node.position.x += (self.scene?.size.width)! * 3
            }
         }))
    }
}
