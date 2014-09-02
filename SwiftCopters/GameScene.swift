//
//  GameScene.swift
//  SwiftCopters
//
//  Created by MARIO EGUILUZ ALEBICTO on 31/08/14.
//  Copyright (c) 2014 MARIO EGUILUZ ALEBICTO. All rights reserved.
//

import SpriteKit

//1
class GameScene: SKScene, SKPhysicsContactDelegate {
    
    //2
    var viewController:GameViewController?
    
    //3
    //Game Variables
    var colorBackground:SKColor! = SKColor(red: 20/255, green: 129/255, blue: 197/255, alpha: 1.0)
    var start:Bool = false
    let categoryCopter:UInt32   = 0x1 << 0
    let categoryEnemy:UInt32    = 0x1 << 1 
    let categoryScreen:UInt32   = 0x1 << 2
    let linearDamping:CGFloat = 0.65
    let angularDamping:CGFloat = 1.0
    var gravityX:CGFloat = 6
    let impulseY:CGFloat = 4.0
    let impulseX:CGFloat = 10.0
    
    //4
    //Node tree
    //SKSCENE
        let nodeWorld = SKNode()
            var nodeCopter = SKNode()
                var spriteCopter:SKSpriteNode!
    
    //5
    //Inits
    override func didMoveToView(view: SKView) {
        self.startWorld()
        self.initPhysics()
        self.startGround()
        self.startCopter()
    }
    
    //6
    func initPhysics() {
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVectorMake(gravityX, 0.0)

        let borderBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        nodeWorld.physicsBody = borderBody
        nodeWorld.physicsBody.categoryBitMask = categoryScreen
    }
    
    //7
    func startWorld() {
        self.backgroundColor = colorBackground
        self.anchorPoint = CGPointMake(0.5,0.5)
        self.addChild(nodeWorld)
    }
    
    //8
    func startGround() {
        let spriteGround = SKSpriteNode(imageNamed: "footer")
        spriteGround.zPosition = 1
        spriteGround.size = CGSizeMake(spriteGround.size.width/2, spriteGround.size.height/2)
        spriteGround.position = CGPointMake(0, -27)
        nodeWorld.addChild(spriteGround)
    }
    
    //9
    //Create copter
    func startCopter() {
        nodeCopter.position = CGPointMake(0,0)
        nodeCopter.zPosition = 10

        spriteCopter = SKSpriteNode(imageNamed: "booCopter1")
        spriteCopter.size = CGSizeMake(spriteCopter.size.width/3, spriteCopter.size.height/3)
        spriteCopter.position = CGPointMake(0,0)
        
        nodeCopter.addChild(spriteCopter)
        nodeWorld.addChild(nodeCopter)
        
        nodeCopter.physicsBody = SKPhysicsBody(circleOfRadius: 0.9*spriteCopter.frame.size.width/2)
        nodeCopter.physicsBody.linearDamping = linearDamping
        nodeCopter.physicsBody.angularDamping = angularDamping
        nodeCopter.physicsBody.allowsRotation = true
        nodeCopter.physicsBody.affectedByGravity = false
        nodeCopter.physicsBody.categoryBitMask = categoryCopter;
        nodeCopter.physicsBody.contactTestBitMask = categoryScreen | categoryEnemy;
    }

    //Handle touches
/*
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        if !start {
            nodeCopter.physicsBody.affectedByGravity = true
            spriteCopter.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures([SKTexture(imageNamed:"booCopter1"),SKTexture(imageNamed:"booCopter2"),SKTexture(imageNamed:"booCopter3"),SKTexture(imageNamed:"booCopter4")], timePerFrame: 0.075)))
            nodeCopter.physicsBody.dynamic = true
        }
        start = true;
        
        for touch: AnyObject in touches {
            if gravityX > 0 {
                gravityX = -4
                self.physicsWorld.gravity = CGVectorMake(gravityX, 0.0)
                self.nodeCopter.physicsBody.applyImpulse(CGVectorMake(impulseX, impulseY))
                nodeCopter.runAction(SKAction.rotateToAngle(+3.14/10, duration: 0.3))//rigth
            }
            else {
                gravityX = 4
                self.physicsWorld.gravity = CGVectorMake(gravityX, 0.0)
                self.nodeCopter.physicsBody.applyImpulse(CGVectorMake(-impulseX, impulseY))
                nodeCopter.runAction(SKAction.rotateToAngle(-3.14/10, duration: 0.3))//left
            }
        }
        
        //We have to change the height of the physics bode to make it larger when the copter goes up
        let borderBody = SKPhysicsBody(edgeLoopFromRect: CGRectMake(-self.frame.size.width/2, -self.frame.size.height/2, self.frame.size.width, self.frame.size.height+nodeCopter.position.y))
        nodeWorld.physicsBody = borderBody
        nodeWorld.physicsBody.categoryBitMask = categoryScreen
    }

    
    override func didSimulatePhysics() {
        let cameraPositionInScene = nodeCopter.scene.convertPoint(nodeCopter.position, fromNode: nodeCopter.parent)
        nodeCopter.parent.position = CGPointMake(nodeCopter.parent.position.x, nodeCopter.parent.position.y - cameraPositionInScene.y-self.frame.size.height/3);
    }
*/
    //10
    func didBeginContact(contact: SKPhysicsContact!) {
        
    }
}

























