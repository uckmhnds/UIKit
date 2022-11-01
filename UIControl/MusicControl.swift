//
//  MusicControl.swift
//  Button
//
//  Created by Abdurrahman Gazi Yavuz on 10/31/22.
//

import UIKit

class MusicControl: UIStackView {
    
    enum State {
        case play
        case pause
        case stop
    }
    
    private lazy var state: State = State.stop {
        
        didSet {
            playPauseButton.setNeedsUpdateConfiguration()
            stopButton.setNeedsUpdateConfiguration()
        }
        
    }
    
    private lazy var isShuffle: Bool = false
    
    private lazy var volume: Float = 70.0
    
    private lazy var shuffleButton: UIButton = {
        
        let action = UIAction { _ in
            
            self.isShuffle.toggle()
            
        }
        
        let button = UIButton(type: .system, primaryAction: action)
        
        button.setImage(UIImage(systemName: "shuffle"), for: [])
        
        button.changesSelectionAsPrimaryAction = true
        
        return button
        
    }()
    
    private lazy var prevButton: UIButton = {
        
        let action = UIAction { _ in
            
            print("prevDidTap")
            
        }
        
        let button = UIButton(frame: .zero, primaryAction: action)
        button.setImage(UIImage(systemName: "backward.fill"), for: [])
        button.backgroundColor = .systemBackground
        
        return button
        
    }()
    
    private lazy var playPauseButton: UIButton = {
        
        let action = UIAction { _ in
            if self.state == State.play {
                self.state = State.pause
            }else{
                self.state = State.play
            }
        }
        
        let button = UIButton(primaryAction: action)
        
        button.configurationUpdateHandler = {
            
            [unowned self] button in

            var config                          = UIButton.Configuration.gray()
            config.background.backgroundColor   = .systemBackground
            config.image                        = state == State.pause || state == State.stop ? UIImage(systemName: "play.fill") : UIImage(systemName: "pause.fill")
            
            button.configuration                = config
            
        }
        
        button.backgroundColor = .systemBackground
        
        return button
        
    }()
    
    @objc func touchDown() {
        print("touchDown")
    }
    
    @objc func touchUpInside() {
        print("touchUpInside")
        
    }
    
    @objc func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        
        switch gestureReconizer.state {
            
        case .possible:
            print("possible")
        case .began:
            print("began")
        case .changed:
            print("changed")
        case .ended:
            print("ended")
        case .cancelled:
            print("cancelled")
        case .failed:
            print("failed")
        @unknown default:
            print("default")
        }
    }
    
    #warning("Next track / Forwarding implementation")
    
    private lazy var forwardButton: UIButton = {
        
        let button = UIButton()
        
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
        button.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
        
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        
        button.addGestureRecognizer(gestureRecognizer)
        
        button.setImage(UIImage(systemName: "forward.fill"), for: [])
        button.backgroundColor = .systemBackground
        
        return button
        
    }()
    
    private lazy var stopButton: UIButton = {
        
        let action = UIAction { _ in
            
            self.state = State.stop
            
        }
        
        let button = UIButton(primaryAction: action)
        
        button.configurationUpdateHandler = {
            
            [unowned self] button in
            
            var config                          = UIButton.Configuration.plain()
            config.image                        = UIImage(systemName: "stop.fill")
            config.background.backgroundColor   = .systemBackground
            config.baseForegroundColor          = state == State.stop ? UIColor.systemGray : UIColor.systemBlue
            button.configuration                = config
            
        }
        
        return button
        
    }()
    
    private lazy var subStackView: UIStackView = {
        
            let view = UIStackView(arrangedSubviews: [shuffleButton, prevButton, playPauseButton, forwardButton, stopButton])
            view.translatesAutoresizingMaskIntoConstraints = false
            view.isLayoutMarginsRelativeArrangement = true
            view.alignment = .center
            view.axis = .horizontal
            view.spacing = 12
            view.distribution = .fillEqually
            return view
        
    }()
    
    @objc private func sliderValueDidChange() {
        volume = slider.value
        print(volume)
    }
    
    private lazy var slider: UISlider = {
        let slider = UISlider()
        slider.addTarget(self, action: #selector(sliderValueDidChange), for: .valueChanged)
//        slider.backgroundColor = .red
        slider.minimumValueImage = UIImage(systemName: "speaker")
        slider.maximumValueImage = UIImage(systemName: "speaker.wave.3")
        slider.minimumTrackTintColor = .systemBlue
        slider.maximumTrackTintColor = .systemGray
//        slider.translatesAutoresizingMaskIntoConstraints = true
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 70
        slider.isContinuous = true
        return slider
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        isLayoutMarginsRelativeArrangement = true
        alignment = .center
        axis = .vertical
        spacing = 0
//        distribution = .fillEqually
        
        addArrangedSubview(subStackView)
        addArrangedSubview(slider)
        
        slider.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        slider.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
