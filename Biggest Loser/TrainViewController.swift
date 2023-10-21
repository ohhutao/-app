//
//  TrainViewController.swift
//  Biggest Loser
//
//  Created by hutao on 2023/9/25.
//

import UIKit
import AVFoundation
class TrainViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var sportLabel: UILabel!
    
    var audioPlayer: AVAudioPlayer?
    class timeManager {
        
        var timer:Timer?
        var seconds: Int!
        
        init(seconds: Int!) {
            self.seconds = seconds
        }
        
        
        //获取当前已经计时的时间
        func now()->Int{
            return seconds
        }
        
        //函数类型
        var result: (Int) -> String = { seconds in
            let hour = seconds / 3600
            let min = seconds / 60
            let sec = seconds % 60
            return String(format: "%02d:%02d:%02d", hour,min,sec)
        }
        //开始计时
        func start(completion: @escaping(String) -> Void){
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval:1 , repeats: true, block: { _ in
                self.seconds += 1
                completion(self.result(self.seconds))
            })
        }
        //停止计时
        func stop(){
            timer?.invalidate()
            timer = nil
        }
        
    }
    
    var imageName = ""
    var wordName = ""
    var mainSec = 0
    var timemanager:timeManager?
    
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var StopButton: UIButton!
    @IBOutlet weak var ResetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //播放音乐
        if let audioURL = Bundle.main.url(forResource: "music1", withExtension: ".mp3"){
                   do{
                       audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
                   }catch{
                       print("无法初始化音频播放器：\(error)")
                   }
               }
        
        self.image.image = UIImage(named: imageName)
        self.sportLabel.text = wordName
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        if(mainSec == 0){
            startAlertAction()
        }
        //创建一个警告窗口
        timemanager = timeManager(seconds: mainSec)
        timemanager?.start(completion: { result in
            self.timeLabel.text = result
            self.mainSec = self.timemanager?.now() ?? 0
        })
        StartButton.isEnabled = false
    }
    
    @IBAction func StopButton(_ sender: UIButton) {
        timemanager?.stop()
        StartButton.isEnabled = true
    }
    
    @IBAction func ResetButton(_ sender: UIButton) {
        resetAlertAction()
        self.timeLabel.text = String(format: "00:00:00")
        mainSec = 0
    }
    
    //开关控制音乐播放
    @IBAction func musciSwitch(_ sender: UISwitch) {
        if sender.isOn{
                   audioPlayer?.play()
        }
        else{
            audioPlayer?.stop()
        }
    }
    
//MARK: func
    //开始弹窗
    func startAlertAction(){
        let alert = UIAlertController(title: "Information", message: "Now, you can start this exercise, or you can turn on the switch on the right to choose whether to let music accompany your exercise", preferredStyle:.alert)
        let yes = UIAlertAction(title: "OK", style: .default)
        alert.addAction(yes)
        self.present(alert, animated: true)
    }
    //重置弹窗
    func resetAlertAction(){
        let hour = mainSec / 3600
        let min = mainSec / 60
        let alert = UIAlertController(title: "Tips", message: "Now that you have exercised for \(hour)hour \(min) minutes, do you want to share it with others?", preferredStyle:.alert)
        let yes = UIAlertAction(title: "YES", style: .default) { UIAlertAction in
            self.shareFuncation()
        }
        let no = UIAlertAction(title: "NO", style: .default)
        alert.addAction(yes)
        alert.addAction(no)
        self.present(alert, animated: true)
    }
    
    //分享
    func shareFuncation(){
        let word = sportLabel.text
        let items:[Any] = [word ?? ""]
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        self.present(activityViewController, animated: true)
    }
    
}
