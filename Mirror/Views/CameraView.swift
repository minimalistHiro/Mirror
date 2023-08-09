//
//  CameraView.swift
//  Mirror
//
//  Created by 金子広樹 on 2023/06/23.
//

import SwiftUI
import AVFoundation

//struct CameraView: UIViewControllerRepresentable {
//
//    func makeUIViewController(context: Context) -> UIImagePickerController {
//        let controller = UIImagePickerController()
//        controller.sourceType = .camera
////        controller.showsCameraControls = false
////        controller.cameraCaptureMode = .video
////        controller.view.frame(forAlignmentRect: CGRect(x: 0,
////                                                       y: 0,
////                                                       width: UIScreen.main.bounds.width,
////                                                       height: UIScreen.main.bounds.height))
//        let session = AVCaptureSession()
//        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
//        previewLayer.videoGravity = .resizeAspectFill
//        return controller
//    }
//
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
//        // 処理なし
//    }
//}

struct CameraView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView { BaseCameraView() }
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

class BaseCameraView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        _ = initCaptureSession
        (layer.sublayers?.first as? AVCaptureVideoPreviewLayer)?.frame = frame

    }

    lazy var initCaptureSession: Void = {
        guard let device = AVCaptureDevice.DiscoverySession(
            deviceTypes: [.builtInWideAngleCamera],
            mediaType: .video,
            position: .unspecified)
            .devices.first(where: { $0.position == .front }),
        let input = try? AVCaptureDeviceInput(device: device) else { return }
        let session = AVCaptureSession()
        session.addInput(input)
        session.startRunning()
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = .resizeAspectFill //←これが必要
//        previewLayer.connection?.videoOrientation = .landscapeRight
        layer.insertSublayer(previewLayer, at: 100)
    }()
}
