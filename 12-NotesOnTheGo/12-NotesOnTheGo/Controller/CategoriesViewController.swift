//
//  ViewController.swift
//  12-NotesOnTheGo
//
//  Created by Carlos Daniel Pedrerol on 17/2/21.
//

import UIKit

class CategoriesViewController: UICollectionViewController {
    
    let categoriesArray = ["Compras", "Tareas de la casa", "Ocio"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
//MARK:- Métodos De Collection View Data Source
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
        
        cell.categoryLabel.text = categoriesArray[indexPath.row]
        
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowNoteList", sender: self)
    }
}

