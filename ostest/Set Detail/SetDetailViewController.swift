//
//  SetDetailViewController.swift
//  ostest
//
//  Created by Deja Cespedes on 30/11/2017.
//  Copyright © 2017 Maninder Soor. All rights reserved.
//

import Foundation
import UIKit

class SetDetailViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet private weak var episodeImageView: UIImageView?
    @IBOutlet private weak var episodeTitle: UILabel?
    @IBOutlet private weak var episodeDescription: UITextView?
    
    //MARK: - Properties
    public var setDetailDataSource: SetDetailDataSource? = nil
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialiseElements()
    }
    
    //MARK: - UI
    private func initialiseElements() {
        episodeTitle?.text = setDetailDataSource?.episodeTitle()
        episodeDescription?.text = setDetailDataSource?.episodeDescription()
    }
    
    //MARK: - Navigation
    @IBAction private func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
}
