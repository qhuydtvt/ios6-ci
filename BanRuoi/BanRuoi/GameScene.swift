import SpriteKit

class GameScene : SKScene, SKPhysicsContactDelegate {
    let playerController=PlayerController.instance
    var flyController : FlyController!
    
    override func didMove(to view: SKView) {
        configPlayer()
        addFly()
        configPhysics()
    }
    
    func configPhysics() {
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = .zero
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let nodeA = contact.bodyA.node as? View, let nodeB = contact.bodyB.node as? View else {
            return
        }
        nodeA.handleContact?(nodeB)
        nodeB.handleContact?(nodeA)
    }
    
    var lastTimeUpdate :TimeInterval = -1
    
    
    override func update(_ currentTime: TimeInterval) {
        print(currentTime)
        if lastTimeUpdate == -1 {
            // update never ran before
            lastTimeUpdate = currentTime
            return
        }
        if currentTime - lastTimeUpdate > 2.0{
            lastTimeUpdate = currentTime
            if !flyController.attacking {
                flyController.attack(destination: playerController.view.position.add(x: -20, y: 0))
            }
            
        }
    
    }
    
    func addFly(){
        self.flyController = FlyController()
        flyController.config(position: CGPoint(x: self.size.width/2, y: self.size.height - 100), parent: self)
    }
    
    func configPlayer(){
        playerController.config(position: CGPoint(x: self.size.width/2, y: playerController.view.size.height/2), parent: self)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch=touches.first{
            let position=touch.location(in: self)
            let previousPosition=touch.previousLocation(in: self)
            let vector=CGVector(dx: position.x-previousPosition.x, dy: 0)
            playerController.moveVector(vector:vector)
        }
    }
}
