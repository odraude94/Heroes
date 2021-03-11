//
//  HeroesVC.swift
//  HeroDatabase
//
//  Created by Eduardo Martinez on 08/03/21.
//
import UIKit
import Alamofire
import Kingfisher

class HeroesVC: UIViewController {
    
    //MARK: Properties
    var heroes = [Hero]()
    var groupHeroes = [[Hero]]()
    var currentHeroID = 1
    var refreshControl = UIRefreshControl()
    let tvHeroes = UITableView()
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        loadMoreHeroes(startValue: 1)
        
    }
    
    //MARK: UI
    func setupUI(){
        
        let guide = view.safeAreaLayoutGuide
        
        searchBar.sizeToFit()
        searchBar.placeholder = "Search Heroes"
        navigationItem.titleView =  searchBar
        
        let btnSearchBar = UIButton()
        searchBar.addSubview(btnSearchBar)
        btnSearchBar.frame = searchBar.frame
        btnSearchBar.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openSearchView)))
        
        view.addSubview(tvHeroes)
        tvHeroes.dataSource = self
        tvHeroes.delegate = self
        tvHeroes.translatesAutoresizingMaskIntoConstraints = false
        tvHeroes.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        tvHeroes.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        tvHeroes.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        tvHeroes.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        tvHeroes.register(HeroesTVCell.self, forCellReuseIdentifier: "HeroesTVCell")
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to load more heroes")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tvHeroes.addSubview(refreshControl)
        
    }
    
    //MARK: Functions
    func loadMoreHeroes(startValue: Int){
        
        heroes.removeAll()
        
        for index in startValue...startValue+9{
            getHeroes(id: index, last: startValue+9)
        }
        
        refreshControl.endRefreshing()
    }
    
    func getHeroes(id: Int, last:Int){
        
        let server: Server = Server()
        
        let url = API.ws.get.byID.replacingOccurrences(of:"{:id}", with: "\(id)")
        
        server.request(url:url)
        {
            (data, nsError) in
            
            guard data != nil,
                  let hero: Hero = server.decodeObject(data: data!) else { return }
            
            self.heroes.append(hero)
            
            if self.currentHeroID == last{
                self.groupHeroes.append(self.heroes)
            }
            
            self.currentHeroID += 1
            self.tvHeroes.reloadData()
            
        }
    }
    
    @objc func refresh(_ sender: AnyObject) {
        self.loadMoreHeroes(startValue: self.currentHeroID )
    }
    
    @objc func openSearchView(){
        navigationController?.pushViewController(SearchHeroVC(), animated: true)
    }
}


//MARK: Delegates
extension HeroesVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.safeAreaLayoutGuide.layoutFrame.width/2.5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupHeroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroesTVCell",
                                                 for: indexPath) as! HeroesTVCell
        cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
        cell.cvHeroes.reloadData()
        
        return cell
    }
}

extension HeroesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       return groupHeroes[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroCVCell", for: indexPath) as! HeroCVCell
        
        let hero = groupHeroes[collectionView.tag][indexPath.row]
        
        cell.lblName.text = hero.name
        if let url = URL(string:hero.image?.url ?? ""){
            cell.imvHeroe.kf.setImage(with: url)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailHeroVC()
        vc.hero = groupHeroes[collectionView.tag][indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HeroesVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.safeAreaLayoutGuide.layoutFrame.size.width/2.5
        
        return CGSize(width: width, height: width)
    }
    
}
