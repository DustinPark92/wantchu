//
//  MailExtension.swift
//  wantchu
//
//  Created by Dustin on 2020/08/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit
import MessageUI

extension SideMenuListController : MFMailComposeViewControllerDelegate {
    
    
    func showMailView() {
        
        if MFMailComposeViewController.canSendMail() {
            let mailComposerVC = MFMailComposeViewController()
            mailComposerVC.mailComposeDelegate = self
            mailComposerVC.setToRecipients(["p4569zz@gmail.com"])
            
            
            self.present(mailComposerVC, animated: true, completion: {() -> Void in })
        }
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Swift.Error?){
        controller.dismiss(animated: true) { () -> Void in }
        
    }
    
    
    
    
    
}
