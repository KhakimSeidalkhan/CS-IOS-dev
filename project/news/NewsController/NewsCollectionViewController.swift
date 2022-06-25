//
//  NewsCollectionViewController.swift
//  project
//
//  Created by Khakim on 03.02.2022.
//

import UIKit
import CoreData

private let reuseIdentifier = "Cell"

class NewsCollectionViewController: UICollectionViewController {

    var news: [News] = []

    //var newsList: [NewsModel] = [.init(groupImageName: "naruto", groupName: "Naruto fan", timeReated: "12.12.1212", newsText: "Chleni akatsuki", newsPhto: ["bts", "naruto", "itachi"])]

    override func viewDidLoad() {
        createNews()
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        register()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCellId", for: indexPath) as! NewsCollectionViewCell
        cell.setData(news[indexPath.row])
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

private extension NewsCollectionViewController{
    
    func register() {
        collectionView.register(NewsCollectionViewCell.nib(), forCellWithReuseIdentifier: "NewsCollectionViewCellId")
    }

    func createNews() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        let new = News(entity: News.entity(), insertInto: context)

        let newsName = "name"
        let newsPhoto = "photo"
        let newsLogo = "logo"
        let newsText = "text"
        let newsLikeCounted = "like_counter"

        new.setValue("Naruto", forKey: newsName)
        new.setValue("naruto", forKey: newsPhoto)
        new.setValue("naruto", forKey: newsLogo)
        new.setValue("Jenchuriki", forKey: newsText)
        new.setValue(0, forKey: newsLikeCounted)

        do {
            try context.save()
            news.append(new)
        } catch let error {
            debugPrint("Could not save", error)
        }
    }

    func fetchData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            let result = try context.fetch(News.fetchRequest())
            news = result as! [News]
        } catch let error {
            debugPrint("Could not save", error)
        }
    }

}
