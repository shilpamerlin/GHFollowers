//
//  FolloweListVC.swift
//  GHFollowers
//
//  Created by Shilpa Joy on 2023-03-17.
//

import UIKit

class FolloweListVC: UIViewController {

    var userName: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground

    }

}
