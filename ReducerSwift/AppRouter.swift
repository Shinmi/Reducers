//
//  AppRouter.swift
//  ReducerSwift
//
//  Created by Muhksin Hilmi on 28/10/2017.
//  Copyright © 2017 Shinkan. All rights reserved.
//

import ReSwift

final class AppRouter {
    
    let navigationController: UINavigationController
    
    init(window: UIWindow) {
        navigationController = UINavigationController()
        window.rootViewController = navigationController
        // 1
        store.subscribe(self) {
            $0.select {
                $0.routingState
            }
        }
    }
    
    // 2
    fileprivate func pushViewController(state: NavigationState, animated: Bool) {
        let viewController = state.controller
        viewController.title = state.rawValue
        navigationController.pushViewController(viewController, animated: animated)
    }
}

// MARK: - StoreSubscriber
// 3
extension AppRouter: StoreSubscriber {
    func newState(state: RoutingState) {
        // 4
        let shouldAnimate = navigationController.topViewController != nil
        // 5
        pushViewController(state: state.navigationState, animated: shouldAnimate)
    }
}
