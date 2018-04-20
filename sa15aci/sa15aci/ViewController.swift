//
//  ViewController.swift
//  sa15aci
//
//  Created by sa15ach on 20/04/2018.
//  Copyright © 2018 sa15ach. All rights reserved.
//

import UIKit


class ViewController: UIViewController{
    
    var dynamicAnimator: UIDynamicAnimator!
    var dynamiItemBehavior: UIDynamicItemBehavior!
    var collisionBehavior: UICollisionBehavior!
    
    @IBOutlet var roadView: UIImageView!
    
    
    @IBOutlet weak var mainCar: dragCar!
    
   // @IBOutlet weak var gameOver: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Animation of the road
        
        var imageArray: [UIImage]!
        
        imageArray = [UIImage(named: "road1.png")!,
                      UIImage(named: "road2.png")!,
                      UIImage(named: "road3.png")!,
                      UIImage(named: "road4.png")!,
                      UIImage(named: "road5.png")!,
                      UIImage(named: "road6.png")!,
                      UIImage(named: "road7.png")!,
                      UIImage(named: "road8.png")!,
                      UIImage(named: "road9.png")!,
                      UIImage(named: "road10.png")!,
                      UIImage(named: "road11.png")!,
                      UIImage(named: "road12.png")!,
                      UIImage(named: "road13.png")!,
                      UIImage(named: "road15.png")!,
                      UIImage(named: "road16.png")!,
                      UIImage(named: "road17.png")!,
                      UIImage(named: "road18.png")!,
                      UIImage(named: "road19.png")!,
                      UIImage(named: "road20.png")!]
        
        roadView.image = UIImage.animatedImage(with: imageArray, duration: 0.5)
        
        
        class dragCar: UIImageView {
            
            
            var startLocation: CGPoint?
            //define variable
            
            override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
                
                startLocation = touches.first?.location(in: self)
            }
            
            override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?){
                
                let dx = startLocation!.x - startLocation!.x
                let dy = startLocation!.y - startLocation!.y
                
                self.center = CGPoint(x: self.center.x+dx, y: self.center.y+dy)
                
                
            }
            
            //addition of car obstacle
            //Create amn array of new UIImageView from scratch
            var carView = UIImageView(image: nil)
            
            //Assign an image to the image view
            carView.image = UIImage(named: "car1.png")
            
            
            //Assign the size of the image view
            carView.frame = CGRect(x: 50, y: 0, width:30, height: 50)
            //view.frame.origin.x += 10
            
            
            //Add the image view to the main view
            self.view.addSubview(carView)
            
            //make car fall down the screen
            dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
            dynamiItemBehavior = UIDynamicItemBehavior(items: [carView])
            self.dynamiItemBehavior.addLinearVelocity (CGPoint(x: 0, y:300),for: carView)
            dynamicAnimator.addBehavior(dynamiItemBehavior)
            
            collisionBehavior = UICollisionBehavior(items: [carView,mainCar])
            //do not allow cars to leave the view
            collisionBehavior.translatesReferenceBoundsIntoBoundary = false
            dynamicAnimator.addBehavior(collisionBehavior)
            
            //        var carView1 = UIImageView(image: nil)
            
            //        carView1.image = UIImage(named: "car2.png")
            
            //       carView.frame = CGRect(x: 120, y: 0, width:30, height: 50)
            
            //        self.view.addSubview(carView1)
            
            //make car fall down the screen
            //        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
            //        dynamiItemBehavior = UIDynamicItemBehavior(items: [carView])
            //        self.dynamiItemBehavior.addLinearVelocity (CGPoint(x: 0, y:300),for: carView)
            //        dynamicAnimator.addBehavior(dynamiItemBehavior)
            
            //       collisionBehavior = UICollisionBehavior(items: [carView,mainCar,carView1])
            //do not allow cars to leave the view
            //       collisionBehavior.translatesReferenceBoundsIntoBoundary = false
            //       dynamicAnimator.addBehavior(collisionBehavior)
            
            //        var carView2 = UIImageView(image: nil)
            
            //            carView2.image = UIImage(named: "car2.png")
            
            //           carView.frame = CGRect(x: 150, y: 0, width:30, height: 50)
            
            //           self.view.addSubview(carView2)
            
            //make car fall down the screen
            //           dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
            //          dynamiItemBehavior = UIDynamicItemBehavior(items: [carView])
            //           self.dynamiItemBehavior.addLinearVelocity (CGPoint(x: 0, y:300),for: carView2)
            //          dynamicAnimator.addBehavior(dynamiItemBehavior)
            
            //          collisionBehavior = UICollisionBehavior(items: /[carView2,mainCar, carView1])
            //do not allow cars to leave the view
            //           collisionBehavior.translatesReferenceBoundsIntoBoundary = false
            //           dynamicAnimator.addBehavior(collisionBehavior)
            
            //Create a new image view and assign an image: game over subview
            var gameOverView = UIImageView(image: nil)
            
            //assign image
            gameOverView.image = UIImage(named: "game over page.jpg")
            
            //Make this image view fulfil the screen
            gameOverView.frame = UIScreen.main.bounds
            
            //Add the image view to the main view
            //self.view.addSubview(roadView)
            
            //bring view forward
            //self.view.bringSubview(toFront: roadView)
            let when = DispatchTime.now() + 16
            DispatchQueue.main.asyncAfter(deadline: when)
            {
            self.view.addSubview(gameOverView)
            
            }
            
            
            override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
            }
}
