//
//  SupalinkUserType.swift
//  Supalink
//
//  Created by 정진규 on 1/15/25.
//

import Foundation

/// Supalink 유저 타입을 나타내는 열거형
/// Represents the type of user in Supalink.
public enum SupalinkUserType {
    /// Supalink를 통해 재유입된 유저
    /// A user who has returned to the app via Supalink.
    case returning
    
    /// Supalink를 통해 신규 가입한 유저
    /// A converted user who signed up via Supalink.
    /// 앱 설치 후 실행 시 클립보드 붙여넣기 요청을 거부한 경우 자연유입으로 측정될 수 있습니다.
    /// If the clipboard paste request is denied after app installation, it might be counted as an organic user instead of converted.
    case converted
    
    /// 자연유입으로 신규 설치된 유저
    /// An organic user who installed the app naturally without any advertisements or campaigns.
    /// This refers to a user who arrives through organic means (e.g., search engines, recommendations) and installs the app.
    case organic
    
    /// Supalink 유입도 아니고, 첫 설치도 아닌 유저
    /// A user who has neither arrived via Supalink nor is a first-time installation.
    /// This represents users who don't fall into the above categories.
    case other
}
