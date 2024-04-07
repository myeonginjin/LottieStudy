//
//  ViewController.swift
//  LottieStudy
//
//  Created by 진명인 on 4/8/24.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    var successView: UIView?
    var isAnimationView2Expanded: Bool = false // 애니메이션 뷰의 확대/축소 상태를 추적하는 플래그

    // MARK: - constant Property
    let animationView: LottieAnimationView = {
        let animationView: LottieAnimationView = .init(name: "testLottie")
        animationView.isUserInteractionEnabled = true // 사용자 입력 활성화
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
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapTest))
        animationView.addGestureRecognizer(tapGesture)
        
        // animationView2에 탭 제스처 인식기 추가
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(toggleAnimationView2Size))
        animationView2.addGestureRecognizer(tapGesture2)
        
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        animationView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        animationView2.translatesAutoresizingMaskIntoConstraints = false
        animationView2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        animationView2.bottomAnchor.constraint(equalTo: animationView.topAnchor, constant: -10).isActive = true
        animationView2.heightAnchor.constraint(equalToConstant: 300).isActive = true
        animationView2.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
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
    
    @objc func tapTest() {
        showSuccessView()
    }
    
    func showSuccessView() {
        
         // successView가 이미 표시되어 있다면, 추가x
         guard successView == nil else { return }
         
         // successView를 생성하고 구성
         let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
         view.backgroundColor = .darkGray
         view.center = self.view.center
         
         // success 라벨 추가
         let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
         label.text = "Success !! "
         label.textAlignment = .center
         view.addSubview(label)
         
         // 닫기 버튼 추가
         let closeButton = UIButton(frame: CGRect(x: 160, y: 0, width: 40, height: 40))
         closeButton.setTitle("X", for: .normal)
         closeButton.setTitleColor(.black, for: .normal)
         closeButton.addTarget(self, action: #selector(dismissSuccessView), for: .touchUpInside)
         view.addSubview(closeButton)
         
         self.view.addSubview(view)
         successView = view
     }

     @objc func dismissSuccessView() {
         // successView를 화면에서 제
         successView?.removeFromSuperview()
         successView = nil
     }
    
    @objc func toggleAnimationView2Size() {
        // 애니메이션 뷰2의 현재 크기 상태에 따라 크기를 조절
        if isAnimationView2Expanded {
            // 현재 확대 상태이므로 축소
            UIView.animate(withDuration: 0.5, animations: {
                self.animationView2.transform = .identity // 원래 크기로 돌아감
            })
        } else {
            // 현재 축소 상태이므로 확대
            UIView.animate(withDuration: 0.5, animations: {
                self.animationView2.transform = CGAffineTransform(scaleX: 0.5, y: 0.5) // 50% 축소
            })
        }
        // 확대/축소 상태를 토글
        isAnimationView2Expanded.toggle()
    }


}

