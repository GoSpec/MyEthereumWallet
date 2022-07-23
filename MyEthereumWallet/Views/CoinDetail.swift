//
//  CoinDetail.swift
//  MyEthereumWallet
//
//  Created by Kevin Zhang on 2022/7/23.
//

import SwiftUI

struct CoinDetail: View {
    @EnvironmentObject var userProfile: UserProfile
    var coinData: CoinData
    
    var index: Int {
        allCoinData.firstIndex(where: { $0.id == coinData.id })!
    }

    var body: some View {
        VStack {
            Image("Banner")
                .frame(width: 200, height: 200)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(coinData.name)
                        .font(.title)
                    
                    Button(action: {
                        userProfile.coinDatas[self.index].isFavorite.toggle()
                    }) {
                        if userProfile.coinDatas[self.index].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                
                HStack(alignment: .top) {
                    Text(coinData.shortName)
                        .font(.subheadline)
                    Spacer()
                    Text(coinData.percentage)
                        .font(.subheadline)
                        .foregroundColor(coinData.state == 1 ? Color.red : Color.green)
                }
                
                Text(coinData.desc)
            }
            .padding()
            
            Spacer()
        }
    }
}

struct CoinDetail_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetail(coinData: allCoinData[0])
            .environmentObject(UserProfile())
    }
}
