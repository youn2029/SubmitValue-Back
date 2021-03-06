//
//  FormViewController.swift
//  SubmitValue-Back
//
//  Created by 윤성호 on 17/01/2019.
//  Copyright © 2019 윤성호. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    
    @IBOutlet var email: UITextField!   // 이메일
    @IBOutlet var isUpdate: UISwitch!   // 자동갱신
    @IBOutlet var interval: UIStepper!  // 갱신주기
    
    @IBOutlet var updateText: UILabel!      // 자동갱신 text
    @IBOutlet var intervalText: UILabel!    // 갱신주기 text
    
    // 자동갱신 switch
    @IBAction func onUpdate(_ sender: UISwitch) {
        
        if sender.isOn == true {
            self.updateText.text = "갱신함"
        } else {
            self.updateText.text = "갱신안함"
        }
    }
    
    // 갱신주기 스테퍼
    @IBAction func onInterval(_ sender: UIStepper) {
        self.intervalText.text = "\(Int(sender.value))분 마다"
    }
    
    // submit 버튼
    @IBAction func onSubmit(_ sender: Any) {
        
        /* 직접 값을 전달(동기) */
//        // 이전 화면을 presentingViewController 속성으로 읽어온 다음
//        // viewController 타입으로 캐스팅한다.
//        guard let preVC = self.presentingViewController as? ViewController else {
//            return
//        }
//
//        // 값을 전달한다
//        preVC.paramEamil = email.text!
//        preVC.paramUpdate = isUpdate.isOn
//        preVC.paramIntervar = interval.value
        
        
        /* AppDelegate 객체를 이용하여 값 전달(비동기) - 앱이 종료되면 정보삭제됨 */
        // AppDelegate 객체의 인스턴스를 가져온다
//        let ad = UIApplication.shared.delegate as? AppDelegate
//
//        // 값 저장
//        ad?.paramEmail = email.text!
//        ad?.paramUpdate = isUpdate.isOn
//        ad?.paramInterval = interval.value
        
        
        /* UserDefaults객체를 이용하여 값 전달(비동기) - 앱이 삭제되면 정보삭제됨(반영구적) */
        // UserDefaults 객체의 인스턴스 가져오기
        let ud = UserDefaults.standard
        
        // 값 저장
        ud.set(self.email.text, forKey: "email")
        ud.set(self.isUpdate.isOn, forKey: "isUpdate")
        ud.set(self.interval.value, forKey: "interval")
        
        // 이전 화면으로
        self.presentingViewController?.dismiss(animated: true)
        
    }
    
}
