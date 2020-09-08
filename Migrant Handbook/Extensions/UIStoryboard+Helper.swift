//
//  UIStoryboard+Helper.swift
//  Migrant Handbook
//
//  Created by Mairambek on 8/25/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

extension UIStoryboard {
    class func createVC<T: UIViewController>(controllerType: T.Type, storyboard: AppStoryboards) -> T {
        let st = UIStoryboard.init(name: storyboard.rawValue, bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: controllerType.className) as! T
        return vc
    }
}
