//
//  SearchedExplanationViewController.swift
//  Assessment-6-NASA-APOD
//
//  Created by Chase on 3/12/23.
//

import UIKit

class SearchedExplanationViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var searchedExplanationTextView: UITextView!
    
    // MARK: - Properties
    var viewModel: APODSearchedViewModel!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = APODSearchedViewModel(delegate: self)
        updateViews()
        assignBackground()
    }
}

// MARK: - Extensions
extension SearchedExplanationViewController: APODSearchedViewModelDelegate {
    func updateViews() {
        DispatchQueue.main.async {
            guard let dailyAPOD = self.viewModel.apod else { return }
            self.searchedExplanationTextView.text = dailyAPOD.explanation
        }
    }

    func assignBackground() {
        let background = UIImage(named: "textview")
        let backGroundImageView = UIImageView(frame: searchedExplanationTextView.bounds)
        backGroundImageView.contentMode = .center
        backGroundImageView.clipsToBounds = true
        backGroundImageView.image = background
        backGroundImageView.alpha = 0.6
        searchedExplanationTextView.backgroundColor = UIColor(patternImage: backGroundImageView.image!)
    }
}
