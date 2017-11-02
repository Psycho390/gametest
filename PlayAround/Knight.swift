//
//  Knight.swift
//  PlayAround
//
//  Created by Nick van der Boor on 31-10-17.
//  Copyright © 2017 Nick van der Boor. All rights reserved.
//

import SpriteKit


class Knight: SKSpriteNode{
    
    var health = 100
    var attackPower = 45
    
    init() {
       let texture = SKTexture(imageNamed: "KnightIdle0")
        super.init(texture: texture, color: .clear, size: texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func beginAnimationIdle() {
        self.isPaused = false
        let textureAtlas = SKTextureAtlas(named: "KnightIdle")
        let frames = [
            "KnightIdle0",
            "KnightIdle1",
            "KnightIdle2",
            "KnightIdle3",
            "KnightIdle4",
            "KnightIdle5",
            "KnightIdle6",
            "KnightIdle7"
            ].map { textureAtlas.textureNamed($0) }
        let animate = SKAction.animate(with: frames, timePerFrame: 0.1)
        let forever = SKAction.repeatForever(animate)
        self.run(forever)
    }
    
    func beginAnimationDie() {
        let textureAtlas = SKTextureAtlas(named: "KnightDie")
        let frames = [
            "KnightDie0",
            "KnightDie1",
            "KnightDie2",
            "KnightDie3",
            "KnightDie4",
            "KnightDie5",
            "KnightDie6",
            "KnightDie7"
            ].map { textureAtlas.textureNamed($0) }
        let animate = SKAction.animate(with: frames, timePerFrame: 0.1)
        let animateOnce = SKAction.repeat(animate, count: 1)
        self.run(animateOnce, completion: {self.isPaused = true
        })

    }
    func beginAnimationAttack(damage damageGot:Int, enemy anEnemy:Goblin) {
        self.isPaused = false
        let textureAtlas = SKTextureAtlas(named: "KnightAttack")
        let frames = [
            "KnightAttack0",
            "KnightAttack1",
            "KnightAttack2",
            "KnightAttack3",
            "KnightAttack4",
            "KnightAttack5",
            "KnightAttack6",
            "KnightAttack7"
            ].map { textureAtlas.textureNamed($0) }
        let animate = SKAction.animate(with: frames, timePerFrame: 0.1)
        let forever = SKAction.repeat(animate, count: 1)
        anEnemy.getDamage(damage: damageGot)
        self.run(forever)
    }
    func beginAnimationHurt() {
        self.isPaused = false
        let textureAtlas = SKTextureAtlas(named: "KnightHurt")
        let frames = [
            "KnightHurt0",
            "KnightHurt1",
            "KnightHurt2",
            "KnightHurt3",
            "KnightHurt4",
            "KnightHurt5",
            "KnightHurt6",
            "KnightHurt7"
            ].map { textureAtlas.textureNamed($0) }
        let animate = SKAction.animate(with: frames, timePerFrame: 0.1)
        let animateOnce = SKAction.repeat(animate, count: 1)
        self.run(animateOnce, completion: {self.beginAnimationIdle()
        })
    }
    func beginAnimationRun() {
        self.isPaused = false
        let textureAtlas = SKTextureAtlas(named: "KnightRun")
        let frames = [
            "KnightRun0",
            "KnightRun1",
            "KnightRun2",
            "KnightRun3",
            "KnightRun4",
            "KnightRun5",
            "KnightRun6"
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
