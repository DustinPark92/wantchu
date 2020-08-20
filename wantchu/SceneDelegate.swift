//
//  SceneDelegate.swift
//  wantchu
//
//  Created by Dustin on 2020/08/17.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
                
                guard let windowScene = (scene as? UIWindowScene) else { return }
                
                window = UIWindow(frame: windowScene.coordinateSpace.bounds)
                window?.windowScene = windowScene
                window?.rootViewController = creatTabBar()
                window?.makeKeyAndVisible()
                
    }
    
    func createMainNC() -> UINavigationController {
        let layout = UICollectionViewFlowLayout()
        let MainVC = MainViewController(collectionViewLayout: layout)
        MainVC.tabBarItem = UITabBarItem(title: "주문현황",
                                         image: UIImage(systemName: "clock.fill"),
                                         tag: 0)
        
        return UINavigationController(rootViewController: MainVC)
    }
    
    
    func creatSecondNC() -> UINavigationController {
        let vc = SecondViewController()
        vc.tabBarItem = UITabBarItem(title: "",
                                     image: UIImage(systemName: "bookmark.fill"),
                                     tag: 1)
        
        return UINavigationController(rootViewController: vc)
    }
    
    func createThirdNC() -> UINavigationController {
        let vc = ThirdViewController()
        vc.tabBarItem = UITabBarItem(title: "",
                                     image: UIImage(systemName: "house.fill"),
                                     tag: 0)
        
        return UINavigationController(rootViewController: vc)
    }
    
    func createFourthNC() -> UINavigationController {
        let vc = FourthViewController()
        vc.tabBarItem = UITabBarItem(title: "",
                                         image: UIImage(systemName: "doc.text.fill"),
                                         tag: 0)
        
        return UINavigationController(rootViewController: vc)
    }
    
    func createFifthNC() -> UINavigationController {
        let vc = FifthViewController()
        vc.tabBarItem = UITabBarItem(title: "",
                                         image: UIImage(systemName: "person.fill"),
                                         tag: 0)
        
        return UINavigationController(rootViewController: vc)
    }
    
    
    func creatTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        UITabBar.appearance().tintColor = .systemGreen
        tabBar.viewControllers = [createMainNC(), creatSecondNC(),
                                  createThirdNC(), createFourthNC(),
                                  createFifthNC()]
        return tabBar
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

