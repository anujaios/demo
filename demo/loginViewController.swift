//
//  loginViewController.swift
//  demo
//
//  Created by Anuja Ladge on 09/06/22.
//

import UIKit
import FirebaseAuth

class loginViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        
        validateFeilds()
        let stroryboard = UIStoryboard(name: "Main", bundle: nil)
         let vc = stroryboard.instantiateViewController(withIdentifier: "ViewController")
         vc.modalPresentationStyle = .overFullScreen
         self.present(vc, animated:true)
        
    }
    
    
    @IBAction func createTapped(_ sender: UIButton) {
       let stroryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = stroryboard.instantiateViewController(withIdentifier: "signupViewController")
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    func validateFeilds (){
        if email.text?.isEmpty == true {
            print("email feild is empty")
            return
        }
        if password.text?.isEmpty == true {
            print("password is empty")
            return
        }
        login()
    }
    
    func login () {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) {[weak self] authResult, error in
            guard let strongSelf = self else {
                return
            }
            if let error = error {
                print(error.localizedDescription)
            }
            self!.checkUserInfo()
        }
    }
    func checkUserInfo (){
        if ((Auth.auth().currentUser?.uid) != nil) {
            print(Auth.auth().currentUser?.uid)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "signupViewController")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
        }
    }
    
}
