//
//  TableXibViewController.swift
//  HeroDatabase
//
//  Created by Eduardo Martinez on 01/06/21.
//

import UIKit

class TableXibViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data  = [String](){
        didSet{
            tableView.reloadData()
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "XibImageTableViewCell", bundle: nil), forCellReuseIdentifier: "XibImageTableViewCell")
        tableView.register(UINib(nibName: "XIbTableViewCell", bundle: nil), forCellReuseIdentifier: "XIbTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [unowned self] in
            self.data = ["carlos pineda roman torres carlos pineda roman torrescarlos pineda roman torrescarlos pineda roman torrescarlos pineda roman torres","sofia","melani carlos pineda roman torres carlos pineda roman torrescarlos pineda roman torrescarlos pineda roman torrescarlos pineda roman torres","mario","darian martinez contreras"]
        }
        
    }

}

extension TableXibViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row != 3{
        let cell = tableView.dequeueReusableCell(withIdentifier: "XIbTableViewCell", for: indexPath) as! XIbTableViewCell
        
        cell.labelTitle.text = data[indexPath.row]
        
        return cell
        }else{
        let cell = tableView.dequeueReusableCell(withIdentifier: "XibImageTableViewCell", for: indexPath) as! XibImageTableViewCell
        
        cell.labelTitle.text = data[indexPath.row]
        
        return cell
        }
    }
    
    
}
