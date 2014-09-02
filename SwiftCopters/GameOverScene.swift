//
//  GameOverScene.swift
//  SwiftCopters
//
//  Created by MARIO EGUILUZ ALEBICTO on 01/09/14.
//  Copyright (c) 2014 MARIO EGUILUZ ALEBICTO. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {
    
    var viewController:GameViewController?
    
    //Init
    override func didMoveToView(view: SKView) {
        
        let nodeLabel = SKLabelNode(fontNamed: "Lobster 1.4")
        nodeLabel.text = "game over"
        nodeLabel.fontSize = 50
        nodeLabel.fontColor = SKColor.whiteColor()
        nodeLabel.position = CGPointMake(self.frame.width/2, self.frame.height/3*2)
        nodeLabel.alpha = 0.0
        nodeLabel.runAction(SKAction.fadeAlphaTo(1.0, duration: 1.0))
        self.addChild(nodeLabel)
        
        let spriteFace = SKSpriteNode(imageNamed: "booGameOver")
        spriteFace.size = CGSizeMake(spriteFace.size.width/2, spriteFace.size.height/2)
        spriteFace.position = CGPointMake(self.frame.width/2, -spriteFace.size.height/2)
        spriteFace.runAction(SKAction.moveToY(spriteFace.size.height/2, duration: 0.7))
        self.addChild(spriteFace)
        
        self.backgroundColor = SKColor(red: 20/255, green: 129/255, blue: 197/255, alpha: 1.0)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        viewController?.presentGameScene()
    }
}