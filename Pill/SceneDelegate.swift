//
//  SceneDelegate.swift
//  Pill
//
//  Created by 김은서 on 2022/03/30.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        
        // 알림창 설정
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                if settings.authorizationStatus == UNAuthorizationStatus.authorized {
                    // Notification 컨텐츠 설정.
                    let nContents = UNMutableNotificationContent()
                    nContents.badge = 0
                    nContents.title = "Title"
                    nContents.subtitle = "Subtitle"
                    nContents.body = "Body"
                    nContents.sound = UNNotificationSound.default
                    nContents.userInfo = ["name" : "jml"]
                    
                    let formatter = DateFormatter()
                    formatter.dateFormat = "HH:mm"
                    let pickerTime = formatter.string(from: Date())
                    let currentTime = formatter.string(from: Date())
                    
                    print(currentTime)
                    
                    if pickerTime == currentTime {
                        // 5초후에 트리거 작동.
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                        // Request 객체
                        let request = UNNotificationRequest(identifier: "jml", content: nContents, trigger: trigger)
                        UNUserNotificationCenter.current().add(request)
                    }
                    
                }
            }
        }
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

