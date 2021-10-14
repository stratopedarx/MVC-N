//
//  CommentCell.swift
//  MVC-N
//
//  Created by Sergey Lobanov on 14.10.2021.
//

import UIKit

class CommentCell: UITableViewCell {
    @IBOutlet weak private var label: UILabel!
    @IBOutlet weak private var textView: UITextView!

    func configure(with comment: Comment) {
        self.label.text = comment.name
        self.textView.text = comment.body
    }
}
