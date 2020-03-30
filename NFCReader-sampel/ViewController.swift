//
//  ViewController.swift
//  NFCReader-sampel
//
//  Created by JONGWOO JIN on 2020/03/30.
//  Copyright © 2020 JONGWOO JIN. All rights reserved.
//

import UIKit
import CoreNFC

class ViewController: UIViewController, NFCNDEFReaderSessionDelegate {
    
    @IBOutlet weak var DataView: UITextField!
       
    @IBAction func startReadNFC(_ sender: Any) {
           let session = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: false)
           session.begin()
           print("セッションをスタートしました")
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print(error as Any)
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        print(messages as Any)
        for message in messages {
            for payload in message.records {
                if let payloadString = String.init(data: payload.payload.advanced(by: 1), encoding: String.Encoding.utf8){
                    print("payloadString")
                    self.DataView.text = payloadString
                }
            }
        }
    }
    

   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

