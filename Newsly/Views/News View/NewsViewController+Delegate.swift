//
//  NewsViewController+Delegate.swift
//  Newsly
//
//  Created by SOHA on 8/16/21.
//
import UIKit
import Foundation
extension NewsViewController:  UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(40)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(153)
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        (view as! UITableViewHeaderFooterView).contentView.layer.cornerRadius = 15
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor.white
        (view as! UITableViewHeaderFooterView).textLabel?.font = UIFont(name: Constatnts.fontName, size: 14)
        (view as! UITableViewHeaderFooterView).textLabel?.textAlignment = .center
    }
    
}
