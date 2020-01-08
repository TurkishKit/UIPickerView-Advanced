//
//  ViewController.swift
//  UIPickerView-Advanced
//
//  Created by Can Balkaya on 1/8/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var textField: UITextField!
    let picker = UIPickerView()
    
    let source = ["iPhone", "iPad", "Mac", "Apple Watch", "Apple TV", "iPod"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createToolbar()
        
        picker.delegate = self
        picker.dataSource = self
        picker.backgroundColor = .black
        
        textField.inputView = picker
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return source.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         return source[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = source[row]
    }
    
    func createToolbar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.barTintColor = .black
        toolBar.tintColor = .white
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action:    #selector(ViewController.dismissKeyboard))
        toolBar.setItems([doneButton], animated: false)
        
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel

        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }

        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Palatino", size: 17)
        label.text = source[row]

        return label
    }
}
