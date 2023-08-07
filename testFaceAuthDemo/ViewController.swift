//
//  ViewController.swift
//  testFaceAuthDemo
//
//  Created by Gabriel Caldeira Martins on 16/06/23.
//

import UIKit
import FaceAuthenticator
import FaceLiveness

class ViewController: UIViewController {

    var faceAuth: FaceAuthSDK!
    
    var faceLiveness: FaceLivenessSDK!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnClick(_ sender: Any) {
        faceAuth = FaceAuthSDK.Builder()
            .setCredentials(token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI2Mjg2YmU5Mzg2NDJmZDAwMDk4NWE1OWUiLCJuYW1lIjoiSm9obiBEb2UiLCJpYXQiOjE1MTYyMzkwMjJ9.muHfkGn9ToDyt9cT_z6vHPNLH0GfDNJJ2WtnnsrqFpU", personId: "12597217604")
            .setStage(stage: .DEV)
            .setFilter(filter: .natural)
            .build()
        
        faceAuth?.delegate = self
        
        faceAuth?.startFaceAuthSDK(viewController: self)
    }
    
    @IBAction func btnLivenessClick(_ sender: Any) {
        faceLiveness = FaceLivenessSDK.Build()
            .setCredentials(mobileToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI2Mjg2YmU5Mzg2NDJmZDAwMDk4NWE1OWUiLCJuYW1lIjoiSm9obiBEb2UiLCJpYXQiOjE1MTYyMzkwMjJ9.muHfkGn9ToDyt9cT_z6vHPNLH0GfDNJJ2WtnnsrqFpU", personId: "12597217604")
            .setStage(stage: .DEV)
            .setFilter(filter: .natural)
            .build()
        faceLiveness?.delegate = self
        
        faceLiveness?.startSDK(viewController: self)
    }
    
    
    
}

extension ViewController: FaceAuthSDKDelegate {
    func didFinishFaceAuth(with faceAuthenticatorResult: FaceAuthenticatorResult) {
        print(faceAuthenticatorResult)
    }
}

extension ViewController: FaceLivenessDelegate {
    func didFinishLiveness(with faceLivenesResult: FaceLivenessResult) {
        print(faceLivenesResult)
    }
    
    func startLoadingScreen() {
        print("StartLoadScreen")
    }
}
