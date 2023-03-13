//
//  APODSearchedViewModel.swift
//  Assessment-6-NASA-APOD
//
//  Created by Chase on 3/11/23.
//

import Foundation

protocol APODSearchedViewModelDelegate: AnyObject {
    func updateViews()
}

class APODSearchedViewModel {

    // MARK: - Properties
    var apod: APOD?
    let service: NetworkingControllerServiceable
    private weak var delegate: APODSearchedViewModelDelegate?

    init(delegate: APODSearchedViewModelDelegate, service: NetworkingControllerServiceable = NetworkingController()) {
        self.service = service
        self.delegate = delegate
        fetchSearched()
    }

    // MARK: - Functions
    func fetchSearched() {
        guard let apod = apod else { return }
        service.fetchSearchedAPOD(with: .search(apod.date), fromDate: apod.date) { result in
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
