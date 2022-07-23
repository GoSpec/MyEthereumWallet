//
//  DisplayView.swift
//  MyEthereumWallet
//
//  Created by Kevin Zhang on 2022/7/23.
//

import SwiftUI

struct DisplayView: View {
    var coinData: CoinData
    
    var body: some View {
        coinData.bigImage
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .background(Color.gray)
            .overlay(TextOverlay(coinData: coinData))
    }
}

struct TextOverlay: View {
    var coinData: CoinData
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            Text(coinData.name)
            .font(.title)
            .bold()
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView(coinData: allCoinData[0])
    }
}
