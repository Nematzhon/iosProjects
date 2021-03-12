//
//  AddEmojiCellVC.swift
//  emoji
//
//  Created by Rizayev Nematzhon on 3/11/21.
//

import UIKit

class AddEmojiCellVC: UITableViewCell, UITextFieldDelegate {
    var dataTextField = UITextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(dataTextField)
        initConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initConstraints(){
        dataTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dataTextField.heightAnchor.constraint(equalToConstant: 40),
            dataTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dataTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            dataTextField.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            dataTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
        
    
        
    }
    

    
    
    
}
