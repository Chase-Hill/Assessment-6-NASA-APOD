//
//  APODDailyViewModel.swift
//  Assessment-6-NASA-APOD
//
//  Created by Chase on 3/11/23.
//

import UIKit

protocol APODDailyViewModelDelegate: AnyObject {
    func updateViews()
}

class APODDailyViewModel {
    
    // MARK: - Properties
    var apod: APOD?
    let service: NetworkingControllerServiceable
    private weak var delegate: APODDailyViewModelDelegate?
    
    init(delegate: APODDailyViewModelDelegate, serviceInjected: NetworkingControllerServiceable = NetworkingController()) {
        self.delegate = delegate
        self.service = serviceInjected
        fetchDaily()
    }
    
    // MARK: - Functions
    func fetchDaily() {
        service.fetchAPOD(with: .today) { result in
            switch result {
            case .success(let apod):
                self.apod = apod
                self.delegate?.updateViews()
            case .failure(let error):
                print(error.errorDescription ?? NetworkError.unknownError)
            }
        }
    }
}
