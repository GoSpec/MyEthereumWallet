//
//  MyEthereumWalletApp.swift
//  MyEthereumWallet
//
//  Created by Kevin Zhang on 2022/7/23.
//

import SwiftUI

@main
struct MyEthereumWalletApp: App {
    var body: some Scene {
        WindowGroup {
            Home()
                .environmentObject(UserProfile())
        }
    }
}
