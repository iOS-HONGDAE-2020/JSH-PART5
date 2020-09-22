//
//  firstTableViewController.swift
//  EcommerceApp
//
//  Created by 정수현 on 2020/09/22.
//  Copyright © 2020 정수현. All rights reserved.
//

import UIKit
import Alamofire

class firstTableViewController: UITableViewController {
    
    var movies: [Movie] = []
  
    let url = "http://connect-boxoffice.run.goorm.io/movies?order_type=0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
        
        // title
        titleChange(title: "예매율순")
        fetchMovies(urls: url)
       
        // rightBarButton
        let itemimage = UIImage(systemName: "gearshape.fill")
        let rightBarButton = UIBarButtonItem(image: itemimage, style: .plain, target: self, action: #selector(showActionsheet))
        self.navigationItem.rightBarButtonItem = rightBarButton
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //pageSort()
    }
    
    
    func titleChange(title: String) {
        self.navigationItem.title = title
    }
    
    //MARK: Actionsheet
    @objc func showActionsheet() {
        let actionsheet = UIAlertController(title: "정렬방식 선택", message: "영화를 어떤 순서로 정렬할까요", preferredStyle: .actionSheet)
        // 예매율
        actionsheet.addAction(UIAlertAction(title: "예매율", style: .default, handler: { action in
            self.titleChange(title: "예매율순")
            self.fetchMovies(urls: "http://connect-boxoffice.run.goorm.io/movies?order_type=0")
        }))
        // 큐레이션
        actionsheet.addAction(UIAlertAction(title: "큐레이션", style: .default, handler: {action in
            print("dismiss")
            self.titleChange(title: "큐레이션순")
            self.fetchMovies(urls: "http://connect-boxoffice.run.goorm.io/movies?order_type=1")
        }))
        // 개봉일
        actionsheet.addAction(UIAlertAction(title: "개봉일", style: .default, handler: {action in
            self.titleChange(title: "개봉일순")
            self.fetchMovies(urls: "http://connect-boxoffice.run.goorm.io/movies?order_type=2")
        }))
        // 취소
        actionsheet.addAction(UIAlertAction(title: "취소", style: .cancel, handler: {action in
            print("tapped")

        }))

        present(actionsheet, animated: true)
    }
    
    //MARK: Alamofire
    func fetchMovies(urls: String) {
        AF.request(urls).validate()
            .responseDecodable(of: Movies.self) { [self] (response) in
            guard let movies = response.value else { return }
            self.movies = movies.all
            tableView.reloadData()
          }
        
        print(movies.count)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell {
            cell.movie = self.movies[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
