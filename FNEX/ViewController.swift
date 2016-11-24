//
//  ViewController.swift
//  FNEX
//
//  Created by Fnoz on 2016/11/8.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fnexBtn = UIButton.init(frame: CGRect.init(x: view.frame.width - 74, y: 20, width: 64, height: 44))
        fnexBtn.setTitle("FNEX", for: .normal)
        fnexBtn.titleLabel?.font = FNEXUtil.fnexFont(size: (fnexBtn.titleLabel?.font.pointSize)!)
        fnexBtn.setTitleColor(UIColor.init(red: 2/255.0, green: 185/255.0, blue: 209/255.0, alpha: 1), for: .normal)
        fnexBtn.addTarget(self, action: #selector(showFNEX), for: .touchUpInside)
        view.addSubview(fnexBtn)
        
        let view0 = UIView.init(frame: CGRect.init(x: 0, y: 64, width: view.frame.width, height: view.frame.height * 0.3))
        view0.backgroundColor = .red
        
        let view1 = UIView.init(frame: CGRect.init(x: 0, y: 0, width: view0.frame.width - 44, height: view0.frame.height - 44))
        view1.backgroundColor = .orange
        view1.center = CGPoint.init(x: view0.bounds.width * 0.5, y: view0.bounds.height * 0.5)
        view0.addSubview(view1)
        
        let view2 = UIView.init(frame: CGRect.init(x: 0, y: 0, width: view1.frame.width - 44, height: view1.frame.height - 44))
        view2.backgroundColor = .yellow
        view2.center = CGPoint.init(x: view1.bounds.width * 0.5, y: view1.bounds.height * 0.5)
        view1.addSubview(view2)
        
        let view3 = UIView.init(frame: CGRect.init(x: 0, y: 0, width: view2.frame.width - 44, height: view2.frame.height - 44))
        view3.backgroundColor = .green
        view3.center = CGPoint.init(x: view2.bounds.width * 0.5, y: view2.bounds.height * 0.5)
        view2.addSubview(view3)
        
        let textfield = UITextField.init(frame: CGRect.init(x: 0, y: 0, width: view3.frame.width - 44, height: view3.frame.height - 44))
        textfield.backgroundColor = .white
        textfield.center = CGPoint.init(x: view3.bounds.width * 0.5, y: view3.bounds.height * 0.5)
        view3.addSubview(textfield)
                
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 64, width: view.frame.width, height: view.frame.height - 64), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = view0
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showFNEX() {
        FNEX.show()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self))
        cell?.textLabel?.text = "Cell At Index \(indexPath.row)"
        cell?.textLabel?.font = FNEXUtil.fnexFont(size: (cell?.textLabel?.font.pointSize)!)
        cell?.imageView?.image = UIImage.init(named: "cooked")
        cell?.accessoryType = .detailButton
        cell?.selectionStyle = .none
        return cell!
    }
}

