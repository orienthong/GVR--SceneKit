//
//  ViewController.swift
//  SceneKitVRDemo
//
//  Created by Sujan Vaidya on 8/9/16.
//  Copyright © 2016 Sujan Vaidya. All rights reserved.
//

import UIKit
import SceneKit // for 3D view
import CoreMotion // for tracking device motion
import ModelIO


class ViewController: UIViewController {
    
    @IBOutlet weak var scnView: SCNView!
    var sphereNode: SCNNode!
    var scnScene: SCNScene! // a 3D scene
    
    // camera and node to attach the camera to for left and right view
    var scnCameraNode = SCNNode()
    
    // motion manager instance
    let motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupScene()
        sphereNode = scnScene.rootNode.childNode(withName: "sphere", recursively: true)!
        //setupCamera()
        //setupMotion()
        
    }
    
    //assign scene to each view
    func setupScene() {
        scnScene = SCNScene(named: "vrScene.scn")!
        scnView.scene = scnScene
    }
    
    
    
    // setup camera for each view
    func setupCamera() {
        scnCameraNode = scnScene.rootNode.childNode(withName: "camera", recursively: true)!
        scnCameraNode.position = SCNVector3(x: 0.5, y: 0, z: 5)
        scnView.pointOfView = scnCameraNode
        
//        scnCameraNode.camera?.wantsHDR = true
        let camera = scnCameraNode.camera!
//        camera.exposureOffset = CGFloat(0.2)
        camera.motionBlurIntensity = 0.3
        scnView.allowsCameraControl = true
    }
    
    
    func setupMotion() {
        // time for motion update
        motionManager.deviceMotionUpdateInterval = 1.0 / 60.0
        if motionManager.isDeviceMotionAvailable {
            motionManager.startDeviceMotionUpdates(to: OperationQueue.main, withHandler: { (devMotion, error) -> Void in
                //change the left camera node euler angle in x, y, z axis
                self.scnCameraNode.eulerAngles = SCNVector3(
                    -Float((self.motionManager.deviceMotion?.attitude.roll)!) - Float(M_PI_2),
                    Float((self.motionManager.deviceMotion?.attitude.yaw)!),
                    -Float((self.motionManager.deviceMotion?.attitude.pitch)!)
                )
            })
        }
    }
    
    var touchX: CGFloat = 0
    var sphereX: Float = 0
    var touchY: CGFloat = 0
    var sphereY: Float = 0
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        for touch in touches {
            let location = touch.location(in: scnView)
            touchX = location.x
            sphereX = sphereNode.position.x
        }
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let location = touch.location(in: scnView)
            
            sphereNode.position.x = sphereX + (Float(location.x - touchX) * 0.1)
            
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
