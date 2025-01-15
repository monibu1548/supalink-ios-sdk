//
//  Supalink.swift
//  Supalink
//
//  Created by 정진규 on 1/15/25.
//

import Foundation

public struct Supalink {
    /// The main link associated with the Universal Link.
    /// 예: 사용자가 전달하려는 링크 (예: "https://supalink.cc")
    public let link: String?
    
    /// The Android Package Name (APN) for the app.
    /// 안드로이드 앱을 식별하는 패키지 이름
    public let apn: String?
    
    /// The Android fallback URL (AFL).
    /// 안드로이드에서 사용되는 대체 링크
    public let afl: String?
    
    /// The Android minimum version (AMV).
    /// 안드로이드 앱의 최소 버전
    /// deprecated
    public let amv: String?
    
    /// The iOS Bundle Identifier (IBI).
    /// iOS 앱을 식별하는 번들 ID
    public let ibi: String?
    
    /// The iOS fallback URL (IFL).
    /// iOS에서 사용되는 대체 링크
    public let ifl: String?
    
    /// The Universal Link (IUS) for the app.
    /// 앱을 위한 유니버셜 링크 (앱 스킴)
    public let ius: String?
    
    /// The iOS platform fallback URL (IPFL).
    /// iOS에서 사용하는 대체 링크 (플랫폼 관련)
    public let ipfl: String?
    
    /// The iOS Bundle Identifier for the platform (IPBI).
    /// iOS 플랫폼에서의 번들 ID
    public let ipbi: String?
    
    /// The iOS App Store ID (ISI).
    /// iOS 앱의 App Store ID
    public let isi: String?
    
    /// The iOS minimum version (IMV).
    /// iOS 앱의 최소 버전
    /// deprecated
    public let imv: String?
    
    /// The expiration time for the link (EFT).
    /// 링크의 만료 시간
    /// deprecated
    public let eft: String?
    
    /// The iOS fallback URL (OFL).
    /// iOS에서 사용되는 대체 링크
    /// deprecated
    public let ofl: String?
    
    /// The SEO title associated with the link, typically displayed when the link is shared on social media.
    /// 링크와 관련된 SEO 제목, 소셜 미디어에서 링크가 공유될 때 일반적으로 표시됩니다.
    public let st: String?

    /// The SEO description associated with the link, typically displayed when the link is shared on social media.
    /// 링크와 관련된 SEO 설명, 소셜 미디어에서 링크가 공유될 때 일반적으로 표시됩니다.
    public let sd: String?

    /// The SEO image associated with the link, typically displayed when the link is shared on social media.
    /// 링크와 관련된 SEO 이미지, 소셜 미디어에서 링크가 공유될 때 일반적으로 표시됩니다.
    public let si: String?
    
    /// UTM source for tracking marketing campaigns.
    /// 마케팅 캠페인을 추적하기 위한 UTM 소스
    public let utm_source: String?
    
    /// UTM medium for tracking marketing campaigns.
    /// 마케팅 캠페인을 추적하기 위한 UTM 매체
    public let utm_medium: String?
    
    /// UTM campaign for tracking marketing campaigns.
    /// 마케팅 캠페인을 추적하기 위한 UTM 캠페인
    public let utm_campaign: String?
    
    /// UTM term for tracking marketing campaigns.
    /// 마케팅 캠페인을 추적하기 위한 UTM 키워드
    public let utm_term: String?
    
    /// UTM content for tracking marketing campaigns.
    /// 마케팅 캠페인을 추적하기 위한 UTM 콘텐츠
    public let utm_content: String?
    
    /// The attribution token (AT) for tracking the source.
    /// 링크의 출처를 추적하기 위한 속성 토큰
    public let at: String?
    
    /// The content type (CT) for the link.
    /// 링크의 콘텐츠 유형
    public let ct: String?
    
    /// The medium type (MT) for the link.
    /// 링크의 매체 유형
    public let mt: String?
    
    /// The platform type (PT) for the link.
    /// 링크의 플랫폼 유형
    public let pt: String?
}
