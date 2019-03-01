//
//  AppViewModel.swift

import Foundation
import RxSwift
import RxCocoa
import MGArchitecture

struct AppViewModel {
    let navigator: AppNavigatorType
    let useCase: AppUseCaseType
}

extension AppViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    struct Output {
        let toMain: Driver<Void>
    }
    
    func transform(_ input: AppViewModel.Input) -> AppViewModel.Output {
        
        let toMain = input.loadTrigger
            .do(onNext: { _ in
                self.navigator.toMain()
            })
        
        return Output(
            toMain: toMain
        )
    }
}
