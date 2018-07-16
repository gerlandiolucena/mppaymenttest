//
//  MPPaymentMethodsDataSource.swift
//  MPPaymentSelection
//
//  Created by Gerlandio Da Silva Lucena on 14/07/2018.
//  Copyright © 2018 GerlandioLucena. All rights reserved.
//

import UIKit
import Reusable

class MPPaymentMethodsDataSource: BaseItemDataSource<MPPayment> {
    
    override var identifier: String{ get { return String(describing: MPPaymentMethodsTableViewCell.self) } }
    
    override func setupTableView() {
        self.tableView?.register(cellType: MPPaymentMethodsTableViewCell.self)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        if let paymentCell = cell as? MPPaymentMethodsTableViewCell {
            let payment = itemList?[indexPath.row]
            paymentCell.item = payment
        }
        return cell
    }
}
