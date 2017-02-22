//
//  MenuViewController.swift
//  MCLayoutExample
//
//  Created by Luc Dion on 2016-09-03.
//  Copyright © 2016 Mirego. All rights reserved.
//
import Foundation

enum Page: Int {
    case basicPositionning = 0
    case layout2
    case layout2ChainedLayout
    case layout2MarginsAndPaddingLeftWidth
    case layout2MarginsAndPaddingLeftRight
    case count
    
    var text: String {
        switch self {
        case .basicPositionning:                 return "Yoga Test"
        case .layout2:                           return "Layout 2 - Position Direct access"
        case .layout2ChainedLayout:              return "Layout 2 - Chained Layout"
        case .layout2MarginsAndPaddingLeftWidth: return "Layout 2 - Test margings and paddings - Left+Width"
        case .layout2MarginsAndPaddingLeftRight: return "Layout 2 - Test margings and paddings - Left+Right"
        default:
            assert(false)
            return "Unknown"
        }
    }
}

class MenuViewController: UIViewController {
    fileprivate var mainView: MenuView {
        return self.view as! MenuView
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = MenuView()
        mainView.delegate = self
    }
}

// MARK: MenuViewDelegate
extension MenuViewController: MenuViewDelegate {
    func didSelect(page: Page) {
        var controller: UIViewController?
        
        switch page {
        case .basicPositionning:
            controller = YogoTestViewController()
        case .layout2:
            controller = Layout2ViewController()
        case .layout2ChainedLayout:
            controller = Layout2ChainedLayoutViewController()
        case .layout2MarginsAndPaddingLeftWidth:
            controller = Layout2MarginsAndPaddingsLeftWidthViewController()
        case .layout2MarginsAndPaddingLeftRight:
            controller = Layout2MarginsAndPaddingsLeftRightViewController()
        default:
            assert(false)
            break
        }
        
        if let controller = controller {
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
