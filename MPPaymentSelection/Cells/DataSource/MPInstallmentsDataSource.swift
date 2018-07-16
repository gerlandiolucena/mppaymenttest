//
//  MPPaymentMethodsDataSource.swift
//  MPPaymentSelection
//
//  Created by Gerlandio Da Silva Lucena on 14/07/2018.
//  Copyright © 2018 GerlandioLucena. All rights reserved.
//

import UIKit
import Reusable

class MPInstallmentsDataSource: BaseItemDataSource<MPPayerCosts> {
    
    var selectedRow: Int? {
        didSet {
            self.tableView?.reloadData()
        }
    }
    
    override var identifier: String{ get { return String(describing: MPPaymentCostsTableViewCell.self) } }
    
    override func setupTableView() {
        self.tableView?.register(cellType: MPPaymentCostsTableViewCell.self)
    }
    
    func setSelectedIndex(selected: Int) {
        selectedRow = selected
    }
    
    func selectedItem() -> MPPayerCosts? {
        if let selected = selectedRow {
            return itemList?[selected]
        }
        
        return nil
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        if let paymentCostCell = cell as? MPPaymentCostsTableViewCell {
            let paymentCost = itemList?[indexPath.row]
            paymentCostCell.selectedItem = indexPath.row == (selectedRow ?? -1)
            paymentCostCell.item = paymentCost
        }
        return cell
    }
}
