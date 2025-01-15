// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import UIKit

@MainActor
public class SupalinkSDK: Sendable {
    private let isFirstInstallKey = "cc.supalink.install"
    
    private var session: String?
    private var savedSupalink: Supalink?
    
    public static let shared = SupalinkSDK()
    
    private init() {}
    
    public func initSession(completionHandler: @escaping (SupalinkUserType) -> Void) {
        session = UUID().uuidString
        
        inspectPasteboard()
        
        if isFisrtLaunching() {
            UserDefaults.standard.set(session, forKey: isFirstInstallKey)

            if let supalink = savedSupalink {
                if let isi = supalink.isi, let deeplink = URL(string: isi), UIApplication.shared.canOpenURL(deeplink) {
                    // Deferred Deep Link
                    UIApplication.shared.open(deeplink) { _ in
                        completionHandler(.converted)
                    }
                } else {
                    completionHandler(.converted)
                }
            } else {
                completionHandler(.organic)
            }
        } else {
            if (savedSupalink != nil) {
                completionHandler(.returning)
            } else {
                completionHandler(.other)
            }
        }
    }
    
    public func handleUniversialLink(_ universialLink: URL, completionHandler: @escaping (Supalink?) -> Void) {
        guard let supalink = urlToSupalink(universialLink) else {
            completionHandler(nil)
            return
        }
        
        if let isi = supalink.isi, let deeplink = URL(string: isi) {
            if UIApplication.shared.canOpenURL(deeplink) {
                UIApplication.shared.open(deeplink)
            }
        }
        
        completionHandler(supalink)
    }
}

extension SupalinkSDK {
    private func isFisrtLaunching() -> Bool {
        let installedSession = UserDefaults.standard.string(forKey: isFirstInstallKey)
        
        return installedSession == nil
    }
    
    private func urlToSupalink(_ url: URL) -> Supalink? {
        if let components = URLComponents(url: url, resolvingAgainstBaseURL: false) {
            var linkValues: [String: String] = [:]

            if let queryItems = components.queryItems {
                for item in queryItems {
                    linkValues[item.name] = item.value
                }
            }
            
            if linkValues.isEmpty { return nil }
            
            return Supalink(
                link: linkValues["link"],
                apn: linkValues["apn"],
                afl: linkValues["afl"],
                amv: linkValues["amv"],
                ibi: linkValues["ibi"],
                ifl: linkValues["ifl"],
                ius: linkValues["ius"],
                ipfl: linkValues["ipfl"],
                ipbi: linkValues["ipbi"],
                isi: linkValues["isi"],
                imv: linkValues["imv"],
                eft: linkValues["eft"],
                ofl: linkValues["ofl"],
                st: linkValues["st"],
                sd: linkValues["sd"],
                si: linkValues["si"],
                utm_source: linkValues["utm_source"],
                utm_medium: linkValues["utm_medium"],
                utm_campaign: linkValues["utm_campaign"],
                utm_term: linkValues["utm_term"],
                utm_content: linkValues["utm_content"],
                at: linkValues["at"],
                ct: linkValues["ct"],
                mt: linkValues["mt"],
                pt: linkValues["pt"]
            )
        }
        
        return nil
    }
    
    private func inspectPasteboard() {
        if UIPasteboard.general.hasURLs,
           let url = UIPasteboard.general.url,
           let supalink = urlToSupalink(url) {
            savedSupalink = supalink
        }
    }
}
