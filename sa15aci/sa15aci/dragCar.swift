//
//  dragCar.swift
//  sa15aci
//
//  Created by sa15ach on 20/04/2018.
//  Copyright © 2018 sa15ach. All rights reserved.
//

import UIKit

class dragCar: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

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
}
