//
//  DetailViewController.swift
//  BearPlay
//
//  Created by 루딘 on 12/14/23.
//

import UIKit

class DetailViewController: UIViewController {

    var music: Music?
    @IBOutlet weak var musicImg: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var progressBar: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        // Do any additional setup after loading the view.
    }
    
    func setView(){
        if let img = music?.artwork{
            musicImg.image = img
        }
        artistLabel.text = music?.artist ?? "anonymous"
        titleLabel.text = music?.title
        
        titleLabel.showAll()
        
        initSlider()
        
        //durationLabel.text = formatter.string(from: music?.length ?? 0)
        durationLabel.text = TimeInterval(progressBar.value).toString()
    }
    
    func initSlider(){
        progressBar.maximumValue = Float(music?.length ?? 0)
        progressBar.setThumbImage(UIImage(named:"thumbImg"), for: .highlighted)
        progressBar.setThumbImage(UIImage(named:"thumbImg"), for: .normal)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let value = sender.value
        durationLabel.text = ((music?.length ?? 0) * Double((value/progressBar.maximumValue))).toString()
    }
    
}

