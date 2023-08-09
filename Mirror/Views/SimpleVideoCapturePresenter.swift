//
//  SimpleVideoCapturePresenter.swift
//  Mirror
//
//  Created by 金子広樹 on 2023/06/24.
//

import SwiftUI

final class SimpleVideoCapturePresenter: ObservableObject {
    
    var previewLayer: CALayer {
        return interactor.previewLayer!
    }
    
    enum Inputs {
        case onAppear
        case onDisappear
    }
    
    init() {
        interactor.setupAVCaptureSession()
    }
    
    func apply(inputs: Inputs) {
        switch inputs {
        case .onAppear:
            interactor.startSession()
            break
        case .onDisappear:
            interactor.stopSession()
        }
    }
    
    // MARK: - Privates
    private let interactor = SimpleVideoCaptureInteractor()
}
