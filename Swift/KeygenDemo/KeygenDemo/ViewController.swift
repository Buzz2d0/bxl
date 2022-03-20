//
//  ViewController.swift
//  KeygenDemo
//
//  Created by whoami on 2022/3/20.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var machineCodeEdit: NSTextField!
    @IBOutlet weak var serialCode: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func onGenerate(_ sender: Any) {
        serialCode.stringValue = (machineCodeEdit.stringValue.data(using: String.Encoding.utf8)?.base64EncodedString(options: .lineLength76Characters))!
    }


}

