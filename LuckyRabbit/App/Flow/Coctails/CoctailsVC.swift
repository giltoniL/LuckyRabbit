//
//  CoctailsVC.swift
//  LuckyRabbit


import Foundation
import UIKit
import SVProgressHUD

class CoctailsVC: UIViewController {
    
    var items = [CoctailModel]()
    
    private var contentView: CoctailView {
        view as? CoctailView ?? CoctailView()
    }
    
    let service = Service.shared
    
    override func loadView() {
        view = CoctailView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.coctailTableView.dataSource = self
        contentView.coctailTableView.delegate = self
        loadModel()
    }
    
    func loadModel() {
        Task {
            do {
                SVProgressHUD.show()
                items = try await NetworkManager.shared.getCocktails()
                await SVProgressHUD.dismiss()
                contentView.coctailTableView.reloadData()
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

extension CoctailsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CoctailCell.reuseId, for: indexPath)
        
        guard let coctailCell = cell as? CoctailCell else {
            return cell
        }
        
        let item = items[indexPath.row]
        
        coctailCell.setupCell(item: item)
        
        return coctailCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = items[indexPath.row]
        
        let coctailDetailsVC = CoctailDetailsVC(model: item, uuid: item.id)
        
        coctailDetailsVC.model = item
        
        navigationController?.pushViewController(coctailDetailsVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 60))
        headerView.backgroundColor = .clear
        
        let titleLabel = UILabel()
        titleLabel.text = "Coctails"
        titleLabel.font = UIFont(name: "Inter-Black", size: 60)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.frame = headerView.bounds
        
        headerView.addSubview(titleLabel)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Coctails"
    }
}

