//
//  Goblin.swift
//  PlayAround
//
//  Created by Nick van der Boor on 31-10-17.
//  Copyright © 2017 Nick van der Boor. All rights reserved.
//

import SpriteKit


class Goblin: SKSpriteNode{
    
    var health = 100
    var attackPower = 10
    
    init() {
        let texture = SKTexture(imageNamed: "GoblinIdle0")
        super.init(texture: texture, color: .clear, size: texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func beginAnimationIdle() {
        self.isPaused = false
        let textureAtlas = SKTextureAtlas(named: "GoblinIdle")
        let frames = [
            "GoblinIdle0",
            "GoblinIdle1",
            "GoblinIdle2",
            "GoblinIdle3",
            "GoblinIdle4",
            "GoblinIdle5",
            "GoblinIdle6",
            "GoblinIdle7"
            ].map { textureAtlas.textureNamed($0) }
        let animate = SKAction.animate(with: frames, timePerFrame: 0.1)
        let forever = SKAction.repeatForever(animate)
        self.run(forever)
    }
    
    func beginAnimationDie() {
        let textureAtlas = SKTextureAtlas(named: "GoblinDie")
        let frames = [
            "GoblinDie0",
            "GoblinDie1",
            "GoblinDie2",
            "GoblinDie3",
            "GoblinDie4",
            "GoblinDie5",
            "GoblinDie6",
            "GoblinDie7"
            ].map { textureAtlas.textureNamed($0) }
        let animate = SKAction.animate(with: frames, timePerFrame: 0.1)
        let animateOnce = SKAction.repeat(animate, count: 1)
        self.run(animateOnce, completion: {self.isPaused = true
        })
        
    }
    func beginAnimationAttack(damage damageGot:Int, enemy anEnemy:Knight ) {
        self.isPaused = false
        let textureAtlas = SKTextureAtlas(named: "GoblinAttack")
        let frames = [
            "GoblinAttack0",
            "GoblinAttack1",
            "GoblinAttack2",
            "GoblinAttack3",
            "GoblinAttack4",
            "GoblinAttack5",
            "GoblinAttack6",
            "GoblinAttack7"
            ].map { textureAtlas.textureNamed($0) }
        let animate = SKAction.animate(with: frames, timePerFrame: 0.1)
        let forever = SKAction.repeat(animate, count: 1)
        anEnemy.getDamage(damage: damageGot)
        self.run(forever)
    }
    func beginAnimationHurt() {
        self.isPaused = false
        let textureAtlas = SKTextureAtlas(named: "GoblinHurt")
        let frames = [
            "GoblinHurt0",
            "GoblinHurt1",
            "GoblinHurt2",
            "GoblinHurt3",
            "GoblinHurt4",
            "GoblinHurt5",
            "GoblinHurt6",
            "GoblinHurt7"
            ].map { textureAtlas.textureNamed($0) }
        let animate = SKAction.animate(with: frames, timePerFrame: 0.1)
        let animateOnce = SKAction.repeat(animate, count: 1)
        self.run(animateOnce, completion: {self.beginAnimationIdle()
        })
    }
    func beginAnimationRun() {
        self.isPaused = false
        let textureAtlas = SKTextureAtlas(named: "GoblinRun")
        let frames = [
            "GoblinRun0",
            "GoblinRun1",
            "GoblinRun2",
            "GoblinRun3",
            "GoblinRun4",
            "GoblinRun5",
            "GoblinRun6",
            "GoblinRun7"
            ].map { textureAtlas.textureNamed($0) }
        let animate = SKAction.animate(with: frames, timePerFrame: 0.1)
        let forever = SKAction.repeatForever(animate)
        self.run(forever)
    }
    func getDamage(damage damageGot:Int){
        
        self.health = self.health - damageGot
        if (self.health > 0 ){
            self.beginAnimationHurt()
        } else if (self.health <= 0){
            self.health = 0
            self.beginAnimationDie()
        }
    }
    
}
