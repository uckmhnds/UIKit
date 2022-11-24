//
//  ViewController.swift
//  Gestures
//
//  Created by Abdurrahman Gazi Yavuz on 11/14/22.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    //
    // RotationGestureRecognizer
    //
    
    @objc private func screenEdgePanGestureAction(_ gesture: UIScreenEdgePanGestureRecognizer) {
        
        switch gesture.state {
            
        case .possible:
            print("screenEdgePanGestureAction possible")
            break
        case .began:
            print("screenEdgePanGestureAction began")
            setScreenEdgePanLabel("<")
            setGestureLabel(with: gesture)
            break
        case .changed:
            print("screenEdgePanGestureAction changed")
            break
        case .ended:
            print("screenEdgePanGestureAction ended")
            break
        case .cancelled:
            print("screenEdgePanGestureAction cancelled")
            break
        case .failed:
            print("screenEdgePanGestureAction failed")
        @unknown default:
            break
            
        }
        
    }
    
    private lazy var screenEdgePanGesture: UIScreenEdgePanGestureRecognizer = {
        
        let gesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgePanGestureAction(_:)))
        gesture.name = "UIScreenEdgePanGestureRecognizer"
        gesture.edges = .right
        return gesture
        
    }()
    
    //
    // RotationGestureRecognizer
    //
    
    @objc private func rotationGestureAction(_ gesture:  UIRotationGestureRecognizer) {
        
        switch gesture.state {
            
        case .possible:
            print("rotationGestureAction possible")
            break
        case .began:
            print("rotationGestureAction began")
            setGestureLabel(with: gesture)
            setRotationLabel(gesture.rotation, gesture.velocity)
            break
        case .changed:
            print("rotationGestureAction changed")
            break
        case .ended:
            print("rotationGestureAction ended")
            //setDefaultLabels()
            break
        case .cancelled:
            print("rotationGestureAction cancelled")
            break
        case .failed:
            print("rotationGestureAction failed")
        @unknown default:
            break
            
        }
        
    }
    
    private lazy var rotationGesture: UIRotationGestureRecognizer = {
        
        let gesture = UIRotationGestureRecognizer(target: self, action: #selector(rotationGestureAction(_:)))
        gesture.name = "UIRotationGestureRecognizer"
        
        return gesture
        
    }()
    
    //
    // SwipeGestureRecognizer Left
    //
    
    @objc private func leftSwipeGestureAction(_ gesture: UISwipeGestureRecognizer) {
        
        switch gesture.state {
            
        case .possible:
            print("swipeGestureAction possible")
            break
        case .began:
            print("swipeGestureAction began")
            break
        case .changed:
            print("swipeGestureAction changed")
            break
        case .ended:
            print("swipeGestureAction ended")
            setGestureLabel(with: gesture)
            setSwipeLabel("<<----")
            break
        case .cancelled:
            print("swipeGestureAction cancelled")
            break
        case .failed:
            print("swipeGestureAction failed")
            break
        @unknown default:
            break
            
        }
        
    }
    
    private lazy var leftSwipeGesture: UISwipeGestureRecognizer = {
        
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipeGestureAction(_:)))
        gesture.name = "UISwipeGestureRecognizer"
        gesture.direction = .left
        
        return gesture
        
    }()
    
    //
    // SwipeGestureRecognizer Right
    //
    
    @objc private func rightSwipeGestureAction(_ gesture: UISwipeGestureRecognizer) {
        
        switch gesture.state {
            
        case .possible:
            print("swipeGestureAction possible")
            break
        case .began:
            print("swipeGestureAction began")
            break
        case .changed:
            print("swipeGestureAction changed")
            break
        case .ended:
            print("swipeGestureAction ended")
            setGestureLabel(with: gesture)
            setSwipeLabel("---->>")
            break
        case .cancelled:
            print("swipeGestureAction cancelled")
            break
        case .failed:
            print("swipeGestureAction failed")
            break
        @unknown default:
            break
            
        }
        
    }
    
    private lazy var rightSwipeGesture: UISwipeGestureRecognizer = {
        
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(rightSwipeGestureAction(_:)))
        gesture.name = "UISwipeGestureRecognizer"
        gesture.direction = .right
        
        return gesture
        
    }()
    
    //
    // PinchGestureRecognizer
    //
    
    @objc private func pinchGestureAction(_ gesture: UIPinchGestureRecognizer) {
        
        switch gesture.state {
            
        case .possible:
            print("pinchGestureAction possible")
            break
        case .began:
            print("pinchGestureAction began")
            setGestureLabel(with: gesture)
            setPinchLabel(gesture.scale, gesture.velocity)
            break
        case .changed:
            print("pinchGestureAction changed")
            break
        case .ended:
            print("pinchGestureAction ended")
            //setDefaultLabels()
            break
        case .cancelled:
            print("pinchGestureAction cancelled")
            break
        case .failed:
            print("pinchGestureAction failed")
            break
        @unknown default:
            break
            
        }
        
    }
    
    private lazy var pinchGesture: UIPinchGestureRecognizer = {
        
        let gesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchGestureAction(_:)))
        gesture.name = "UIPinchGestureRecognizer"
        
        return gesture
        
    }()
    
    //
    // PanGestureRecognizer
    //
    
    @objc private func panGestureAction(_ gesture: UIPanGestureRecognizer) {
        
        switch gesture.state{
            
        case .possible:
            print("panGesture possible")
            break
        case .began:
            print("panGesture began")
            setGestureLabel(with: gesture)
            break
        case .changed:
            print("panGesture changed")
            setLocationLabel(with: gesture)
            break
        case .ended:
            print("panGesture ended")
            setDefaultLabels()
            break
        case .cancelled:
            print("panGesture cancelled")
            break
        case .failed:
            print("panGesture failed")
            break
        @unknown default:
            break
            
        }
        
    }
    
    private lazy var panGesture: UIPanGestureRecognizer = {
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))
        gesture.name = "UIPanGestureRecognizer"
        
        return gesture
        
    }()
    
    //
    // LongPressGestureRecognizer
    //
    
    @objc private func longPressGestureAction(_ gesture: UILongPressGestureRecognizer) {
        
        switch gesture.state{
            
        case .possible:
            print("longPressGesture possible")
            break
        case .began:
            print("longPressGesture began")
            setGestureLabel(with: gesture)
            setLocationLabel(with: gesture)
            break
        case .changed:
            print("longPressGesture changed")
            break
        case .ended:
            print("longPressGesture ended")
            setDefaultLabels()
            break
        case .cancelled:
            print("longPressGesture cancelled")
            break
        case .failed:
            print("longPressGesture failed")
            break
        @unknown default:
            break
            
        }
        
    }
    
    private lazy var longPressGesture: UILongPressGestureRecognizer = {
        
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressGestureAction(_:)))
        gesture.name = "UILongPressGestureRecognizer"
        
        return gesture
    }()
    
    //
    // TapGestureRecognizer
    //
    
    @objc private func tapGestureAction(_ gesture: UITapGestureRecognizer) -> Void {
        
        switch gesture.state {
            
        case .began:
            print("tapGesture began")
            break
        case .changed:
            print("tapGesture changed")
            break
        case .possible:
            print("tapGesture possible")
            break
        case .ended:
            print("tapGesture ended")
            
            setGestureLabel(with: gesture)
            setLocationLabel(with: gesture)
            
            break
        case .cancelled:
            print("tapGesture cancelled")
            break
        case .failed:
            print("tapGesture failed")
            break
        @unknown default:
            break
            
        }
        
    }
    
    private lazy var tapGesture: UITapGestureRecognizer = {
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction(_:)))
        gesture.name = "UITapGestureRecognizer"
        
        return gesture
        
    }()
    
    //
    // DoubleTapGestureRecognizer
    //
    
    @objc private func doubleTapGestureAction(_ gesture: UITapGestureRecognizer) -> Void {
        
        switch gesture.state {
            
        case .began:
            print("doubleTapGesture began")
            break
        case .changed:
            print("doubleTapGesture changed")
            break
        case .possible:
            print("doubleTapGesture possible")
            break
        case .ended:
            print("doubleTapGesture ended")
            setGestureLabel(with: gesture)
            setLocationLabel(with: gesture)
            break
        case .cancelled:
            print("doubleTapGesture cancelled")
            break
        case .failed:
            print("doubleTapGesture failed")
            break
        @unknown default:
            break
            
        }
        
    }
    
    private lazy var doubleTapGesture: UITapGestureRecognizer = {
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(doubleTapGestureAction(_:)))
        gesture.numberOfTapsRequired = 2
        gesture.name = "UITapGestureRecognizer"
        return gesture
        
    }()
    
    //
    // Monitoring
    //
    
    private lazy var gestureLabel: UILabel = {
        let label = UILabel()
        label.text = "-"
        label.textColor = .systemRed
        return label
    }()
    
    private lazy var propertyLabel: UILabel = {
        let label = UILabel()
        label.text = "-"
        label.textColor = .systemYellow
        return label
    }()
    
    private lazy var mainStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [gestureLabel,
                                                      propertyLabel])
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private func applyConstraints(){
        
        let mainStackConstraints = [
            mainStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -600)
        ]
        
        NSLayoutConstraint.activate(mainStackConstraints)
        
    }
    
    private func setScreenEdgePanLabel(_ direction: String) {
        
        propertyLabel.text = direction
        
    }
    
    private func setSwipeLabel(_ swipeDirection: String) {
        
        propertyLabel.text = swipeDirection
        
    }
    
    private func setPinchLabel(_ gestureScale: CGFloat, _ gestureVelocity: CGFloat) {
        
        let text = "Scal:\t\(String(format: "%.1f", gestureScale)), Vel:\t\(String(format: "%.1f", gestureVelocity))"
        
        propertyLabel.text = text
        
    }
    
    private func setRotationLabel(_ gestureRotation: CGFloat, _ gestureVelocity: CGFloat) {
        
        let text = "Rot:\t\(String(format: "%.1f", gestureRotation)), Vel:\t\(String(format: "%.1f", gestureVelocity))"
        
        propertyLabel.text = text
        
    }
    
    private func setLocationLabel(with gesture: UIGestureRecognizer) {
        
        let gestureLocation = gesture.location(in: view)
        
        let x = gestureLocation.x
        let y = gestureLocation.y
        
        let text = "X:\t\(String(format: "%.1f", x)), Y:\t\(String(format: "%.1f", y))"
        
        propertyLabel.text = text
        
    }
    
    private func setGestureLabel(with gesture: UIGestureRecognizer) {
        
        let name = gesture.name
        
        gestureLabel.text = name
        
    }
    
    private func setDefaultLabels() {
        
        propertyLabel.text = "-"
        gestureLabel.text = "-"
        
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addGestureRecognizer(tapGesture)
        
        view.addGestureRecognizer(doubleTapGesture)
        
        view.addGestureRecognizer(panGesture)
        
        view.addGestureRecognizer(longPressGesture)
        
        view.addGestureRecognizer(pinchGesture)
        
        view.addGestureRecognizer(leftSwipeGesture)
        
        view.addGestureRecognizer(rightSwipeGesture)
        
        view.addGestureRecognizer(rotationGesture)
        
        view.addGestureRecognizer(screenEdgePanGesture)
        
        tapGesture.delegate = self
        doubleTapGesture.delegate = self
        panGesture.delegate = self
        longPressGesture.delegate = self
        pinchGesture.delegate = self
        leftSwipeGesture.delegate = self
        rightSwipeGesture.delegate = self
        rotationGesture.delegate = self
        screenEdgePanGesture.delegate = self
        
        view.addSubview(mainStack)
        
        applyConstraints()
        
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        // Don't recognize a single tap until a double-tap fails.
        
        if gestureRecognizer == self.tapGesture && otherGestureRecognizer == self.doubleTapGesture {
            return true
        }
        
        return false
        
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        // Don't recognize a Pan until a Swipe fails.
        
        if gestureRecognizer == self.leftSwipeGesture || gestureRecognizer == self.rightSwipeGesture && otherGestureRecognizer == self.panGesture {
            return true
        }
        
        // Don't recognize a Swipe until a ScreenEdgePan fails
        
        if gestureRecognizer == self.screenEdgePanGesture && otherGestureRecognizer == self.leftSwipeGesture || otherGestureRecognizer == self.rightSwipeGesture {
            return true
        }
        
        // Don't recognize a Pan until a ScreenEdgePan fails
        
        if gestureRecognizer == self.screenEdgePanGesture && otherGestureRecognizer == self.panGesture {
            return true
        }
        
        // Don't recognize a Pan until a ScreenEdgePan fails
        
        if gestureRecognizer == self.screenEdgePanGesture && otherGestureRecognizer == self.tapGesture {
            return true
        }
        
        return false
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        // If either gesture recognizer is a long press, do not allow
        // simultaneous recognition.
        
        if gestureRecognizer is UILongPressGestureRecognizer ||
            otherGestureRecognizer is UILongPressGestureRecognizer {
            
            return false
            
        }
        
        return true
    }

}
