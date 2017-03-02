//
//  ViewController.swift
//  DemoDeviceID
//
//  Created by Prabin K Datta on 02/03/17.
//  Copyright © 2017 Prabin K Datta. All rights reserved.
//

import UIKit
import AdSupport

class ViewController: UIViewController {

    @IBOutlet weak var m_UUIDLbl: UILabel!
    @IBOutlet weak var m_VendorIDLbl: UILabel!
    @IBOutlet weak var m_AdverIDLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
         * There are normally 4 types of Device IDs:
         */
        
        /*
         * 1. Unique Device IDentifier, UDID:
         * Not Available from iOS 6 and on-wards. It's unique for each device against any app from same or different vendor.
         */
        //let strUDID = UIDevice.current.uniqueIdentifier // deprecated in iOS 6
        
        /*
         * 2. Universally Unique IDentifier, UUID:
         * UUIDs (Universally Unique Identifiers), also known as GUIDs (Globally Unique Identifiers) or IIDs (Interface Identifiers), are 128-bit values. The value of this property changes every time and gives a unique value.
         */
        let cfuuid:CFUUID = CFUUIDCreate(kCFAllocatorDefault)
        let string:CFString = CFUUIDCreateString(kCFAllocatorDefault, cfuuid)
        print("Device UUID: \(string as String)")
        /* OR */
        
        self.m_UUIDLbl.text = UUID().uuidString
        print("Device UUID: \(self.m_UUIDLbl.text!)")

        
        /*
         * 3. Vendor ID:
         * An alphanumeric string that uniquely identifies a device to the app’s vendor. (read-only)
         * The value of this property is the same for apps that come from the same vendor running on the same device. A different value is returned for apps on the same device that come from different vendors, and for apps on different devices regardless of vendor.
         */
        self.m_VendorIDLbl.text = UIDevice.current.identifierForVendor?.uuidString
        print("Vendor ID: \(self.m_VendorIDLbl.text!)")
        
        /*
         * 4. Advertising ID:
         * An alphanumeric string unique to each device, used only for serving advertisements. (read-only)
         * Unlike the Vendor ID property of Device, the same value is returned to all vendors. This identifier may change—for example, if the user erases the device—so you should not cache it.
         */
        self.m_AdverIDLbl.text = ASIdentifierManager.shared().advertisingIdentifier?.uuidString
        print("Advertising ID: \(self.m_AdverIDLbl.text!)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

