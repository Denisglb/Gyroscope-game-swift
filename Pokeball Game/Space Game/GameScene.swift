//
//  GameScene.swift
//  Space Game
//
//  Created by Rolando Sorbelli on 25/09/2017.
//  Copyright © 2017 Rolando Sorbelli. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var starfield: SKEmitterNode!
    var pokeball: SKSpriteNode!
    var level: SKLabelNode!
//    var isIdleTimerDisabled: true
    
    let motionManager = CMMotionManager()
    var xAcceleration: CGFloat = 0
    var yAcceleration: CGFloat = 0
    
    override func didMove(to view: SKView) {
        
        starfield = SKEmitterNode(fileNamed: "Starfield")
        starfield.position = CGPoint(x: 375, y:1472)
        starfield.advanceSimulationTime(10)
        self.addChild(starfield)
        
        starfield.zPosition = -1
        
        pokeball = SKSpriteNode(imageNamed: "shuttle")
        pokeball.position = CGPoint(x: self.frame.size.width / 2, y: pokeball.size.height/2 + 20)
        self.addChild(pokeball)
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsWorld.contactDelegate = self
        
        level = SKLabelNode(text: "Level: Pokeball")
        level.position = CGPoint(x:200, y: self.frame.size.height - 60)
        level.fontName = "AmericanTypewriter-Bold"
        level.fontSize = 36
        level.fontColor = UIColor.white
        
        self.addChild(level)
        
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (data:CMAccelerometerData?, error:Error?) in
            if let accelerometerData = data {
                let acceleration = accelerometerData.acceleration
                self.xAcceleration = CGFloat(acceleration.x) * 0.75 + self.xAcceleration * 0.25
                self.yAcceleration = CGFloat(acceleration.y) * 0.75 + self.yAcceleration * 0.25
            }
        }
        
    }
    
    override func didSimulatePhysics() {
        pokeball.position.x += xAcceleration * 50
        pokeball.position.y += yAcceleration * 50
        
        if pokeball.position.x < -20 {
            pokeball.position = CGPoint(x: pokeball.position.x, y: pokeball.position.y)
        }else if pokeball.position.x > self.size.width + 20 {
            pokeball.position = CGPoint(x: pokeball.position.x, y: pokeball.position.y)
        }
    
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
  
}
