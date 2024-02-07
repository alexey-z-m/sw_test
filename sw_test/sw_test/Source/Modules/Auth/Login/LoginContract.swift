//
//  LoginContract.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 07.02.2024.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewLoginProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterLoginProtocol {
    
    var view: PresenterToViewLoginProtocol? { get set }
    var interactor: PresenterToInteractorLoginProtocol? { get set }
    var router: PresenterToRouterLoginProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorLoginProtocol {
    
    var presenter: InteractorToPresenterLoginProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterLoginProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterLoginProtocol {
    
}
