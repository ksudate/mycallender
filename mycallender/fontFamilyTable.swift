//
//  fontFamilyTable.swift
//  mycallender
//
//  Created by Okura on 2019/02/13.
//  Copyright © 2019 kentarou sudate. All rights reserved.
//

import UIKit

class fontFamilyTable: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var testFont: UILabel!
    @IBOutlet weak var fontFamilyPicker: UIPickerView!
    @IBOutlet weak var fontSizeSegment: UISegmentedControl!
    
    let setting = settings()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontFamilyPicker.dataSource = self
        fontFamilyPicker.delegate = self
    }

    //ここからはテーブルの設定
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: // 「フォントの例」のセクション
            return 1
        case 1: // 「フォントの種類」のセクション
            return 1
        case 2: // 「フォントサイズ」のセクション
            return 2
        default: // ここが実行されることはないはず
            return 0
        }

    }
    
    //ここからはフォントの種類を決めるPickerViweの設定
    //fontFamilyPickerの中身のリスト
    var fontFamilyList = ["Helvetica Neue", "Helvetica Bold Oblique", "DIN Condensed"]
    
    //fontFamilyPickerの列を1にする。
    func numberOfComponents(in fontFamilyPicker: UIPickerView) -> Int {
        return 1
    }
    //fontFamilyPickerの行をリストの要素数にする。
    func pickerView(_ fontFamilyPicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fontFamilyList.count
    }
    
    func pickerView(_ fontFamilyPicker: UIPickerView, titleForRow row: Int, forComponent component: Int)-> String? {
        return fontFamilyList[row]
    }
    
    //fontFamilyPickerのrowが選択された時の挙動
    func pickerView(_ fontFamilyPicker: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        setting.setFontFamily = fontFamilyList[row]
    }

    //ここからはフォントサイズを決めるSegmentedControlの設定
    @IBAction func segmentChange(_ sender: Any) {
         let selectedSize = fontSizeSegment.selectedSegmentIndex
        switch selectedSize {
        case 0: // 「フォントの例」のセクション
            setting.setFontSize = 14
        case 1: // 「フォントの種類」のセクション
            setting.setFontSize = 17
        case 2: // 「フォントサイズ」のセクション
            setting.setFontSize = 25
        default: // ここが実行されることはないはず
            setting.setFontSize = 17
        }
    }
    
    //「適用する」ボタンが押された時の挙動
    @IBAction func botton(_ sender: Any) {
        testFont.font = UIFont(name: setting.setFontFamily, size: setting.setFontSize)
        UILabel.appearance().font = UIFont(name: setting.setFontFamily, size: setting.setFontSize)
    }
    
}
