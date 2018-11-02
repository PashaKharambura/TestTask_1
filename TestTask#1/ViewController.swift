//
//  ViewController.swift
//  TestTask#1
//
//  Created by Pavlo Kharambura on 11/2/18.
//  Copyright © 2018 Pavlo Kharambura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private enum CellIDs: String {
        case ImagesTableViewCell = "ImagesTableViewCell"
        case FeedbackTableViewCell = "FeedbackTableViewCell"
        case OrderInfoTableViewCell = "OrderInfoTableViewCell"
        case InfoTableViewCell = "InfoTableViewCell"
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var alertViewOne: UIImageView!
    fileprivate var alertViewTwo = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTable()
    }

    private func configureTable() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorColor = .clear
        self.tableView.register(UINib(nibName: CellIDs.ImagesTableViewCell.rawValue, bundle: nil), forCellReuseIdentifier: CellIDs.ImagesTableViewCell.rawValue)
        self.tableView.register(UINib(nibName: CellIDs.FeedbackTableViewCell.rawValue, bundle: nil), forCellReuseIdentifier: CellIDs.FeedbackTableViewCell.rawValue)
        self.tableView.register(UINib(nibName: CellIDs.OrderInfoTableViewCell.rawValue, bundle: nil), forCellReuseIdentifier: CellIDs.OrderInfoTableViewCell.rawValue)
        self.tableView.register(UINib(nibName: CellIDs.InfoTableViewCell.rawValue, bundle: nil), forCellReuseIdentifier: CellIDs.InfoTableViewCell.rawValue)
    }
    
    @objc
    fileprivate func showAlertTwo(_ sender: UIButton) {
        if self.view.contains(alertViewTwo) {
            self.alertViewTwo.removeFromSuperview()
        } else {
            guard let cell = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? OrderInfoTableViewCell else {return}
            let coord: (CGFloat,CGFloat) = (cell.likeButton.frame.maxX, cell.frame.maxY)
            alertViewTwo = UIImageView(frame: CGRect(x: coord.0 - 182, y: coord.1 + 50, width: 200, height: 80))
            alertViewTwo.image = UIImage(named: "Group_852")
            self.view.addSubview(alertViewTwo)
        }
    }
    
    @IBAction func contactUsButton(_ sender: Any) {
        alertViewOne.isHidden = !alertViewOne.isHidden
    }
    
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        alertViewOne.isHidden = true
        if self.view.contains(alertViewTwo) {
            self.alertViewTwo.removeFromSuperview()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIDs.ImagesTableViewCell.rawValue, for: indexPath) as? ImagesTableViewCell else {return UITableViewCell()}
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIDs.FeedbackTableViewCell.rawValue, for: indexPath) as? FeedbackTableViewCell else {return UITableViewCell()}
            
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIDs.OrderInfoTableViewCell.rawValue, for: indexPath) as? OrderInfoTableViewCell else {return UITableViewCell()}
            cell.likeButton.addTarget(self, action: #selector(showAlertTwo(_:)), for: .touchUpInside)
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIDs.InfoTableViewCell.rawValue, for: indexPath) as? InfoTableViewCell else {return UITableViewCell()}
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 200
        case 1:
            return 60
        case 2:
            return 60
         default:
            return UITableView.automaticDimension
        }
    }
}

public func setShadow(outerView: UIView, shadowOpacity: Float) {
    outerView.clipsToBounds = false
    outerView.layer.shadowColor = UIColor.black.cgColor
    outerView.layer.shadowOpacity = shadowOpacity
    outerView.layer.shadowOffset = CGSize.zero
    outerView.layer.shadowRadius = 1
    outerView.layer.shadowPath = UIBezierPath(roundedRect: outerView.bounds, cornerRadius: 0).cgPath
}


