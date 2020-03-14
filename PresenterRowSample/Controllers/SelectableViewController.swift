//
//  SelectableViewController.swift
//  PresenterRowSample
//
//  Created by Alfredo Luco on 13-03-20.
//  Copyright © 2020 Alfredo Luco. All rights reserved.
//

import UIKit
import Eureka

public class SelectableViewController: UIViewController, TypedRowControllerType {

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    open var images: [String] = []
    public var row: RowOf<String>!
    public var onDismissCallback: ((UIViewController) -> Void)?
    
    //MARK: - Init
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    open override func loadViewIfNeeded() {
        super.loadViewIfNeeded()
    }
    
    public convenience init(images: [String]){
        let name = String(describing: SelectableViewController.self)
        let bundle = Bundle(for: SelectableViewController.self)
        print(name)
        print(bundle)
        self.init(nibName: name, bundle: bundle)
        self.images = images
        self.loadViewIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "ImagePresentedCell", bundle: Bundle(for: ImagePresentedCell.self)), forCellReuseIdentifier: "presentedIdentifier")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
}

extension SelectableViewController: UITableViewDelegate, UITableViewDataSource{
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.images.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "presentedIdentifier", for: indexPath) as? ImagePresentedCell{
            cell.iconImageView.image = UIImage(named: self.images[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let image = self.images[indexPath.row]
        self.row.value = image
        self.row.updateCell()
        guard let callback = self.onDismissCallback else{ return }
        callback(self)
    }
    
}
