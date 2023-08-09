//
//  MirrorApp.swift
//  Mirror
//
//  Created by 金子広樹 on 2023/06/22.
//

import SwiftUI

@main
struct MirrorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(presenter: SimpleVideoCapturePresenter())
        }
    }
}
