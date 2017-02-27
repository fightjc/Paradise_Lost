//
//  AlertManager.swift
//  Paradise Lost
//
//  Created by Jason Chen on 5/27/16.
//  Copyright © 2016 Jason Chen. All rights reserved.
//

import Foundation
import UIKit

class AlertManager {
    /**
        show an alert view with one button "I see"
     */
    class func showTips(viewController: UIViewController,
                        message: String,
                        handler:(UIAlertAction -> Void)?) {
        let alertCtrl = UIAlertController(title: LanguageManager.getAlertString(forKey: "tips"),
                                          message: message, preferredStyle: .Alert)
        let iSeeAction = UIAlertAction(title: LanguageManager.getAlertString(forKey: "isee"),
                                       style: .Default, handler: handler)
        alertCtrl.addAction(iSeeAction)
        
        viewController.presentViewController(alertCtrl, animated: true, completion: nil)
    }
    
    /**
        show an alert view with button "I see" & "continue"
     */
    class func showTipsWithContinue(viewController: UIViewController,
                                    message: String,
                                    handler:(UIAlertAction -> Void)?,
                                    cHandler:(UIAlertAction -> Void)?) {
        let alertCtrl = UIAlertController(title: LanguageManager.getAlertString(forKey: "tips"),
                                          message: message, preferredStyle: .Alert)
        let iSeeAction = UIAlertAction(title: LanguageManager.getAlertString(forKey: "isee"),
                                       style: .Default, handler: handler)
        let continueAction = UIAlertAction(title: LanguageManager.getAlertString(forKey: "continue"),
                                           style: .Destructive, handler: cHandler)
        alertCtrl.addAction(iSeeAction)
        alertCtrl.addAction(continueAction)
        
        viewController.presentViewController(alertCtrl, animated: true, completion: nil)
    }
    
    /**
        show an action sheet with button "open", "move", "delete" and "cancel" in FileExplorer
     */
    class func showActionSheetToHandleFile(viewController: UIViewController,
                                           title: String,
                                           message: String,
                                           openHDL: ((UIAlertAction) -> Void)?,
                                           moveHDL: ((UIAlertAction) -> Void)?,
                                           deleteHDL: ((UIAlertAction) -> Void)?) {
        let alertCtrl = UIAlertController(title: title, message: message, preferredStyle: .ActionSheet)
        let openAction = UIAlertAction(title: LanguageManager.getAlertString(forKey: "open"), style: .Default, handler: openHDL)
        let moveAction = UIAlertAction(title: LanguageManager.getAlertString(forKey: "move"), style: .Default, handler: moveHDL)
        let deleteAction = UIAlertAction(title: LanguageManager.getAlertString(forKey: "delete"), style: .Destructive, handler: deleteHDL)
        let cancelAction = UIAlertAction(title: LanguageManager.getAlertString(forKey: "cancel"), style: .Cancel, handler: nil)
        alertCtrl.addAction(cancelAction)
        if openHDL != nil {
            alertCtrl.addAction(openAction)
        }
        alertCtrl.addAction(moveAction)
        alertCtrl.addAction(deleteAction)
        
        viewController.presentViewController(alertCtrl, animated: true, completion: nil)
    }
}
