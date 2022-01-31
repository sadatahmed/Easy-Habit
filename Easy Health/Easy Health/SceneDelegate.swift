//
//  SceneDelegate.swift
//  Easy Health
//
//  Created by BJIT on 21/1/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let checker = UserDefaults.standard.object(forKey: "wakeUp")
        if checker != nil {
            window = UIWindow(windowScene: windowScene)
            let storyboard = UIStoryboard(name: "DayMood", bundle: nil)
            window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "DayMoodID")
            window?.makeKeyAndVisible()
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

