//
//  ViewController.swift
//  SampleViewSize
//
//  Created by Arthit Thongpan on 9/4/2558 BE.
//  Copyright (c) 2558 Arthit Thongpan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var redView:UIView!
    var greenView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ถ้า view ที่ติดมากับ UIviewController  จะมีขนาดเท่ากับหน้าจอในขณะนั้น
        self.view.backgroundColor = UIColor.yellowColor()
        println("self.view.frame.size =  \(self.view.frame.size)")
        
        createViewWithoutFrame()
        createViewWithFrame()
        createViewAndSetLayout()
    }
    
    func createViewWithoutFrame(){
        var blackView:UIView = UIView()
        blackView.backgroundColor = UIColor.blackColor()
        //blackView.frame.size = CGSize(width: 50, height: 50)  //ถ้าตอนสร้างไม่ได้กำหนดขนาด  หรือ ไม่ได้กำหนดขนาดเลย  ขนาดของ UIView จะเป็น 0,0
        blackView.frame.origin = CGPoint(x: 200, y: 0)
        self.view.addSubview(blackView)
        println("blackView.frame.size = \(blackView.frame.size)")
    }
    
    func createViewWithFrame(){
        let rect:CGRect = CGRect(x: 0, y: 0, width: 100, height: 50)
        redView = UIView(frame: rect)
        redView.backgroundColor = UIColor.redColor()
        redView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(redView)
        println("redView.frame.size = \(redView.frame.size)")
    }
    
    
    //ไม่ได้มีการกำหนดขนาด  แต่โดน Layout ดึงทั้งสี่ด้าน
    func createViewAndSetLayout()
    {
        greenView = UIView()
        greenView.backgroundColor = UIColor.greenColor()
        greenView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(greenView)
    
        let bindings = [
            "redView":redView,
            "greenView":greenView]
        
        //Set Layout
        let constraint_position_h:Array = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[greenView]-|",
            options: NSLayoutFormatOptions(0), metrics: nil, views: bindings)
        let constraint_position_v:Array = NSLayoutConstraint.constraintsWithVisualFormat("V:|-60-[greenView]-10-|",
            options: NSLayoutFormatOptions(0), metrics: nil, views: bindings)
        
        self.view.addConstraints(constraint_position_h)
        self.view.addConstraints(constraint_position_v)
        
        println("greenView.frame.size = \(greenView.frame.size)")

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("greenView.frame.size = \(greenView.frame.size)")
        
    }
   
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

