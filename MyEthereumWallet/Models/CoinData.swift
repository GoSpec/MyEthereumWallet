//
//  CoinData.swift
//  MyEthereumWallet
//
//  Created by Kevin Zhang on 2022/7/23.
//

import Foundation
import SwiftUI

struct CoinData: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var shortName: String
    var percentage: String
    var state: Int
    var value: String
    var isFavorite: Bool
    var desc: String
}

extension CoinData {
    var image: Image {
        return Image("CoinIcon")
    }
    
    var bigImage: Image {
        return Image("Banner")
    }
}
