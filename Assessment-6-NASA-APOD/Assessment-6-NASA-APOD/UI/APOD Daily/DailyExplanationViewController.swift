//
//  DailyExplanationViewController.swift
//  Assessment-6-NASA-APOD
//
//  Created by Chase on 3/12/23.
//

import UIKit

class DailyExplanationViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var dailyExplanationTextView: UITextView!
    
    // MARK: - Properties
    var viewModel: APODDailyViewModel!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = APODDailyViewModel(delegate: self)
        updateViews()
        assignBackground()
    }
}

// MARK: - Extensions
extension DailyExplanationViewController: APODDailyViewModelDelegate {
    func updateViews() {
        DispatchQueue.main.async {
            guard let dailyAPOD = self.viewModel.apod else { return }
            self.dailyExplanationTextView.text = dailyAPOD.explanation
        }
    }

    func assignBackground() {
        let background = UIImage(named: "textview")
        let backGroundImageView = UIImageView(frame: dailyExplanationTextView.bounds)
        backGroundImageView.contentMode = .center
        backGroundImageView.clipsToBounds = true
        backGroundImageView.image = background
        backGroundImageView.alpha = 0.6
        dailyExplanationTextView.backgroundColor = UIColor(patternImage: backGroundImageView.image!)
    }
}
