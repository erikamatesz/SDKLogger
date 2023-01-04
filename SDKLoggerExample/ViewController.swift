//
//  ViewController.swift
//  SDKLoggerExample
//
//  Created by Erika C. Matesz Bueno on 04/01/23.
//

import UIKit
import SDKLogger

struct TestObject {
    var id = UUID()
    var randomBool = Bool.random()
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        SDKLogger.log("This is a log!")
        SDKLogger.error("This is an error!")
        SDKLogger.info("This is an info!")
        SDKLogger.warn("This is a warn!")
        SDKLogger.request(URL(string: "https://test.com")!)
        SDKLogger.request("https://test.com")
        SDKLogger.response("https://test.com", statusCode: 500)
        SDKLogger.dump(TestObject())

        let array = [TestObject(), TestObject(), TestObject(), TestObject(), TestObject()]
        SDKLogger.items(of: array)
    }


}

