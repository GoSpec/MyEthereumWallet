//
//  UserProfile.swift
//  MyEthereumWallet
//
//  Created by Kevin Zhang on 2022/7/23.
//

import SwiftUI
import Combine

final class UserProfile: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var isDarkMode = false
    @Published var coinDatas = allCoinData
    @Published var userName = "Kevin Zhang"
}
