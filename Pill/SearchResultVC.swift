//
//  SearchResultVC.swift
//  Pill
//
//  Created by 김은서 on 2022/05/11.
//

import UIKit

class SearchResultVC: UIViewController {
    
    var pillData: [PillModel] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func callApi(){
        
    }
    
}
extension SearchResultVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
        }
        
        // 특정 row에 표시할 cell 리턴
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell", for: indexPath) as? SearchResultCell else { return UITableViewCell() }
        
//        let row = self.pickPortfolioGroupList[indexPath.row]
//        cell.lblName.text = row
//        cell.lblManufacturer.text = row
        
        // 생성한 Cell 리턴
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
    }
}
