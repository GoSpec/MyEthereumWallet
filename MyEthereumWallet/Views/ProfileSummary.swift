//
//  ProfileSummary.swift
//  MyEthereumWallet
//
//  Created by Kevin Zhang on 2022/7/23.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var userProfile: UserProfile
    
    var body: some View {
        List {
            VStack {
                Image("Avatar")
                    .background(Color.gray)
                    .frame(width: 100, height: 100)
                    .cornerRadius(50)
                    .aspectRatio(1 / 1, contentMode: .fit)
                Text(userProfile.userName)
                    .bold()
                    .font(.title)
            }
            
            Text("夜间模式已跟随系统")
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary()
            .environmentObject(UserProfile())
    }
}
