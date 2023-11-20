//
//  ViewController.swift
//  EduNote
//
//  Created by zabojeb" on 19.11.2023.
//  Copyright © 2023 zabojeb. All rights reserved.
//  Learn! Create! Enjoy!
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet var textView: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up event handlers
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange), name: NSTextView.didChangeSelectionNotification, object: textView)
    }
    
    // Save text to a file
    @IBAction func saveDocument(_ sender: Any) {
        let savePanel = NSSavePanel()
        savePanel.allowedFileTypes = ["txt"]
        
        // Display the save panel
        savePanel.begin { (result) -> Void in
            if result.rawValue == NSApplication.ModalResponse.OK.rawValue {
                if let path = savePanel.url {
                    do {
                        // Write the text to the selected file
                        try self.textView.string.write(to: path, atomically: true, encoding: .utf8)
                    } catch {
                        print("Error while saving file: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
    
    // Open a file and load its text
    @IBAction func openDocument(_ sender: Any) {
        let openPanel = NSOpenPanel()
        openPanel.allowedFileTypes = ["txt"]
        
        // Display the open panel
        openPanel.begin { (result) -> Void in
            if result.rawValue == NSApplication.ModalResponse.OK.rawValue {
                if let path = openPanel.url {
                    do {
                        // Read the text from the selected file and set it to the text view
                        let text = try String(contentsOf: path, encoding: .utf8)
                        self.textView.string = text
                    } catch {
                        print("Error while opening file: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
    
    @objc func textDidChange() {
        // Your code to handle text changes
    }
}
