//
//  APODSearchViewController.swift
//  Assessment-6-NASA-APOD
//
//  Created by Chase on 3/11/23.
//

import UIKit

class APODSearchViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var apodDatePicker: UIDatePicker!
    @IBOutlet weak var apodTitleLabel: UILabel!
    @IBOutlet weak var apodCopyrightLabel: UILabel!
    @IBOutlet weak var searchedAPODImageView: ServiceRequestingImageView!
    @IBOutlet weak var apodExplanationLabel: UILabel!
    
    // MARK: - Properties
    var viewModel: APODSearchedViewModel!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        viewModel = APODSearchedViewModel(delegate: self)
        updateViews()
    }
}

// MARK: - Extension
extension APODSearchViewController: APODSearchedViewModelDelegate {
    func updateViews() {
        DispatchQueue.main.async {
            guard let apod = self.viewModel.apod else { return }
            self.apodTitleLabel.text = apod.title
            self.apodCopyrightLabel.text = apod.copyright
            self.apodExplanationLabel.text = apod.explanation
            
            guard let url = URL(string: self.viewModel.apod!.imageURL) else { return }
            var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
            guard let finalImageURL = urlComponents?.url else { return }
            self.searchedAPODImageView.fetchImage(using: finalImageURL)
        }
    }
    
    func assignbackground() {
        let background = UIImage(named: "APOD search background")
        
        var backGroundImageView : UIImageView!
        backGroundImageView = UIImageView(frame: view.bounds)
        backGroundImageView.contentMode =  UIView.ContentMode.scaleAspectFill
        backGroundImageView.clipsToBounds = true
        backGroundImageView.image = background
        backGroundImageView.center = view.center
        backGroundImageView.alpha = 1
        view.addSubview(backGroundImageView)
        self.view.sendSubviewToBack(backGroundImageView)
    }
}
