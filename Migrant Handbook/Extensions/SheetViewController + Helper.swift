//
//  SheetViewController + Helper.swift
//  Migrant Handbook
//
//  Created by Mairambek on 9/14/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//


import FittedSheets

extension SheetViewController {
    func setupSheetView() {
        self.dismissOnBackgroundTap = true
        self.handleColor = .clear
        self.overlayColor = UIColor.black.withAlphaComponent(0.5)
        self.topCornersRadius = 14
    }
}
