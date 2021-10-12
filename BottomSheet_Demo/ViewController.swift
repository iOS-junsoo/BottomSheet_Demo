//
//  ViewController.swift
//  BottomSheet_Demo
//
//  Created by 준수김 on 2021/10/12.
//

import UIKit
import MaterialComponents.MaterialBottomSheet

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnClicked(_ sender: UIButton) {
        print("바텀 시트 오픈 버튼 클릭")
        // 바텀 시트로 쓰일 뷰컨트롤러 생성
                let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
                
        // MDC 바텀 시트로 설정
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)

        // 아래로 드래그해도 안닫히게 하기
        bottomSheet.dismissOnDraggingDownSheet = false
        
        // 높이
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 200
        
        // 뒤에 배경 컬러 (노랑,투명50%)
        bottomSheet.scrimColor = UIColor.systemGray.withAlphaComponent(0.5)
        
        bottomSheet.delegate = self
        
        // 보여주기
        present(bottomSheet, animated: true, completion: nil)
    }
    

}

extension ViewController: MDCBottomSheetControllerDelegate {
    func bottomSheetControllerDidDismissBottomSheet(_ controller: MDCBottomSheetController) {
        print("바트 시트 닫힘")
    }
    
    func bottomSheetControllerDidChangeYOffset(_ controller: MDCBottomSheetController, yOffset: CGFloat) {
        // 바텀 시트 위치
        print(yOffset)
    }
}
