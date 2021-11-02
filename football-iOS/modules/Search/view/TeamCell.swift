


import Foundation
import PINRemoteImage

class TeamCell: UICollectionViewCell{
    

    @IBOutlet weak var teamImageView: UIImageView! {
        didSet {
            teamImageView.layer.cornerRadius = 4.0
            teamImageView.clipsToBounds = true
        }
    }
    @IBOutlet weak var teamNameLabel: UILabel!

    
    

    
    var team: SearchResultTeam? {
        didSet {
            guard let team:SearchResultTeam = team else { return }
            teamNameLabel.text = team.name
            teamImageView.setImageByPINRemoteImage(with: team.logo)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        teamImageView.image = nil
    }
}
