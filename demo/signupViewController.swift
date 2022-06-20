//
//  signupViewController.swift
//  demo
//
//  Created by Anuja Ladge on 09/06/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class signupViewController: UIViewController {
    
    

    @IBOutlet weak var emailID: UITextField!
    
    
    @IBOutlet weak var passwords: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signTapped(_ sender: UIButton) {
        if emailID.text?.isEmpty == true {
            print("no text in email")
            return
        }
        if passwords.text?.isEmpty == true {
            print("no password")
            return
        }
        signUp()
        
    }
    
    @IBAction func login(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "loginViewController")
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    
    func signUp() {
        Auth.auth().createUser(withEmail: emailID.text!, password: passwords.text!) {[weak self] authResult, error in
            guard let user = authResult?.user , error == nil else {
                print(error?.localizedDescription)
                return
            }
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ViewController")
            vc.modalPresentationStyle = .overFullScreen
            self!.present(vc, animated: true)
        }
    }
    
    
}
