//
//  GameScene.swift
//  PlayAround
//
//  Created by Nick van der Boor on 31-10-17.
//  Copyright © 2017 Nick van der Boor. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    var thePlayer = SKSpriteNode()
    var thePlayer2 = SKSpriteNode()
    var turnPlayer1 = Bool()
    var healthPlayer1View = UILabel()
    var healthPlayer2View = UILabel()
    var player1NameField = UILabel()
    var player2NameField = UILabel()
    
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0, y: 0)
        //set knight to start fight
        self.turnPlayer1 = true
        
        //create all assets on screen
        self.createTextFields()
        self.createButtons()
        self.loadCharacters()
        self.backgroundColor = .black
       

    }
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        //update health after every frame render
        if let aChar = self.thePlayer as? Knight{
            self.healthPlayer1View.text = "Health : \(aChar.health)"
        }
        if let aChar = self.thePlayer2 as? Goblin{
            self.healthPlayer2View.text = "Health : \(aChar.health)"
        }
        
      
    }
    func createTextFields(){
        self.healthPlayer1View = UILabel(frame: CGRect(x: 300, y: 50, width: 100, height: 50))
        self.healthPlayer1View.textColor = .white
    
        
        self.healthPlayer2View = UILabel(frame: CGRect(x: 30, y: 50, width: 100, height: 50))
        self.healthPlayer2View.textColor = .white
  
        
        
        self.player1NameField = UILabel(frame: CGRect(x: 300, y: 10, width: 100, height: 50))
        self.player1NameField.textColor = .red
        self.player1NameField.text = "Knight"
        self.player1NameField.font = UIFont(name: self.player1NameField.font!.fontName, size: 30)
        self.view?.addSubview(player1NameField)
        
        self.player2NameField = UILabel(frame: CGRect(x: 30, y: 10, width: 100, height: 50))
        self.player2NameField.textColor = .white
        self.player2NameField.text = "Goblin"
        self.player2NameField.font = UIFont(name: self.player1NameField.font!.fontName, size: 30)
        self.view?.addSubview(player2NameField)
         }
    
    func createButtons(){
        
        let restartButton:UIButton = UIButton(frame: CGRect(x: 600, y: 20, width: 100, height: 50))
        restartButton.backgroundColor = .black
        restartButton.setTitle("Restart", for: .normal)
        restartButton.addTarget(self, action: #selector(self.restartAction), for: .touchUpInside)
        self.view?.addSubview(restartButton)

        let attackButton:UIButton = UIButton(frame: CGRect(x: 600, y: 200, width: 150, height: 150))
        attackButton.backgroundColor = .black
        attackButton.setTitle("Attack", for: .normal)
        attackButton.addTarget(self, action: #selector(self.attackAction), for: .touchUpInside)
        self.view?.addSubview(attackButton)

    }

    @objc func restartAction(sender: UIButton!) {
        self.removeAllChildren()
        self.loadCharacters()
    }
    
    func loadCharacters(){
        //set knight
        let aKnight = Knight()
        aKnight.beginAnimationIdle()
        self.thePlayer = aKnight
        thePlayer.physicsBody?.isDynamic = true
        thePlayer.position = CGPoint(x: self.frame.width * 0.40, y: self.frame.height * 0.5 )
        addChild(thePlayer)
        self.healthPlayer1View.text = "Health : \(aKnight.health)"
        self.view?.addSubview(self.healthPlayer1View)
        
        //set Goblin
        let aGoblin = Goblin()
        aGoblin.beginAnimationIdle()
        self.thePlayer2 = aGoblin
        thePlayer2.position = CGPoint(x: self.frame.width * 0.2, y: self.frame.height * 0.5 )
        thePlayer2.xScale = thePlayer2.xScale * -1
        addChild(thePlayer2)
        self.healthPlayer2View.text = "Health : \(aGoblin.health)"
        self.view?.addSubview(self.healthPlayer2View)
    }
   
    @objc func attackAction(sender: UIButton!) {
        if(self.turnPlayer1 == true){
            if let aChar = self.thePlayer as? Knight{
                if let aEnemy = self.thePlayer2 as? Goblin{
                    aChar.beginAnimationAttack(damage: aChar.attackPower, enemy: aEnemy)
                }
            }
        } else {
            if let aChar = self.thePlayer2 as? Goblin{
                if let aEnemy = self.thePlayer as? Knight{
                    aChar.beginAnimationAttack(damage: aChar.attackPower, enemy: aEnemy)
                }
            }
        }
         setTurn()
    }
    
   
    func setTurn(){
        if(self.turnPlayer1 == true){
            self.player2NameField.textColor = .red
            self.player1NameField.textColor = .black
            self.turnPlayer1 = false
        } else {
            self.player2NameField.textColor = .black
            self.player1NameField.textColor = .red
            self.turnPlayer1 = true
        }
    }
 /*
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    */

}
