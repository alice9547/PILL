//
//  SearchVC.swift
//  Pill
//
//  Created by 김은서 on 2022/05/11.
//

import UIKit

class SearchVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var pillData: PillModel = []
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfEfficacy: UITextField!
    @IBOutlet weak var preview: UIImageView!
    @IBOutlet weak var btnSearch: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnSearch.setNextBtnColor(enabled: true)
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? SearchResultVC else {return}
        vc.paramData = pillData
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
    
    @IBAction func btnSearch(_ sender: Any) {
        callApi()
        self.performSegue(withIdentifier: "ShowResult", sender: nil)
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
    
    private func callApi(){
//        let url = ""
//        var request = URLRequest(url: URL(string: url)!)
//        request.httpMethod = HTTPMethod.post.rawValue
//        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
//        AF.request(request).responseDecodable(of:PillModel.self) { (json) in
//
//            switch json.result {
//                case .success(let response):
        //  pillData에 저장
//
//                case .failure(let error):
//                print(error)
//            }
//        }
        
        guard let jsonData = dummyData.data(using: .utf8) else {return}
        let data = try? JSONDecoder().decode(PillModel.self, from: jsonData)
        self.pillData = data ?? []
        print(pillData)
        
        
//        pillData = try! JSONDecoder().decode(PillModel.self, from: data)
    }
}
