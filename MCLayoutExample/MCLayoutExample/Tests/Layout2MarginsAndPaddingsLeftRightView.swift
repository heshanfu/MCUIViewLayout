//
//  Layout2MarginsAndPaddingsLeftRightView.swift
//  MCLayoutExample
//
//  Created by DION, Luc (MTL) on 2017-02-21.
//  Copyright (c) 2017 Mirego. All rights reserved.
//
import UIKit

class Layout2MarginsAndPaddingsLeftRightView: UIView {
    private let contentScrollView = UIScrollView()
    
    private let descriptionLabel = UILabel()
    
    private let noMarginsNoPaddings = BasicView(text: "70x30", color: .black)
    
    private let noMarginsLeftInsetView = BasicView(text: "LI", color: UIColor.red.withAlphaComponent(1.0))
    private let noMarginsRightInsetView = BasicView(text: "RI", color: UIColor.red.withAlphaComponent(0.8))
    private let noMarginsLeftRightInsetView = BasicView(text: "LI-RI", color: UIColor.red.withAlphaComponent(0.6))
    
    private let leftMarginView = BasicView(text: "LM", color: UIColor.blue.withAlphaComponent(1.0))
    private let leftMarginLeftInsetView = BasicView(text: "LM LI", color: UIColor.blue.withAlphaComponent(0.8))
    private let leftMarginRightInsetView = BasicView(text: "LM RI", color: UIColor.blue.withAlphaComponent(0.6))
    private let leftMarginLeftRightInsetView = BasicView(text: "LM LI-RI", color: UIColor.blue.withAlphaComponent(0.4))
    
    private let rigthMarginView = BasicView(text: "RM", color: UIColor.green.withAlphaComponent(1))
    private let rigthMarginLeftInsetView = BasicView(text: "RM LI", color: UIColor.green.withAlphaComponent(0.8))
    private let rigthMarginRightInsetView = BasicView(text: "RM RI", color: UIColor.green.withAlphaComponent(0.6))
    private let rigthMarginLeftRightInsetView = BasicView(text: "RM LI-RI", color: UIColor.green.withAlphaComponent(0.4))
    
    private let leftRightMarginsView = BasicView(text: "LM-RM", color: UIColor.purple.withAlphaComponent(1))
    private let leftRightMarginsLeftInsetView = BasicView(text: "LM-RM LI", color: UIColor.purple.withAlphaComponent(0.8))
    private let leftRightMarginsRightInsetView = BasicView(text: "LM-RM RI", color: UIColor.purple.withAlphaComponent(0.6))
    private let leftRightMarginsLeftRightInsetView = BasicView(text: "LM-RM LI-RI", color: UIColor.purple.withAlphaComponent(0.4))
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        contentScrollView.backgroundColor = .yellow
        addSubview(contentScrollView)
        
        descriptionLabel.text = "In this test the topLeft coordinates and the bottomRight have been set.\nMargins and Insets always have a value of 10\nL=Left, R=Right, M=Margin, I=Inset"
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        contentScrollView.addSubview(descriptionLabel)
        
        addView(noMarginsNoPaddings)
        
        // No margins
        addView(noMarginsLeftInsetView)
        addView(noMarginsRightInsetView)
        addView(noMarginsLeftRightInsetView)
        
        // Left margin
        addView(leftMarginView)
        addView(leftMarginLeftInsetView)
        addView(leftMarginRightInsetView)
        addView(leftMarginLeftRightInsetView)
        
        // Right margin
        addView(rigthMarginView)
        addView(rigthMarginLeftInsetView)
        addView(rigthMarginRightInsetView)
        addView(rigthMarginLeftRightInsetView)
        
        // Left and right margins
        addView(leftRightMarginsView)
        addView(leftRightMarginsLeftInsetView)
        addView(leftRightMarginsRightInsetView)
        addView(leftRightMarginsLeftRightInsetView)
    }
    
    fileprivate func addView(_ view: BasicView) {
        view.layout2.height(30).width(70)
        contentScrollView.addSubview(view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let leftPosition: CGFloat = 0
        
        contentScrollView.layout2.topLeft(CGPoint(x: 0, y: 0)).width(width).height(height).topInset(64)
        
        descriptionLabel.size = descriptionLabel.sizeThatFits(CGSize(width: width, height: .greatestFiniteMagnitude))
        descriptionLabel.layout2.topLeft(CGPoint(x: leftPosition, y: 10))
        
        // No margins
        let rightPosition: CGFloat = 70
        var index = 0
        //var nextBottomPosition: CGFloat = descriptionLabel.bottom + 30
        noMarginsNoPaddings.layout2.topLeft(descriptionLabel.bottomLeft).bottomRight(x: descriptionLabel.bottom + 30, y: rightPosition)
        
        noMarginsLeftInsetView.layout2.topLeft(noMarginsNoPaddings.bottomLeft).bottomRight(x: noMarginsNoPaddings.bottom + 30, y: rightPosition).leftInset(10)
        noMarginsRightInsetView.layout2.topLeft(noMarginsLeftInsetView.bottomLeft).bottomRight(x: noMarginsLeftInsetView.bottom + 30, y: rightPosition).rightInset(10)
        noMarginsLeftRightInsetView.layout2.topLeft(noMarginsRightInsetView.bottomLeft).bottomRight(x: noMarginsRightInsetView.bottom + 30, y: rightPosition).leftInset(10).rightInset(10)
//
//        // Left margin
//        leftMarginView.layout2.top(noMarginsLeftRightInsetView.bottom + 5).left(leftPosition).width(70).leftMargin(10)
//        leftMarginLeftPaddingView.layout2.top(leftMarginView.bottom).left(leftPosition).width(70).leftMargin(10).leftInset(10)
//        leftMarginRightInsetView.layout2.top(leftMarginLeftInsetView.bottom).left(leftPosition).width(70).leftMargin(10).RightInset(10)
//        leftMarginLeftRightInsetView.layout2.top(leftMarginRightInsetView.bottom).left(leftPosition).width(70).leftMargin(10).leftInset(10).RightInset(10)
//        
//        // Right margin
//        rigthMarginView.layout2.top(leftMarginLeftRightInsetView.bottom + 5).left(leftPosition).width(70).rightMargin(10)
//        rigthMarginLeftInsetView.layout2.top(rigthMarginView.bottom).left(leftPosition).width(70).rightMargin(10).leftInset(10)
//        rigthMarginRightInsetView.layout2.top(rigthMarginleftInsetView.bottom).left(leftPosition).width(70).rightMargin(10).RightInset(10)
//        rigthMarginLeftRightInsetView.layout2.top(rigthMarginRightInsetView.bottom).left(leftPosition).width(70).rightMargin(10).leftInset(10).RightInset(10)
//        
//        // Left and right margins
//        leftRightMarginsView.layout2.top(rigthMarginLeftRightInsetView.bottom + 5).left(leftPosition).width(70).leftMargin(10).rightMargin(10)
//        leftRightMarginsleftInsetView.layout2.top(leftRightMarginsView.bottom).left(leftPosition).width(70).leftMargin(10).rightMargin(10).leftInset(10)
//        leftRightMarginsRightInsetView.layout2.top(leftRightMarginsleftInsetView.bottom).left(leftPosition).width(70).leftMargin(10).rightMargin(10).RightInset(10)
//        leftRightMarginsLeftRightInsetView.layout2.top(leftRightMarginsRightInsetView.bottom).left(leftPosition).width(70).leftMargin(10).rightMargin(10).leftInset(10).RightInset(10)
        
        contentScrollView.contentSize = CGSize(width: width, height: leftRightMarginsLeftRightInsetView.bottom)
        contentScrollView.contentInset = UIEdgeInsets.zero
    }
}
