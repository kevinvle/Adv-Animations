//
//  ViewController.swift
//  Animations
//
//  Created by Kevin Le on 2/25/17.
//  Copyright © 2017 Kevinvle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func FadeIn(_ sender: Any) {
        
        image.alpha = 0 // Essentially make the image invisible
        
        UIView.animate(withDuration: 1, animations: {
        
            self.image.alpha = 1 // Use self because it is inside a closure. To get out of closure and refer to the image as part of view controller, we use self. Closure is something happening not on the main thread. This function is something happening gradually in the background.
            
        })  // Set alpha to 1 but gradually
            // When a view is fully opaque, alpha = 1. When it's fully transparent, alpha = 0.
        
    }
    
    
    @IBAction func slideIn(_ sender: Any) {
        
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y) // CG = Core graphics; Defined x and y coordinate. x coodrinate - 500 pixels which moves it to the left, which takes it off the screen. Y doesn't change
        
        UIView.animate(withDuration: 2) {
            
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y) // Move it 500 to the right to get it back to where it was before. Y doesn't change. We are in a closure so use "self" to refer to something outside of the closure.
        }
        
    }
    
    @IBAction func grow(_ sender: Any) {
        
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        UIView.animate(withDuration: 1) {
        
            self.image.frame = CGRect(x: 0, y: 0, width: 200, height: 200) // Rect means rectangle
        }
        
    }
    
    
    
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var image: UIImageView!
    
    var counter = 1;
    
    var isAnimating = false
    
    var timer = Timer()
    
    func animate() {
        
        image.image = UIImage(named: "frame_\(counter)_delay-0.4s.gif")
        
        counter += 1
        
        if counter == 6 {
            
            counter = 0
        }
        
    }
    
    @IBAction func next(_ sender: Any) {
        
        if isAnimating {
            
            timer.invalidate()
            
            button.setTitle("Start Animation", for: []) // If timer stops and animation stops, change text to "start animation again". We use the empty array to set the title for the default state of the button
            
            isAnimating = false
            
        } else {
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            
        button.setTitle("Stop Animation", for: []) // Once Animation is run, we give the user a choice to stop the animation.
        
        isAnimating = true
        
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

