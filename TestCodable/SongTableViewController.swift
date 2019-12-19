//
//  SongTableViewController.swift
//  TestCodable
//
//  Created by Yvonne on 2019/12/11.
//  Copyright © 2019 Yvonne. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {
    
    var songs = [Song]()
    var number = 0

    override func viewDidLoad() {
        super.viewDidLoad()

     let urlStr = "https://itunes.apple.com/search?term=dido&media=music"
        if let url = URL(string: urlStr){
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                let decoder = JSONDecoder()
                if let data = data,let songResults = try?decoder.decode(SongResults.self, from: data){
                    self.songs = songResults.results
                    print("getsongs")
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
            task.resume()
            print ("iamhere")
        }
        
      
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! SongTableViewCell
//        if indexPath.row == 1{
//        number += 1
//        if number % 2 == 0{
//            cell.backgroundColor = UIColor.yellow
//        }else
//        {cell.backgroundColor = UIColor.red
//
//        }
//        }
            // Configure the cell...
        let song = songs[indexPath.row]
        cell.nameLabel.text = song.trackName
        cell.photoImage.image = nil
        
        let task = URLSession.shared.dataTask(with: song.artworkUrl100) { (data, respone, error) in
            if let data = data {
                DispatchQueue.main.async {
                    cell.photoImage.image = UIImage(data: data)
                }
            }
        }
        task.resume()

        return cell
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

    
    @IBSegueAction func showSongDetail(_ coder: NSCoder) -> SongDetailViewController? {
        if let row = tableView.indexPathForSelectedRow?.row{
            let song = songs[row]
            return SongDetailViewController(corder: coder, song: song)
        }else{
            return nil
        }
        
    }
    
    
}
