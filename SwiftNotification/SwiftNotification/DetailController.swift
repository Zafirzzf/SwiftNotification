//
//  DetailController.swift
//  SwiftNotification
//
//  Created by 周正飞 on 2018/10/12.
//  Copyright © 2018年 Zafir. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    deinit {
        print("详情页销毁")
    }
    
    var notiDispose = NotiDispose()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        let button = UIButton(frame: CGRect(x: 30, y: 100, width: 50, height: 50))
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        view.addSubview(button)
        
        NewNotifications.MarketChangeNoti(dispose: NotiDispose.always).addObserve { (result) in
            print(result.name, result.age)
        }
        NewNotifications.MarketChangeNoti(dispose: notiDispose).addObserve { (result) in
            print(result.name, "3232" , result.age)
        }
    }
    
    @objc func buttonClick() {
        navigationController?.pushViewController(ThirdViewController(), animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NewNotifications.MarketChangeNoti().post((name: "zzf", age: 33))
    }
}