//
//  AppNavigator.swift

import Foundation
import RxSwift
import RxCocoa

protocol AppNavigatorType {
    func toMain()
}

struct AppNavigator: AppNavigatorType {
    unowned let window: UIWindow
    
    func toMain() {
        let viewController = MainViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: viewController)
        let navigator = MainNavigator(navigationController: navigationController)
        let useCase = MainUseCase()
        let viewModel = MainViewModel(navigator: navigator, useCase: useCase)
        
        viewController.bindViewModel(to: viewModel)
        window.rootViewController = navigationController
    }
}
