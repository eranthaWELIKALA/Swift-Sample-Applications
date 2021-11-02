//
//  SettingSwitchTableViewCell.swift
//  SampleTableViewApp2
//
//  Created by Erantha Welikala on 10/27/21.
//

import UIKit

class SettingSwitchTableViewCell: UITableViewCell {
    
    //    override func awakeFromNib() {
    //        super.awakeFromNib()
    //        // Initialization code
    //    }
    //
    //    override func setSelected(_ selected: Bool, animated: Bool) {
    //        super.setSelected(selected, animated: animated)
    //
    //        // Configure the view for the selected state
    //    }
    
    static let identifier = "SettingSwitchTableViewCell"
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let view = UIImageView()
        view.tintColor = .white
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    private let settingSwitch: UISwitch = {
        let settingSwitch = UISwitch()
        settingSwitch.onTintColor = .systemBlue
        return settingSwitch
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        contentView.addSubview(settingSwitch)
        contentView.clipsToBounds = true
        accessoryType = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size:CGFloat = contentView.frame.size.height - 12
        
        iconContainer.frame = CGRect(x: 10, y: 6, width: size, height: size)
        
        let imageSize:CGFloat = size * (2/3)
        iconImageView.frame = CGRect(x: (size-imageSize)/2, y: (size-imageSize)/2, width: imageSize, height: imageSize)
        
        settingSwitch.sizeToFit()
        settingSwitch.frame = CGRect(
            x: (contentView.frame.size.width - settingSwitch.frame.size.width - 20),
            y: (contentView.frame.size.height - settingSwitch.frame.size.height)/2,
            width: settingSwitch.frame.size.width,
            height: settingSwitch.frame.size.height)
        
        label.frame = CGRect(
            x: iconContainer.frame.size.width + 15,
            y: 0,
            width: contentView.frame.size.width - (iconContainer.frame.size.width + 15),
            height: contentView.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // Resetting all the values
        iconImageView.image = nil
        iconContainer.backgroundColor = nil
        label.text = nil
        settingSwitch.isOn = false
    }
    
    public func configure(with model: SettingSwitchOption) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        settingSwitch.isOn = model.isOn
    }

}
