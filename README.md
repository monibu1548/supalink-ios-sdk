
# ⚠️ Archived Repository

This repository is archived and no longer maintained.
No further development will be done and issues or pull requests will not be accepted.

Please use [hackle-io/supalink-ios-sdk](https://github.com/hackle-io/supalink-ios-sdk) for the latest updates and ongoing support.


# Supalink iOS SDK

The **Supalink iOS SDK** is designed to help developers integrate Supalink functionality into their iOS applications. With this SDK, you can easily handle **deferred deep linking**, **user session management**, and **URL handling** for sharing and redirection purposes.

For more details about Supalink and its features, visit [Supalink](https://supalink.cc).

## Features

- **Deferred Deep Linking**: Handle deep links even if the app is not installed at the time of the link click.
- **User Type Management**: Identify and categorize users based on their interactions with the app (e.g., organic, returning, converted).
- **Universal Link Handling**: Handle Universal Links to enable deep linking functionality across iOS.
- **ClipBoard Integration**: Support for accessing and handling clipboard content for dynamic links.

## Installation

### Swift Package Manager (SPM)

You can add the Supalink SDK to your project using **Swift Package Manager**.

1. Open your project in Xcode.
2. Go to `File > Swift Packages > Add Package Dependency`.
3. Enter the URL of the Supalink repository:

   ```
   https://github.com/monibu1548/supalink-ios-sdk.git
   ```

4. Select the version or branch you want to use and add it to your project.

### Manual Installation

If you'd prefer to manually add the SDK to your project:

1. Clone the repository:
   ```bash
   git clone https://github.com/monibu1548/supalink-ios-sdk.git
   ```

2. Drag the `SupalinkSDK` folder into your Xcode project.

3. Make sure to link the required dependencies in your Xcode project.

## Usage

### XCode Associated Domains
* XCode > Project > App Target > Signing & Capabilities

1. Add Associated Doamins Capability
![Associated Domain](https://fjptahzzkutbfwxdfngc.supabase.co/storage/v1/object/public/supalink-public/associated-domains-example1.png)

2. Add Associated Doamin
![Associated Domain](https://fjptahzzkutbfwxdfngc.supabase.co/storage/v1/object/public/supalink-public/associated-domains-example2.png)

Format: `applinks:{your subdomain}.supalink.cc`

### Initializing the SDK

To initialize the SDK and handle user session management, you can call `initSession` when your app launches:

```swift
import Supalink

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
}
```

### Handling Universal Links

To handle Universal Links in your app, use the `handleUniversalLink` method:

```swift
class AppDelegate: UIResponder, UIApplicationDelegate {
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
```

## Contributing

1. Fork this repository.
2. Create your feature branch (`git checkout -b feature/YourFeature`).
3. Commit your changes (`git commit -m 'Add new feature'`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
