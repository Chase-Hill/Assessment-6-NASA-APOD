//
//  APODDailyViewController.swift
//  Assessment-6-NASA-APOD
//
//  Created by Chase on 3/11/23.
//

import UIKit

class APODDailyViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var apodTitleLabel: UILabel!
    @IBOutlet weak var apodCopyrightLabel: UILabel!
    @IBOutlet weak var todayAPODImageView: UIImageView!
    @IBOutlet weak var apodExplanationLabel: UILabel!
    
    // MARK: - Properties
    var viewModel: APODDailyViewModel!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        viewModel = APODDailyViewModel(delegate: self)
    }
    
    // MARK: - Functions
    func assignbackground(){
        let background = UIImage(named: "APOD background")
        
        var backGroundImageView : UIImageView!
        backGroundImageView = UIImageView(frame: view.bounds)
        backGroundImageView.contentMode =  UIView.ContentMode.scaleAspectFill
        backGroundImageView.clipsToBounds = true
        backGroundImageView.image = background
        backGroundImageView.center = view.center
        backGroundImageView.alpha = 0.75
        view.addSubview(backGroundImageView)
        self.view.sendSubviewToBack(backGroundImageView)
    }
}

// MARK: - Extensions
extension APODDailyViewController: APODDailyViewModelDelegate {
    func updateViews() {
        DispatchQueue.main.async {
            
            guard let dailyAPOD = self.viewModel.apod else { return }
            self.apodTitleLabel.text = dailyAPOD.title
            self.apodCopyrightLabel.text = "Credit: \(dailyAPOD.copyright ?? "Credit: NASA")"
            self.apodExplanationLabel.text = dailyAPOD.explanation
        }
    }
}
