//
//  NavigationState.swift
//  ReducerSwift
//
//  Created by Muhksin Hilmi on 28/10/2017.
//  Copyright © 2017 Shinkan. All rights reserved.
//

import ReSwift

enum NavigationRoutes: String {
    case home = "Home", question = "List of Question", register = "Register", digimon = "Digimon"
    
    var controller: UIViewController {
        switch self {
        case .question:
            return QuestionTableViewController()
        case .register:
            return RegisterTableViewController()
        case .digimon:
            return DigimonViewController()
        default:
            return HomeViewController()
        }
    }
}
