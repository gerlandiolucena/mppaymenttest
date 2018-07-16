//
//  MPPaymentMethodsDataSource.swift
//  MPPaymentSelection
//
//  Created by Gerlandio Da Silva Lucena on 14/07/2018.
//  Copyright © 2018 GerlandioLucena. All rights reserved.
//

import UIKit
import Reusable

class MPCardIssuerDataSource: BaseItemDataSource<MPCardIssuer> {
    
    override var identifier: String{ get { return String(describing: MPCardIssuersTableViewCell.self) } }
    
    override func setupTableView() {
        self.tableView?.register(cellType: MPCardIssuersTableViewCell.self)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        if let cardIssuerCell = cell as? MPCardIssuersTableViewCell {
            let cardIssuer = itemList?[indexPath.row]
            cardIssuerCell.item = cardIssuer
        }
        return cell
    }
}
