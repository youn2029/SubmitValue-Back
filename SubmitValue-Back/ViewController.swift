//
//  ViewController.swift
//  SubmitValue-Back
//
//  Created by 윤성호 on 17/01/2019.
//  Copyright © 2019 윤성호. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 화면에 표시하기 위한 아우렛 변수
    @IBOutlet var resultEmail: UILabel!     // 이메일
    @IBOutlet var resultUpdate: UILabel!    // 자동갱신 여부
    @IBOutlet var resultInterval: UILabel!  // 갱신주기
    
//    // 값을 전달받을 프로퍼티(동기)
//    var paramEamil : String?
//    var paramUpdate : Bool?
//    var paramIntervar : Double?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // 다른 화면으로 기존 화면을 가렸다가 다시 표시하면 이 메소드가 호출
    override func viewWillAppear(_ animated: Bool) {
        
        /* 직접 값을 전달(동기) */
//        if let email = paramEamil {     // nil check
//            resultEmail.text = email
//        }
//
//        if let update = paramUpdate {
//            resultUpdate.text = update == true ? "자동갱신" : "자동갱신안함"
//        }
//
//        if let interval = paramIntervar {
//            resultInterval.text = "\(Int(interval))분 마다"
//        }
        
        
        /* AppDelegate를 이용하여 값 전달(비동기) */
//        // AppDelegate의 객체 가져오기
//        let ad = UIApplication.shared.delegate as? AppDelegate
//
//        if let email = ad?.paramEmail {     // nil check
//            resultEmail.text = email
//        }
//
//        if let update = ad?.paramUpdate {
//            resultUpdate.text = update == true ? "자동갱신" : "자동갱신안함"
//        }
//
//        if let interval = ad?.paramInterval {
//            resultInterval.text = "\(Int(interval))분 마다"
//        }
        
        
        /* UserDefaults를 이용하여 값 전달(비동기) */
        // UserDefaults의 객체 가져오기
        let ud = UserDefaults.standard
        
        if let email = ud.string(forKey: "email") {     // String타입만 옵셔널타입
            resultEmail.text = email
        }

        let update = ud.bool(forKey: "isUpdate")
        resultUpdate.text = update == true ? "자동갱신" : "자동갱신안함"
        

        let interval = ud.double(forKey: "interval")
        resultInterval.text = "\(Int(interval))분 마다"
        
        
        

        
    }


}

