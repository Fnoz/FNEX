//
//  FNEXTreeViewController.swift
//  FNEX
//
//  Created by Fnoz on 2016/11/10.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

public typealias FNEXTreeViewControllerSelected = ((_ view: UIView?) -> ())

class FNEXTreeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var viewArray: Array<UIView>? = [] {
        didSet {
            tableView?.reloadData()
        }
    }
    var selectedBlock: FNEXTreeViewControllerSelected?
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let backBtn = UIButton.init(frame: CGRect.init(x: 0, y: 10, width: 60, height: 44))
        backBtn.setTitle("Back", for: .normal)
        backBtn.setTitleColor(UIColor.init(red: 2/255.0, green: 185/255.0, blue: 209/255.0, alpha: 1), for: .normal)
        backBtn.titleLabel?.font = FNEXUtil.fnexFont(size: (backBtn.titleLabel?.font.pointSize)!)
        backBtn.addTarget(self, action: #selector(back), for: .touchUpInside)
        view.addSubview(backBtn)
        
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 44, width: view.frame.width, height: view.frame.height - 44), style: .plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.separatorStyle = .singleLine
        tableView?.tableFooterView = UIView()
        tableView?.register(FNEXTreeTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(FNEXTreeTableViewCell.self))
        view.addSubview(tableView!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func back() {
        selectedBlock!(nil)
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewArray?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let view = viewArray?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(FNEXTreeTableViewCell.self)) as! FNEXTreeTableViewCell
        cell.loadInfo(byView: view!, leftMargin: (15 + 10 * Double(indexPath.row)))
        cell.selectionStyle = .none
        
        switch (viewArray?.count)! - indexPath.row {
        case 1:
            cell.contentView.backgroundColor = UIColor.init(red: 1, green: 0, blue: 0, alpha: 0.3)
        case 2:
            cell.contentView.backgroundColor = UIColor.init(red: 0, green: 1, blue: 0, alpha: 0.3)
        default:
            cell.contentView.backgroundColor = .white
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedBlock!(viewArray?[indexPath.row])
        dismiss(animated: true, completion: nil)
    }
}
