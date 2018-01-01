//
//  StackViewController.swift
//  Demo-AutoLayout
//
//  Created by mervin on 2017/12/31.
//  Copyright © 2017年 mervin. All rights reserved.
//

import UIKit

class StackViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addEntry(_ sender: Any) {
        
        let stack = stackView!
        let index = stack.arrangedSubviews.count - 1
        let addView = stack.arrangedSubviews[index]
        
        let scroll = scrollView!
        let offset = CGPoint(x: scroll.contentOffset.x,
                             y: scroll.contentOffset.y + addView.frame.size.height)
        
        let newView = createEntry()
        newView.isHidden = true
        stack.insertArrangedSubview(newView, at: index)
        
        UIView.animate(withDuration: 0.25) {
            newView.isHidden = false
            scroll.contentOffset = offset
        }
    }
    
    @objc func deleteStackView(sender: UIButton) {
        if let view = sender.superview {
            UIView.animate(withDuration: 0.25, animations: {
                view.isHidden = true
            }, completion: { (success) in
                view.removeFromSuperview()
            })
        }
    }
    
    private func createEntry() -> UIView {
        let date = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none)
        let number = "\(randomHexQuad())-\(randomHexQuad())-\(randomHexQuad())-\(randomHexQuad())"
        
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .equalCentering
        stack.spacing = 8
        
        let dateLabel = UILabel()
        dateLabel.text = date
        dateLabel.font = UIFont.preferredFont(forTextStyle: .body)

        let numberLabel = UILabel()
        numberLabel.text = number
        numberLabel.textAlignment = .left
        numberLabel.font = UIFont.preferredFont(forTextStyle: .headline)

        let deleteButton = UIButton(type: .roundedRect)
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteStackView(sender:)), for: .touchUpInside)

        stack.addArrangedSubview(dateLabel)
        stack.addArrangedSubview(numberLabel)
        stack.addArrangedSubview(deleteButton)
        
        return stack
        
    }

    private func randomHexQuad() -> String {
        return NSString(format: "%X%X%X%X",
                        arc4random() % 16,
                        arc4random() % 16,
                        arc4random() % 16,
                        arc4random() % 16
            ) as String
    }
}

