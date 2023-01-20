//
//  DrawerMenuViewController.swift
//  ituneMovie
//
//  Created by Giap on 13/12/2022.
//

import UIKit

class DrawerMenuViewController: UIViewController {
    
    var delegate: movieViewControllerDelegate?
    
    @IBAction func favouriteMoviesButton(_ sender: Any) {
        
        weak var pvc = self.presentingViewController

        self.dismiss(animated: true, completion: {
            let storyboard = UIStoryboard(name: "FavouriteMovieListViewController", bundle: nil)
            guard let favourtieMovieListController = storyboard.instantiateViewController(withIdentifier: "FavouriteMovieListViewController") as? FavouriteMovieListViewController else {
                return
            }
            
            favourtieMovieListController.delegate = self.delegate
            
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
