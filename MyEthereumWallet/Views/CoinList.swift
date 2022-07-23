//
//  CoinList.swift
//  MyEthereumWallet
//
//  Created by Kevin Zhang on 2022/7/23.
//

import SwiftUI

struct CoinList: View {
    @EnvironmentObject var userProfile: UserProfile
    
    var body: some View {
        List {
            Toggle(isOn: $userProfile.showFavoritesOnly) {
                Text("仅展示收藏货币")
            }
            ForEach(userProfile.coinDatas) { coinData in
                if !self.userProfile.showFavoritesOnly || coinData.isFavorite {
                    NavigationLink(
                        destination: CoinDetail(coinData: coinData)
                                    .environmentObject(userProfile)
                    ) {
                        CoinSummaryRow(coinData: coinData)
                    }
                }
            }
        }
        .navigationBarTitle(Text("货币列表"))
    }
}

struct LandmarksList_Previews: PreviewProvider {
    static var previews: some View {
        CoinList()
            .environmentObject(UserProfile())
    }
}
