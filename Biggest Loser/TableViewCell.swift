//
//  TableViewCell.swift
//  Biggest Loser
//
//  Created by hutao on 2023/10/5.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
     var myimageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "lunch"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
     var label1:UILabel = {
        let label = UILabel()
         label.textAlignment = .center
         label.textColor = .brown
         label.text = "yes"
        return label
    }()
    
    var label2:UILabel = {
        let label2 = UILabel()
        label2.textAlignment = .justified
        label2.numberOfLines = 0
        label2.font = UIFont.systemFont(ofSize: 11.5)
        label2.text = "no"
        return label2
    }()
    
    lazy var label3:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "yes"
        return label
    }()
    
    func setupConstraints(){
        
        addSubview(myimageView)
        myimageView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalTo(myimageView.snp.height)//纵横比为1:1
        }
        
        addSubview(label1)
        label1.snp.makeConstraints { make in
            make.top.equalToSuperview()
            //make.centerX.equalToSuperview()
            make.leading.equalTo(myimageView.snp.trailing)
            make.trailing.equalToSuperview()
        }
        
        addSubview(label2)
        label2.snp.makeConstraints { make in
            make.top.equalTo(label1.snp.bottom).offset(5)
            make.leading.equalTo(myimageView.snp.trailing)
            make.trailing.equalToSuperview()
        }
        
//        addSubview(label3)
//        label3.snp.makeConstraints { make in
//            make.top.bottom.trailing.equalToSuperview()
//            make.leading.equalTo(myimageView.snp.trailing)
//        }
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
}
