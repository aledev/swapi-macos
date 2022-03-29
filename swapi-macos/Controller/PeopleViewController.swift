//
//  PeopleViewController.swift
//  swapi-macos
//
//  Created by Alejandro Ignacio Aliaga Martinez on 28/3/22.
//

import Foundation
import AppKit

class PeopleViewController: NSViewController {
    
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var btnBack: NSButton!
    
    @IBAction func btnBackClick(_ sender: NSButton) {
        self.view.window?.performClose(nil)
    }
    
    var swapiServiceProvider: SwapiServiceProviderProtocol?
    var peopleList: [People] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "People List"
        self.swapiServiceProvider = SwapiServiceProvider()
        
        // TableView Delegates
        tableView.delegate = self
        tableView.dataSource = self        
        
        loadPeopleList()
    }

    override func viewWillAppear() {
        super.viewWillAppear()
        
        tableView.reloadData()
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func loadPeopleList() {
        swapiServiceProvider?.getPeopleList(completionHandler: { [weak self] result in
            switch result {
            case .success(let data):
                self?.peopleList = data.results ?? []
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        })
    }

}

extension PeopleViewController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return peopleList.count
    }
    
    func tableView(_ tableView: NSTableView, sortDescriptorsDidChange oldDescriptors: [NSSortDescriptor]) {
        tableView.reloadData()
    }
    
}

extension PeopleViewController: NSTableViewDelegate {
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let currentPerson = peopleList[row]
        var text: String = ""
        var cellIdentifier: String = ""
        
        guard let identifier = tableColumn?.identifier else {
            return nil
        }
        
        switch identifier.rawValue {
        case "name":
            text = currentPerson.name
            cellIdentifier = "NameCellView"
        case "height":
            text = currentPerson.height
            cellIdentifier = "HeightCellView"
        case "mass":
            text = currentPerson.mass
            cellIdentifier = "MassCellView"
        case "hairColor":
            text = currentPerson.hairColor
            cellIdentifier = "HairColorCellView"
        case "skinColor":
            text = currentPerson.skinColor
            cellIdentifier = "SkinColorCellView"
        case "eyeColor":
            text = currentPerson.eyeColor
            cellIdentifier = "EyeColorCellView"
        case "birthYear":
            text = currentPerson.birthYear
            cellIdentifier = "BirthYearCellView"
        case "gender":
            text = currentPerson.gender
            cellIdentifier = "GenderCellView"
        default:
            return nil
        }
        
        if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: cellIdentifier), owner: nil) as? NSTableCellView {
            cell.textField?.stringValue = text
            
            return cell
        }
        
        return nil
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 21.0
    }
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        return true
    }
    
}
