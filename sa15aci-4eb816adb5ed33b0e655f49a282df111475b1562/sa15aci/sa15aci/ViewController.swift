//
//  ViewController.swift
//  sa15aci
//
//  Created by sa15aci on 19/04/2018.
//  Copyright © 2018 sa15aci. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dynamicAnimator: UIDynamicAnimator!
    var dynamicItemBehavior: UIDynamicItemBehavior!
    var collisionBehavior: UICollisionBehavior!
    
    @IBOutlet var roadView: UIImageView!
    
    @IBOutlet weak var mainCar: dragCar!

    @IBOutlet weak var gameOver: UIImageView!


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
        
        //drag class. cocoa touch
        class dragCar: UIImageView {
            
            
            var startLocation: CGPoint?
            //define variable
            
            override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
                
                startLocation = touches.first?.location(in: self)
                
            }
            
            override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?){
                
                let currentLocation = touches.first?.location(in: self)
                let dx = currentLocation!.x - startLocation!.x
                let dy = currentLocation!.y - startLocation!.y
                
                self.center = CGPoint(x: self.center.x+dx, y: self.center.y+dy)
                //
                
            }
        }
        
        self.view.bringSubview(toFront: mainCar)

        //addition of a car obstacle
        //Create a new UIImageView from scratch
        var carView = UIImageView(image: nil)
        
        //Assign an image to the image view
        carView.image = UIImage(named: "car1.png")
        
        //Assign the size and position of the image view
        carView.frame = CGRect(x:100, y: 0, width: 30, height: 50)
        
        //Add the image view to the main view
        self.view.addSubview(carView)
        
        //make car fall down the screen
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        dynamicItemBehavior = UIDynamicItemBehavior(items: [carView])
        self.dynamicItemBehavior.addLinearVelocity (CGPoint(x: 0, y:300), for: carView)
        dynamicAnimator.addBehavior(dynamicItemBehavior)
        collisionBehavior = UICollisionBehavior(items: [carView, mainCar])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = false
        dynamicAnimator.addBehavior(collisionBehavior)
        
        
        
        //let when = DispatchTime.now() + 20
        //DispatchQueue.main.asyncAfter(deadline: when){
        //Remove carView from the main view
        //carView.removeFromSuperview()        }
        

        //Create a new image view and assign an image: game over subview
        var gameOverView = UIImageView(image: UIImage(named: "game over page.jpg"))
        
        //Make this image view fulfil the screen
        gameOverView.frame = UIScreen.main.bounds
        
        //game timer: 18 seconds
        let when = DispatchTime.now() + 18
        DispatchQueue.main.asyncAfter(deadline: when){
            self.view.addSubview(gameOverView)
        }
        //Add the image view to the main view
        //self.view.addSubview(roadView)
    }
    
    
        //bring view forward
//        self.view.bringSubview(toFront: roadView)

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}
}
