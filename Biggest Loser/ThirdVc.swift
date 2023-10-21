//
//  ThirdVc.swift
//  Biggest Loser
//
//  Created by hutao on 2023/10/5.
//

import UIKit
import SnapKit
let ScreenWith = UIScreen.main.bounds.width
class ThirdVc: UIViewController {
    
    var image = ["bread","milk","fish","sugar","meat","salt"]
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "Diet tips"
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.classForCoder(),forCellReuseIdentifier: "resuedCell")
    }
    //动画效果
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let cells = tableView.visibleCells
        var count = 2
        //把单元格拿出屏幕
        for cell in cells {
            if(count % 2 == 0){
                cell.center.x = -200
            }else{
                cell.center.x = ScreenWith + 200
            }
            count += 1
        }
        var delay:Double = 0.00//延迟的时间
        
        //单元格进入进入视图当中
        for cell in cells{
            UIView.animate(withDuration: 0.4,delay: delay,options: UIView.AnimationOptions.curveEaseInOut,animations: {
                delay += 0.2
                cell.center.x = ScreenWith / 2
            },completion: nil)
        }
        
        let alert = UIAlertController(title: "Tips", message: "yes", preferredStyle: .alert)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .justified // 这里设置文本居中对齐，你可以根据需要选择.left或.right等

        // 创建NSAttributedString并应用文本对齐方式
        let messageText = NSAttributedString(string:"The information above is sourced from the Centers for Disease Control and Prevention (CDC) agency. If you would like to learn more, please visit "+"https://www.cdc.gov/nccdphp/dnpao/features/healthy-eating-tips/index.html", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])

        // 将NSAttributedString应用到UIAlertController的message
        alert.setValue(messageText, forKey: "attributedMessage")
        
        let ok = UIAlertAction(title: "GO", style: .default){ action in
            if let url = URL(string: "https://www.cdc.gov/nccdphp/dnpao/features/healthy-eating-tips/index.html") {
                       UIApplication.shared.open(url, options: [:], completionHandler: nil)
                   }
        }
        
        let no = UIAlertAction(title: "NO", style: .default)
        alert.addAction(ok)
        alert.addAction(no)
        self.present(alert, animated: true,completion: nil)
        
    }
}

extension ThirdVc:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = "resuedCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! TableViewCell
        cell.label1.text = food1[indexPath.row]
        cell.label2.text = tips2[indexPath.row]
        cell.myimageView.image = UIImage(named: "\(image[indexPath.row])")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "\(food1[indexPath.row])", message: "\(alert1[indexPath.row])", preferredStyle: .alert)
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.alignment = .justified // 这里设置文本居中对齐，你可以根据需要选择.left或.right等

        // 创建NSAttributedString并应用文本对齐方式
        let messageText = NSAttributedString(string:"\(alert1[indexPath.row])\n", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])

        // 将NSAttributedString应用到UIAlertController的message
        alert.setValue(messageText, forKey: "attributedMessage")
        let ok = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(ok)
        self.present(alert, animated: true,completion: nil)
    }
    
}
