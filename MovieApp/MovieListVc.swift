//
//  ViewController.swift
//  MovieApp
//
//  Created by Elena Džojić on 10/04/2020.
//  Copyright © 2020 Stjepan Dzojic. All rights reserved.
//

import UIKit

import UIKit

class MovieListVc: UIViewController {
    
    var tableView = UITableView()
    
    let indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    
    private var dataSource = [MovieListNeeded]()
    private let networkManager: NetworkManager

    override func viewDidLoad() {
        
        getData()
        //getDataGenre()
        tableView.backgroundColor = .init(red: 0.221, green: 0.221, blue: 0.221, alpha: 1)
        super.viewDidLoad()
        configureTableView()
        setupTableView()
    }
    
    init(networkManager: NetworkManager){
        self.networkManager = networkManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getData(){
        //indicator.startAnimating()
        networkManager.getData(from: "https://api.themoviedb.org/3/movie/now_playing") { [unowned self](movieList) in
            //self.indicator.stopAnimating()
            if let safeMovieList = movieList{
                self.dataSource = self.createScreenData(from: safeMovieList)
                self.tableView.reloadData()
            }else{
                
            }
        }
    }
    
    /*func getDataGenre(){
        //indicator.startAnimating()
        networkManager.getData(from: "https://api.themoviedb.org/3/movie/338762") { [unowned self](genre) in
            //self.indicator.stopAnimating()
            if let safeGenre = genre{
                self.dataSource = self.createScreenData(from: safeGenre)
                self.tableView.reloadData()
            }else{
                
            }
        }
    }*/
    
    private func createScreenData(from data: [MovieList]) -> [MovieListNeeded]{
            return data.map { (data) -> MovieListNeeded in
                let year = DateUtils.getYearFromDate(stringDate: data.releaseDate)
                return MovieListNeeded(id: data.id,
                                        title: data.originalTitle,
                                        description: data.overview,
                                        imageURL: data.posterPath,
                                        year: year
                                        )
   
            }
        }
    
    
    
    
    func configureTableView(){
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        tableView.estimatedRowHeight = 155
        tableView.rowHeight = UITableView.automaticDimension
    
        
    
    }
    
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupTableView(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
        
    

}

extension MovieListVc: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        let movie = dataSource[indexPath.row]
        cell.set(movie: movie)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = dataSource[indexPath.row]
        let vc = MovieDescriptionVC()
        vc.titleText = item.title
        vc.image = item.imageURL
        //vc.genreText = item.genre
        //vc.directorText = item.director
        vc.descriptionText = item.description
        
        //puno mi je bolja kak su ostali to napravili pa cu pitat da mi
        //objasne, jer ovaj moj nacin nije bas najbolji
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


