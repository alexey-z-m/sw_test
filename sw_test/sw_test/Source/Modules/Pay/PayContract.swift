//
//  PayContract.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 07.02.2024.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewPayProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterPayProtocol {
    
    var view: PresenterToViewPayProtocol? { get set }
    var interactor: PresenterToInteractorPayProtocol? { get set }
    var router: PresenterToRouterPayProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorPayProtocol {
    
    var presenter: InteractorToPresenterPayProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterPayProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterPayProtocol {
    
}
