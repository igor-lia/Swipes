//
//  ViewController.swift
//  Swipes
//
//  Created by Ігор Ляхович on 04.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let swipeableView: UIView = {
        let view = UIView(frame: CGRect(origin: .init(x: 140, y: 380),
                                        size: CGSize(width: 100.0, height: 100.0)))
        
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 50
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        view.addSubview(swipeableView)
        
        swipeableView.addGestureRecognizer(createSwipeGestureRecognizer(for: .up))
        swipeableView.addGestureRecognizer(createSwipeGestureRecognizer(for: .down))
        swipeableView.addGestureRecognizer(createSwipeGestureRecognizer(for: .left))
        swipeableView.addGestureRecognizer(createSwipeGestureRecognizer(for: .right))
        
        
        let swipeGestureRecognizerDown = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        
        swipeGestureRecognizerDown.direction = .down
        
        swipeableView.addGestureRecognizer(swipeGestureRecognizerDown)
    }
    
    @objc private func didSwipe(_ sender: UISwipeGestureRecognizer) {
        
        var frame = swipeableView.frame
        
        switch sender.direction {
        case .up:
            frame.origin.y -= 50.0
        case .down:
            frame.origin.y += 50.0
        case .left:
            frame.origin.x -= 50.0
        case .right:
            frame.origin.x += 50.0
        default:
            break
        }
        
        UIView.animate(withDuration: 0.5) {
            self.swipeableView.frame = frame
        }
    }
    
    
    private func createSwipeGestureRecognizer(for direction: UISwipeGestureRecognizer.Direction) -> UISwipeGestureRecognizer {
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        
        swipeGestureRecognizer.direction = direction
        
        return swipeGestureRecognizer
    }
    
    
    
}

