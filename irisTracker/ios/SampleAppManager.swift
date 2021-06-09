//
//  SampleAppManager.swift
//  TrainingApp
//
//  Created by Ekam  on 2020-05-04.
//

import Foundation
import UIKit


@objc(SampleAppManager)
class SampleAppManager: RCTEventEmitter {
  

  @objc
  func openIrisApp() {
      DispatchQueue.main.async {
        let vc = TestTrackerViewController(nibName: nil, bundle: nil)
        let navigationVC = UINavigationController(rootViewController: vc)
        navigationVC.modalPresentationStyle = .fullScreen
        navigationVC.setNavigationBarHidden(true, animated: false)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window.rootViewController?.present(navigationVC, animated: true, completion: nil)

      }
    }
  

  
  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
 
  override func supportedEvents() -> [String]! {
     return []
   }
  
  
  
}

