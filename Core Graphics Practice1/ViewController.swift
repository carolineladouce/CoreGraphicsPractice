//
//  ViewController.swift
//  Core Graphics Practice1
//
//  Created by Caroline LaDouce on 9/23/21.
//


// Edit Constraints and colors


import UIKit

class ViewController: UIViewController {
    
    let counterView = CounterView()
    let counterLabel = UILabel()
    let sampleButton1 = SamplePushButton()
    var sampleButton2 = SamplePushButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let view = UIView()
        
        view.backgroundColor = UIColor.white
        
        
        // Setup CounterView
        view.addSubview(counterView)
        counterView.backgroundColor = UIColor.clear
        counterView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add constraints
        counterView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        counterView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        counterView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        counterView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        
        // Set up counterLabel
        view.addSubview(counterLabel)
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        
        counterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        counterLabel.centerYAnchor.constraint(equalTo: counterView.centerYAnchor).isActive = true
        
        counterLabel.textColor = UIColor.black
        counterLabel.text = "\(counterView.counter)"
        counterLabel.textAlignment = .center
        
        
        // Set up the plus button/sampleButton1
        view.addSubview(sampleButton1)
        sampleButton1.isAddButton = true
        sampleButton1.translatesAutoresizingMaskIntoConstraints = false
        
        // Add constraints
        sampleButton1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sampleButton1.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 75).isActive = true
        sampleButton1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        sampleButton1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        // Hookup the touch handler func
        sampleButton1.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)
        
        
        // Set up minus button/sampleButton2
        view.addSubview(sampleButton2)
        sampleButton2.isAddButton = false
        sampleButton2.translatesAutoresizingMaskIntoConstraints = false
        
        // Add constraints
        sampleButton2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sampleButton2.topAnchor.constraint(equalTo: sampleButton1.bottomAnchor, constant: 50).isActive = true
        sampleButton2.widthAnchor.constraint(equalToConstant: 50).isActive = true
        sampleButton2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // Hookup the touch handler func
        sampleButton2.addTarget(self, action: #selector(minusButtonPressed), for: .touchUpInside)
        
        
        
        self.view = view
    } // End viewDidLoad
    
    
    // TOUCH HANDLERS
    @objc func plusButtonPressed() {
        counterView.counter += 1
        counterLabel.text = String(counterView.counter)
    }
    
    
    @objc func minusButtonPressed() {
        counterView.counter -= 1
        counterLabel.text = String(counterView.counter)
    }
    
    
}

