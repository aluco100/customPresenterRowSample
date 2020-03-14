//
//  PresenterRowSample.swift
//  PresenterRowSample
//
//  Created by Alfredo Luco on 13-03-20.
//  Copyright © 2020 Alfredo Luco. All rights reserved.
//

import Foundation
import Eureka

public final class PresenterRowSample: Row<PresenterRowSampleCell>, RowType {

    public required init(tag: String?) {
        super.init(tag: tag)
        cellProvider = CellProvider<PresenterRowSampleCell>(nibName: "PresenterRowSampleCell", bundle: Bundle(for: PresenterRowSampleCell.self))
        displayValueFor = {
            guard let result = $0 else { return "" }
            self.value = result
            self.updateCell()
            return result
        }
    }
    
    public override func customDidSelect() {
        super.customDidSelect()
        guard !isDisabled else { return }

        let vc = SelectableViewController(images: ["imageA","imageB"])
        vc.row = self
        cell.formViewController()?.navigationController?.pushViewController(vc, animated: true)
        vc.onDismissCallback = { _ in
            vc.navigationController?.popViewController(animated: true)
        }
    }
}
