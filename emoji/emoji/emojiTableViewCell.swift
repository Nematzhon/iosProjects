//
//  emojiTableViewCell.swift
//  emoji
//
//  Created by Rizayev Nematzhon on 3/3/21.
//

import UIKit

class emojiTableViewCell: UITableViewCell {
    var emojiView = UILabel()
    var titleView = UILabel()
    var textView = UILabel()
    override init(style:UITableViewCell.CellStyle,reuseIdentifier: String?){
        super.init(style:style,reuseIdentifier:reuseIdentifier)

        addSubview(emojiView)
        addSubview(titleView)
        addSubview(textView)
        setConstraintEmojiView()
        setConstraintTitleView()
        setConstraintTextView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    func setConstraintEmojiView(){
        emojiView.translatesAutoresizingMaskIntoConstraints = false
        emojiView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        emojiView.leadingAnchor.constraint(equalTo: leadingAnchor ,constant: 15).isActive = true
        
    }
    func setConstraintTitleView(){
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        titleView.leadingAnchor.constraint(equalTo: emojiView.leadingAnchor ,constant: 30).isActive = true
        
    }
    func setConstraintTextView(){
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: titleView.topAnchor, constant: 15).isActive = true
        textView.leadingAnchor.constraint(equalTo: emojiView.leadingAnchor ,constant: 30).isActive = true
    }
    
    

}
