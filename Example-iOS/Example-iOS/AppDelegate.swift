//
//  AppDelegate.swift
//  Example-iOS
//
//  Created by 정진규 on 1/15/25.
//

import UIKit
import Supalink

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        SupalinkSDK.shared.initSession { userType in
            // 유저 타입에 따라 적절한 처리를 합니다.
            // Handle actions based on the user's type.
            switch userType {
            case .converted:
                // Supalink를 통해 신규 가입한 유저 처리
                // Handle a user who signed up via Supalink
                break
            case .organic:
                // 자연유입으로 신규 설치된 유저 처리
                // Handle a user who installed the app organically
                break
            case .returning:
                // Supalink를 통해 재유입된 유저 처리
                // Handle a user who returned via Supalink
                break
            case .other:
                // Supalink 유입도 아니고, 첫 설치도 아닌 유저 처리
                // Handle a user who is neither from Supalink nor a first-time installation
                break
            }
        }
        
        return true
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([any UIUserActivityRestoring]?) -> Void) -> Bool {
        if userActivity.activityType == NSUserActivityTypeBrowsingWeb,
            let incomingURL = userActivity.webpageURL {
            
            // Supalink의 유니버설 링크를 처리합니다.
            // Handle the incoming Supalink universal link
            SupalinkSDK.shared.handleUniversialLink(incomingURL) { supalink in
                print("You can use supalink params: \(supalink)")
            }
            
            return false
        }
        
        return false
    }
}

