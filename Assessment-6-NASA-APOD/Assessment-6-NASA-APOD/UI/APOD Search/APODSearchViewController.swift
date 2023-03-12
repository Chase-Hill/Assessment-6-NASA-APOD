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
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
    }
    
    // MARK: - Functions
    func assignbackground(){
        let background = UIImage(named: "APOD search background")
        
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
