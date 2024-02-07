//
//  MenuContract.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 07.02.2024.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewMenuProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterMenuProtocol {
    
    var view: PresenterToViewMenuProtocol? { get set }
    var interactor: PresenterToInteractorMenuProtocol? { get set }
    var router: PresenterToRouterMenuProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorMenuProtocol {
    
    var presenter: InteractorToPresenterMenuProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterMenuProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterMenuProtocol {
    
}
