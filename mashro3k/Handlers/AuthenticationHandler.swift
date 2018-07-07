//
//  AuthenticationHandler.swift
//  mashro3k
//
//  Created by Mona Noaman on 5/3/18.
//  Copyright © 2018 EsraaEldaltony. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import CodableFirebase

class AuthenticationHandler{
     var ref: DatabaseReference!
    
    func loginWithEmail(email:String, password:String, success: @escaping (User) -> (),fail: @escaping (Error) -> () ){
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil{
                fail(error!)
            }else{
                self.getUserWithEmail(id: (user?.uid)!,success: success,fail: fail)
            }
        }
        
    }
    
    func loginWithCredential(credential:AuthCredential,success: @escaping (User) -> (),fail: @escaping (Error) -> () ){
            
            Auth.auth().signIn(with: credential, completion: { (user, error) in
                if let error = error {
                    print("Login error: \(error.localizedDescription)")
                    fail(error)
                    
                }else{
                    self.getUserWithEmail(id: (user?.uid)!,success: success,fail: fail)

                }
                
                
            })
    }
    
    private func getUserWithEmail(id:String, success: @escaping (User) -> (),fail: @escaping (Error) -> ()){
   
        ref = Database.database().reference()
        ref.child("users").child(id).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            if snapshot.childrenCount == 0{
                let user = User()
                user.id = id
               success(user)
            }else{
                do {
                    let value = snapshot.value
                    let user = try FirebaseDecoder().decode(User.self, from: value)
                    success(user)
                } catch let error {
                    print(error)
                }
                
            
            }
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
            fail(error)
        }
    }
    
    
    // MARK: - Registration
    func registerWithEmail( email:String, password:String, success: @escaping (String) -> (),fail: @escaping (Error) -> () ){

        ref = Database.database().reference()
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if error != nil{
                fail(error!)
            }else{
                success((authResult?.uid)!)
                
            }

        }
        
    }
    func register(usersDict:[String:String], id : String, success: @escaping (String) -> (),fail: @escaping (Error) -> () ){
        do {
            ref = Database.database().reference()
            self.ref.child("users").child(id).setValue( usersDict)
            success("done")
        } catch let error {
            print(error)
        }
    }

    // MARK: - getCountries

    func getCountries( success: @escaping ([Cities]) -> (),fail: @escaping (Error) -> ())
    {
        ref = Database.database().reference()
        ref.child("cities").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            if snapshot.value == nil{
                success([Cities()])
            }else{
                do {
                    let value = snapshot.value
                    let cities = try FirebaseDecoder().decode([Cities].self, from: value)
                    success(cities)
                } catch let error {
                    print(error)
                }
            }
        }) { (error) in
            print(error.localizedDescription)
            fail(error)
        }
    }
    // MARK: - ideas

    func addIdeas(ideaDict:[String:String], id : String, success: @escaping (String) -> (),fail: @escaping (Error) -> () ){
        do {
            ref = Database.database().reference()
            self.ref.child("ideas").child(id).child("20").setValue( ideaDict)

            success("done")
        } catch let error {
            print(error)
        }
    }
    
    


}
