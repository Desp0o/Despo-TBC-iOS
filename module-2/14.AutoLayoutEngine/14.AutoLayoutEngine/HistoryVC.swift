//
//  HistoryVCViewController.swift
//  14.AutoLayoutEngine
//
//  Created by Despo on 16.10.24.
//

import UIKit

class HistoryVC: UIViewController {
    
    let isDarkMode: Bool
    
    init(isDarkMode: Bool) {
        self.isDarkMode = isDarkMode
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = isDarkMode ? darkThemeBackgroundColor : lightThemeBackgroundColor
        // Do any additional setup after loading the view.
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




//
//
//#Preview {
//    let vc = HistoryVC(isDarkMode: false)
//    return vc
//}
