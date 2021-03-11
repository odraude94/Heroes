//
//  SearchHeroVC.swift
//  HeroDatabase
//
//  Created by Eduardo Martinez on 10/03/21.
//

import UIKit

class SearchHeroVC: UIViewController {
    
    //MARK: Properties
    var searchBar = UISearchBar()
    var tvHeroes = UITableView()
    var heroes = [Hero]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Heroes"
        setUI()
    }
    
    //MARK: Functions
    func setUI(){
        
        view.backgroundColor = .white
        
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(searchBar)
        searchBar.delegate = self
        searchBar.placeholder = "Search Hero"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -16).isActive = true
        
        tvHeroes.backgroundColor = .white
        tvHeroes.register(HeroTVCell.self, forCellReuseIdentifier: "HeroTVCell")
        tvHeroes.dataSource = self
        tvHeroes.delegate = self
        
        view.addSubview(tvHeroes)
        tvHeroes.translatesAutoresizingMaskIntoConstraints = false
        tvHeroes.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 0).isActive = true
        tvHeroes.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 0).isActive = true
        tvHeroes.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: 0).isActive = true
        tvHeroes.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: 0).isActive = true
    }
    
    func searchHeroes(name:String){
        
        let server: Server = Server()
        
        let url = API.ws.get.search.replacingOccurrences(of:"{:name}", with: "\(name)")
        
        server.request(url:url)
        {
            (data, nsError) in
            
            guard data != nil,
                  let search: Search = server.decodeObject(data: data!) else { return }
            
            self.heroes = search.results
            
            self.tvHeroes.reloadData()
            
        }
    }
}

extension SearchHeroVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroTVCell", for: indexPath) as! HeroTVCell
        
        let hero = heroes[indexPath.row]
        
        cell.lblName.text = hero.name
        if let url = URL(string:hero.image?.url ?? ""){
            cell.imvHero.kf.setImage(with: url)
        }
            
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailHeroVC()
        vc.hero = heroes[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
        return 70
    }
}

// MARK: - SearchBarDelegates
extension SearchHeroVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchBar.showsCancelButton = true
        
        if searchBar.text != nil && searchBar.text!.trim().count > 0 {
            self.searchHeroes(name: searchBar.text!.trim())
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        heroes.removeAll()
        tvHeroes.reloadData()
        searchBar.endEditing(true)
        searchBar.showsCancelButton = false
        searchBar.text = ""
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        searchBar.showsCancelButton = false
        self.searchHeroes(name: searchBar.text!.trim())
    }
}
