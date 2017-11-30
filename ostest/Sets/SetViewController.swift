//
//  SetViewController.swift
//  ostest
//
//  Created by Maninder Soor on 28/02/2017.
//  Copyright © 2017 Maninder Soor. All rights reserved.
//

import Foundation
import AlamofireImage
import RealmSwift
import SwiftyBeaver

/**
 Shows the list of Sets
 */
final class SetViewController : UIViewController {
  
  /// Table View
  @IBOutlet private weak var tblView : UITableView?
  
  /// Activity loader for the table vie
  @IBOutlet private weak var activity : UIActivityIndicatorView?
  
  /// Log
  let log = SwiftyBeaver.self
  
  /// The movies set data
  private var data : Results<Movie>?
  
  /**
   Setup the view
   */
  override func viewDidLoad() {
    super.viewDidLoad()
    
    /// Setup view for loading
    self.setupLoading(isLoading: true)
    
    /// Call to setup the data
    self.setupData()
  }
  
  /**
   Setup loading
   
   - parameter isLoading
   */
  func setupLoading (isLoading : Bool) {
    UIView.animate(withDuration: 0.3, delay: 0.0, options: .beginFromCurrentState, animations: {
      self.activity?.alpha = isLoading ? 1.0 : 0.0
      self.tblView?.alpha = isLoading ? 0.0 : 1.0
    }) { (_) in }
  }
  
  
  /**
   Set's up the data for the table view
   */
  func setupData () {
  }
}


/**
 Table View datasource
 */
extension SetViewController : UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    /// Get the cell
    guard let cell = tableView.dequeueReusableCell(withIdentifier: SetViewCell.identifier) as? SetViewCell else {
      return UITableViewCell()
    }
    
    /// Set the data
    if let data = self.data?[indexPath.row] {
      
      /// Background image
      if let urlString = data.imageURLs.first?.url,
        let url = URL(string: urlString) {
        cell.imgBackground?.af_setImage(withURL: url)
      }
      
      /// Title
      cell.lblTitle?.text = data.title
      
      /// Description
      cell.txtDescription?.text = data.summary
      
    }
    
    /// Return the cell
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    /// Default
    return 180.0
  }
  
}


/**
 Table view delegate
 */
extension SetViewController : UITableViewDelegate {
  
}