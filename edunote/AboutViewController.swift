//
//  AboutViewController.swift
//  EduNote
//
//  Created by zabojeb" on 20.11.2023.
//  Copyright © 2023 zabojeb. All rights reserved.
//

import Cocoa

class AboutViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Other processing and interface settings
    }

    // Open an EduNote GitHub link
    @IBAction func openMyGitHub(_ sender: Any){
        let gitUrl = URL(string: "https://github.com/zabojeb/EduNote")!
        if NSWorkspace.shared.open(gitUrl) {
            print("Link was successfully opened")
            
        }
    }
}
