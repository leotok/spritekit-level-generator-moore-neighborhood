//
//  GameScene.swift
//  MooreContourTracing
//
//  Created by Leonardo Edelman Wajnsztok on 22/10/15.
//  Copyright (c) 2015 LeonardoWajnsztok. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
    
        backgroundColor = UIColor.whiteColor()
        
        physicsWorld.gravity = CGVectorMake(0, -9.8)
        physicsWorld.contactDelegate = self

        let lvlGen = MooreLevelGenerator();
        lvlGen.loadLevel(self)
        
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
        let ball = SKSpriteNode(texture: nil, color: UIColor.blueColor(), size: CGSizeMake(40, 40))
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        ball.position = CGPointMake(400, 450)
        ball.physicsBody?.categoryBitMask = 1
        ball.physicsBody?.contactTestBitMask = 1
        
        addChild(ball)
    }

    
    func didBeginContact(contact: SKPhysicsContact) {
        
        print("contact")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        physicsWorld.gravity = CGVector(dx: 0, dy: -2)

    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
