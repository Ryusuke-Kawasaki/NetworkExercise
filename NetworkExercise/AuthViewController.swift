//
//  AuthViewController.swift
//  NetworkExercise
//
//  Created by 川崎 隆介 on 2015/12/15.
//  Copyright (c) 2015年 川崎 隆介. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func response(_ data:Data?,res:URLResponse?,error:Error?){
        // 応答データを文字列に変換.
        if let resStr = NSString(data:data!, encoding: String.Encoding.utf8.rawValue){
            print(resStr)
        }
    }
    
    @IBAction func pushSendButton(_ sender: AnyObject) {
        // 通信先のURLを生成.
        let url = URL(string:"http://codable.co.jp/training/swift/auth.php")!
        // リクエストを生成.
        var request  = URLRequest(url: url)
        let postStr = "name=\(nameTextField.text)&password=\(passwordTextField.text)"
        let postData = postStr.data(using: String.Encoding.utf8)
        request.httpMethod = "POST"
        request.httpBody = postData
        //NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main, completionHandler: response as! (URLResponse?, Data?, Error?) -> Void)
        let session = URLSession.shared
        let task = session.dataTask(with:request, completionHandler:self.response)
        task.resume()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
