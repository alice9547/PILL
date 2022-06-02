//
//  SearchVC.swift
//  Pill
//
//  Created by 김은서 on 2022/05/11.
//

import UIKit

class SearchVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfEfficacy: UITextField!
    @IBOutlet weak var preview: UIImageView!
    @IBOutlet weak var btnSearch: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnSearch.setNextBtnColor(enabled: true)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pick(_ sender: Any) {
        let alert = UIAlertController(title: "이미지를 가져올 곳을 선택해주세요", message: "", preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "카메라", style: .default){(_) in
            self.setAction(type: .camera)
        }
        
        let album = UIAlertAction(title: "저장앨범", style: .default){(_) in
            self.setAction(type: .savedPhotosAlbum)
        }
        
        let library = UIAlertAction(title: "사진 라이브러리", style: .default) {(_) in
            self.setAction(type: .photoLibrary)
        }
        
        //메시지 창 컨트롤러에 버튼 액션을 추가
        alert.addAction(camera)
        alert.addAction(album)
        alert.addAction(library)
        
        //메시지 창 컨트롤러를 표시
        self.present(alert, animated: false)
        
    }
    
    func setAction(type:UIImagePickerController.SourceType){
        let picker = UIImagePickerController()
        
        picker.sourceType = type
        picker.delegate = self
        picker.allowsEditing = true
        self.present(picker, animated: false)
    }
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.preview.image = info[.editedImage] as? UIImage
        
        picker.dismiss(animated: false)
    }
}
