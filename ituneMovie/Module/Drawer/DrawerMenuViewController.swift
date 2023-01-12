//
//  DrawerMenuViewController.swift
//  ituneMovie
//
//  Created by Giap on 13/12/2022.
//

import UIKit

class DrawerMenuViewController: UIViewController {
    
    
    
    @IBAction func favouriteMoviesButton(_ sender: Any) {
        
        weak var pvc = self.presentingViewController

        self.dismiss(animated: true, completion: {
//            let favourtieMovieListController = FavouriteMovieListViewController()
//            let favourtieMovieListController = self.childViewControllers[0] as FavouriteMovieListViewController
            
            
            let storyboard = UIStoryboard(name: "FavouriteMovieListViewController", bundle: nil)
            let favourtieMovieListController = storyboard.instantiateViewController(withIdentifier: "FavouriteMovieListViewController")
            
//            let favourtieMovieListController = self.storyboard?.instantiateViewController(withIdentifier: "FavouriteMovieListViewController") as! FavouriteMovieListViewController
            favourtieMovieListController.modalPresentationStyle = .overFullScreen
            favourtieMovieListController.modalTransitionStyle = .crossDissolve
//            let nav = UINavigationController(rootViewController: favourtieMovieListController)
//            return nav
            pvc?.present(favourtieMovieListController, animated: true, completion: nil)
//            pvc?.present(nav, animated: true, complextion: nil)
        })
        
    }
    
    let transitionManager = DrawerTransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .custom
        transitioningDelegate = transitionManager
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
