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
    @IBOutlet weak var progressBar: UIProgressView!
    
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
        
        let formatter = DateComponentsFormatter()
        durationLabel.text = formatter.string(from: music?.length ?? 0)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
