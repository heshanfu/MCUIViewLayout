//
//  Layout2View.swift
//  MCLayoutExample
//
//  Created by DION, Luc (MTL) on 2017-02-17.
//  Copyright (c) 2017 Mirego. All rights reserved.
//
import UIKit

protocol Layout2ViewDelegate: class {
}

class Layout2View: UIView {
    weak var delegate: Layout2ViewDelegate?
    private let centerView = UIView()
    
    private let topLeftView = UIView()
    private let topCenterView = UIView()
    private let topRightView = UIView()
    
    private let leftTopView = UIView()
    private let leftCenterView = UIView()
    private let leftBottomView = UIView()
    
    private let bottomLeftView = UIView()
    private let bottomCenterView = UIView()
    private let bottomRightView = UIView()
    
    private let rightTopView = UIView()
    private let rightCenterView = UIView()
    private let rightBottomView = UIView()
    
    init() {
        super.init(frame: .zero)
        
        centerView.backgroundColor = .blue
        addSubview(centerView)
        
        addSquare(topLeftView, color: .green)
        addSquare(topCenterView, color: .yellow)
        addSquare(topRightView, color: .purple)
        
        addSquare(leftTopView, color: .magenta)
        addSquare(leftCenterView, color: .cyan)
        addSquare(leftBottomView, color: .purple)
        
        addSquare(bottomLeftView, color: .black)
        addSquare(bottomCenterView, color: .red)
        addSquare(bottomRightView, color: .gray)
        
        addSquare(rightTopView, color: .black)
        addSquare(rightCenterView, color: .red)
        addSquare(rightBottomView, color: .gray)
    }
    
    fileprivate func addSquare(_ view: UIView, color: UIColor) {
        view.backgroundColor = color
        view.width = 50
        view.height = 50
        addSubview(view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        centerView.width = 200
        centerView.height = 200
        centerView.center = CGPoint(x: 200, y: 300)
        print("topCenterView: \(topCenterView.frame)")
        
        topLeftView.bottomLeft = centerView.topLeft
        topCenterView.bottomCenter = centerView.topCenter
        topRightView.bottomRight = centerView.topRight
        
        leftTopView.topRight = centerView.topLeft
        leftCenterView.centerRight = centerView.centerLeft
        leftBottomView.bottomRight = centerView.bottomLeft
        
        bottomLeftView.topLeft = centerView.bottomLeft
        bottomCenterView.topCenter = centerView.bottomCenter
        bottomRightView.topRight = centerView.bottomRight
        
        rightTopView.topLeft = centerView.topRight
        rightCenterView.centerLeft = centerView.centerRight
        rightBottomView.bottomLeft = centerView.bottomRight
    }
}
