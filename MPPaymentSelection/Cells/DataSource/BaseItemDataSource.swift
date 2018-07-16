//
//  BaseItemDataSource.swift
//  MPPaymentSelection
//
//  Created by Gerlandio Da Silva Lucena on 14/07/2018.
//  Copyright © 2018 GerlandioLucena. All rights reserved.
//

import UIKit
import Reusable

class BaseItemDataSource<item>: NSObject, UITableViewDataSource {
    
    var itemList: [item]?
    weak var tableView: UITableView?
    var identifier: String{ get { return String(describing: UITableView.self) } }
    
    required init(listItem: [item], tableView: UITableView) {
        self.itemList = listItem
        self.tableView = tableView
        super.init()
        setupTableView()
    }
    
    func setupTableView() {
        //A ser implementado na superClasse
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        return cell
    }
}
