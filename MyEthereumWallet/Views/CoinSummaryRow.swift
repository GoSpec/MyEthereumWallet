//
//  CoinSummaryRow.swift
//  MyEthereumWallet
//
//  Created by Kevin Zhang on 2022/7/23.
//

import SwiftUI

struct CoinSummaryRow: View {
    var coinData: CoinData

    var body: some View {
        HStack {
            coinData.image
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(20)
            VStack(alignment: .leading) {
                Text(coinData.name)
                    .font(Font.system(size: 15))
                    .fontWeight(.bold)
                HStack {
                    Text(coinData.shortName)
                        .font(Font.system(size: 12))
                        .fontWeight(.medium)
                    Text(coinData.percentage)
                        .font(Font.system(size: 12))
                        .fontWeight(.medium)
                        .foregroundColor(coinData.state == 1 ? .red : .green)
                }
            }
            if coinData.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
            Spacer()
            
            Text("市值\(coinData.value)Bn")
                .font(Font.system(size: 10))
                .bold()
                .foregroundColor(Color.gray)
        }
    }
}

struct CoinSummaryRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinSummaryRow(coinData: allCoinData[0])
        }
        .previewLayout(.fixed(width: 375, height: 60))
    }
}
