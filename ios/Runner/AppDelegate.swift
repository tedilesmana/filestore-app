import UIKit
import Flutter
import FirebaseMessaging
import GoogleMobileAds
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

  static func registerPlugins(with registry: FlutterPluginRegistry) {
    GeneratedPluginRegistrant.register(with: registry)
  }

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
   
    // Other intialization code…
    UIApplication.shared.setMinimumBackgroundFetchInterval(TimeInterval(60*10))

    if #available(iOS 10.0, *) {
      // For iOS 10 display notification (sent via APNS)
      UNUserNotificationCenter.current().delegate = self

      let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
      UNUserNotificationCenter.current().requestAuthorization(
        options: authOptions,
        completionHandler: {_, _ in })
    } else {
      let settings: UIUserNotificationSettings =
      UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
      application.registerUserNotificationSettings(settings)
    }
    
    
    application.registerForRemoteNotifications()
    FirebaseApp.configure()
    AppDelegate.registerPlugins(with: self)
    GADMobileAds.sharedInstance().start(completionHandler: nil)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
  override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {

       Messaging.messaging().apnsToken = deviceToken
       super.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
  }
}
