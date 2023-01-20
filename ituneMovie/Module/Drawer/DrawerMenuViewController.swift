//
//  DrawerMenuViewController.swift
//  ituneMovie
//
//  Created by Giap on 13/12/2022.
//

import UIKit

class DrawerMenuViewController: UIViewController {
    
    
    var delegate: movieViewControllerDelegate?
    var delegate2: MovieDelegate?
    
    @IBAction func favouriteMoviesButton(_ sender: Any) {
        
        weak var pvc = self.presentingViewController

        self.dismiss(animated: true, completion: {
//            let favourtieMovieListController = FavouriteMovieListViewController()
//            let favourtieMovieListController = self.childViewControllers[0] as FavouriteMovieListViewController
            
//            self.delegate?.testNav()
//            self.delegate2?.hehe()
            
            let storyboard = UIStoryboard(name: "FavouriteMovieListViewController", bundle: nil)
//            let favourtieMovieListController = storyboard.instantiateViewController(withIdentifier: "FavouriteMovieListViewController")
//            let favourtieMovieListController = storyboard.instantiateViewController(withIdentifier: "FavouriteMovieListViewController") as? FavouriteMovieListViewController
//
////            let favourtieMovieListController = self.storyboard?.instantiateViewController(withIdentifier: "FavouriteMovieListViewController") as! FavouriteMovieListViewController
//            favourtieMovieListController.modalPresentationStyle = .overFullScreen
//            favourtieMovieListController.modalTransitionStyle = .crossDissolve
//
//
//            favourtieMovieListController.delegate = self.delegate
//            favourtieMovieListController.delegate2 = self.delegate2
////            let nav = UINavigationController(rootViewController: favourtieMovieListController)
////            nav.delegate = self.delegate
////            nav.delegate2 = self.delegate2
////            return nav
//            pvc?.present(favourtieMovieListController, animated: true, completion: nil)
////            pvc?.present(nav, animated: true, completion: nil)
////            print(self.navigationController)
            
            guard let favourtieMovieListController = storyboard.instantiateViewController(withIdentifier: "FavouriteMovieListViewController") as? FavouriteMovieListViewController else {
                return
            }
            
//            favourtieMovieListController.modalPresentationStyle = .overFullScreen
//            favourtieMovieListController.modalTransitionStyle = .crossDissolve
            
            
            favourtieMovieListController.delegate = self.delegate
            favourtieMovieListController.delegate2 = self.delegate2
            let nav = UINavigationController(rootViewController: favourtieMovieListController)
            nav.modalPresentationStyle = .overFullScreen
            nav.modalTransitionStyle = .crossDissolve
            pvc?.present(nav, animated: true, completion: nil)
            
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
