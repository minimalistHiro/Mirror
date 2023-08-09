//
//  ContentView.swift
//  Mirror
//
//  Created by 金子広樹 on 2023/06/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var presenter: SimpleVideoCapturePresenter
    
    var body: some View {
        ZStack {
            CALayerView(caLayer: presenter.previewLayer)
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            self.presenter.apply(inputs: .onAppear)
        }
        .onDisappear {
            self.presenter.apply(inputs: .onDisappear)
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(presenter: <#SimpleVideoCapturePresenter#>)
//    }
//}

