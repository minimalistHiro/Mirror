//
//  SimpleVideoCaptureInteractor.swift
//  Mirror
//
//  Created by 金子広樹 on 2023/06/24.
//

//import Foundation
//import AVKit
import AVFoundation
import UIKit

final class SimpleVideoCaptureInteractor: NSObject, ObservableObject {
    private let captureSession = AVCaptureSession()
    @Published var previewLayer: AVCaptureVideoPreviewLayer?
    private var captureDevice: AVCaptureDevice?
    
    func setupAVCaptureSession() {
        captureSession.sessionPreset = .photo
        if let availableDevice = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera],
                                                                  mediaType: .video,
                                                                  position: .front).devices.first {
            captureDevice = availableDevice
        }
        
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: captureDevice!)
            captureSession.addInput(captureDeviceInput)
        } catch {
            print(error.localizedDescription)
        }
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.name = "CameraPreview"
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        previewLayer.backgroundColor = UIColor.black.cgColor
        self.previewLayer = previewLayer
        
//        let dataOutput = AVCaptureVideoDataOutput()
//        dataOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA]
//
//        if captureSession.canAddOutput(dataOutput) {
//            captureSession.addOutput(dataOutput)
//        }
//        captureSession.commitConfiguration()
    }
    
    func startSession() {
        if captureSession.isRunning { return }
        captureSession.startRunning()
    }
    
    func stopSession() {
        if !captureSession.isRunning { return }
        captureSession.stopRunning()
    }
}
