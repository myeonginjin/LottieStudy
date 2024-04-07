//
//  ViewController.swift
//  LottieStudy
//
//  Created by 진명인 on 4/8/24.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    // MARK: - constant Property
    let animationView: LottieAnimationView = {
        let animationView: LottieAnimationView = .init(name: "testLottie")
        
        return animationView
    }()
    
    let animationView2: LottieAnimationView = {
        let animationView2: LottieAnimationView = .init(name: "plus2")
        
        return animationView2
    }()
    
    let animationView3: LottieAnimationView = {
        let animationView3: LottieAnimationView = .init(name: "figgachu")
        
        return animationView3
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.addSubview(animationView)
        self.view.addSubview(animationView2)
        self.view.addSubview(animationView3)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        animationView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        animationView2.translatesAutoresizingMaskIntoConstraints = false
        animationView2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        animationView2.bottomAnchor.constraint(equalTo: animationView.topAnchor, constant: -30).isActive = true
        animationView2.heightAnchor.constraint(equalToConstant: 200).isActive = true
        animationView2.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        animationView3.translatesAutoresizingMaskIntoConstraints = false
        animationView3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        animationView3.topAnchor.constraint(equalTo: animationView.bottomAnchor, constant: 30).isActive = true
        animationView3.heightAnchor.constraint(equalToConstant: 200).isActive = true
        animationView3.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        animationView.play(
            fromFrame: 0,   // 애니메이션 시작 진행률 (0.0은 시작)
            toFrame: 60,   // 애니메이션 종료 진행률
            loopMode: .loop, // 반복 모드 설정
            completion: nil // 애니메이션 재생 완료 후 호출될 콜백 함수
        )
        
        animationView2.play(
            fromFrame: 0,   // 애니메이션 시작 진행률 (0.0은 시작)
            toFrame: 75,   // 애니메이션 종료 진행률
            loopMode: .loop, // 반복 모드 설정
            completion: nil // 애니메이션 재생 완료 후 호출될 콜백 함수
        )

        animationView3.play(
            fromFrame: 0,   // 애니메이션 시작 진행률 (0.0은 시작)
            toFrame: 180,   // 애니메이션 종료 진행률
            loopMode: .loop, // 반복 모드 설정
            completion: nil // 애니메이션 재생 완료 후 호출될 콜백 함수
        )
        

    }


}

