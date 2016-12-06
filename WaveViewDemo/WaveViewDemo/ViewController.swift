//
//  ViewController.swift
//  WaveViewDemo
//
//  Created by 劉光軍 on 2016/12/6.
//  Copyright © 2016年 海涛旅游. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate var waterView: LGJWaveView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Init Avatar OverView
        let avatarFrame = CGRect(x: 0, y: 0, width: 60, height: 60)
        let avatarView = UIImageView(frame: avatarFrame)
        avatarView.layer.cornerRadius = avatarView.bounds.height/2
        avatarView.layer.masksToBounds = true
        avatarView.layer.borderColor  = UIColor.white.cgColor
        avatarView.layer.borderWidth = 3
        avatarView.layer.contents = UIImage(named: "yourtion")?.cgImage
        
        let frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 200)
        waterView = LGJWaveView(frame: frame, color: .white)
//        waterView?.waveCurvature = 2
//        waterView?.waveSpeed = 1
        waterView!.addOverView(oView: avatarView)
        waterView!.backgroundColor = .orange
        
        // Add WaveView
        self.view.addSubview(waterView!)
        
        // Start wave
        //        waterView!.start()
        
        let startBtn = UIButton(type: .custom)
        startBtn.setTitle("开始", for: .normal)
        startBtn.setTitleColor(.red, for: .normal)
        startBtn.frame = CGRect(x: 30, y: 400, width: 50, height: 40)
        startBtn.addTarget(self, action: #selector(startAnimate), for: .touchUpInside)
        self.view.addSubview(startBtn)
        
        
        let stopBtn = UIButton(type: .custom)
        stopBtn.setTitle("结束", for: .normal)
        stopBtn.setTitleColor(.red, for: .normal)
        stopBtn.frame = CGRect(x: 150, y: 400, width: 50, height: 40)
        stopBtn.addTarget(self, action: #selector(stopAnimate), for: .touchUpInside)
        self.view.addSubview(stopBtn)
        
    }
    
    func startAnimate() -> Void {
        waterView!.startWave()
    }
    func stopAnimate() -> Void {
        waterView?.stopWave()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

