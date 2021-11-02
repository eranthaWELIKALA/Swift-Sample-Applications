//
//  ViewController.swift
//  SampleTableViewApp2
//
//  Created by Erantha Welikala on 10/26/21.
//

import UIKit

struct SettingSectionOption {
    let title: String
    let options: [SettingOptionType]
}

enum SettingOptionType {
    case staticCell(model: SettingOption)
    case switchCell(model: SettingSwitchOption)
}

struct SettingOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler:(()-> Void)
}

struct SettingSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler:(()-> Void)
    var isOn: Bool
}

class ViewController: UIViewController {
    
    var sections:[SettingSectionOption] = []
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        table.register(SettingSwitchTableViewCell.self, forCellReuseIdentifier: SettingSwitchTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        configure()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configure() {
        self.sections.append(
            SettingSectionOption(title: "General", options: [
                SettingOptionType.staticCell(model: SettingOption(title: "Airplane Mode", icon: AssetManager.getIconImages(with: "airplane_mode"), iconBackgroundColor: .systemYellow, handler: {})),
                SettingOptionType.staticCell(model: SettingOption(title: "WiFI", icon:  AssetManager.getIconImages(with: "wifi"), iconBackgroundColor: .systemBlue, handler: {})),
                SettingOptionType.switchCell(model: SettingSwitchOption(title: "Bluetooth", icon:  AssetManager.getIconImages(with: "bluetooth"), iconBackgroundColor: .systemBlue, handler: {}, isOn: true)),
                SettingOptionType.staticCell(model: SettingOption(title: "Cellular", icon:  AssetManager.getIconImages(with: "cellular"), iconBackgroundColor: .systemGreen, handler: {})),
                SettingOptionType.staticCell(model: SettingOption(title: "VPN", icon:  AssetManager.getIconImages(with: "vpn"), iconBackgroundColor: .systemBlue, handler: {}))
            ])
        )
        self.sections.append(
            SettingSectionOption(title: "", options: [
                SettingOptionType.staticCell(model: SettingOption(title: "Notifications", icon:  AssetManager.getIconImages(with: "notifications"), iconBackgroundColor: .systemYellow, handler: {})),
                SettingOptionType.staticCell(model: SettingOption(title: "Sounds", icon:  AssetManager.getIconImages(with: "sounds"), iconBackgroundColor: .systemBlue, handler: {})),
                SettingOptionType.staticCell(model: SettingOption(title: "Do Not Disturb", icon:  AssetManager.getIconImages(with: "do_not_disturb"), iconBackgroundColor: .systemBlue, handler: {})),
                SettingOptionType.staticCell(model: SettingOption(title: "Screen Time", icon:  AssetManager.getIconImages(with: "screen_time"), iconBackgroundColor: .systemGreen, handler: {}))
            ])
        )
        self.sections.append(
            SettingSectionOption(title: "Apps", options: [
                SettingOptionType.staticCell(model: SettingOption(title: "Facebook", icon:  AssetManager.getIconImages(with: "facebook"), iconBackgroundColor: .blue, handler: {})),
                SettingOptionType.staticCell(model: SettingOption(title: "Whatsapp", icon:  AssetManager.getIconImages(with: "whatsapp"), iconBackgroundColor: .green, handler: {})),
                SettingOptionType.staticCell(model: SettingOption(title: "Instagram", icon:  AssetManager.getIconImages(with: "instagram"), iconBackgroundColor: .magenta, handler: {}))
            ])
        )
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = sections[indexPath.section].options[indexPath.row]
        switch model.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = sections[indexPath.section].options[indexPath.row]
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: "SettingTableViewCell",
                    for: indexPath) as? SettingTableViewCell
            else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: "SettingSwitchTableViewCell",
                    for: indexPath) as? SettingSwitchTableViewCell
            else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }
}
