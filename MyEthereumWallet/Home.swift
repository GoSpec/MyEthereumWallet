//
//  Home.swift
//  MyEthereumWallet
//
//  Created by Kevin Zhang on 2022/7/23.
//

import SwiftUI

struct Home: View {
    @State var showingProfile = false
    @EnvironmentObject var userProfile: UserProfile
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }

    var body: some View {
        NavigationView {
            List {
                PageView(allCoinData.map {coinData in
                    DisplayView(coinData:coinData) }
                )
                    .frame(height: 200)
                
                ForEach(userProfile.coinDatas) { coinData in
                    CoinSummaryRow(coinData: coinData)
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12))
                
                NavigationLink(destination: CoinList(userProfile: _userProfile)) {
                    Text("查看全部")
                }
            }
            .navigationBarTitle(Text("首页"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                ProfileSummary()
                    .environmentObject(userProfile)
            }
        }
    }
}

struct BannerDatas: View {
    var coinDatas: [CoinData]
    var body: some View {
        coinDatas[0].bigImage.resizable()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(UserProfile())
    }
}
