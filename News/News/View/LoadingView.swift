//
//  LoadingView.swift
//  News
//
//  Created by Alper Ban on 16.05.2023.
//

import UIKit

class LoadingView{
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    static let shared = LoadingView()
    var blurView: UIVisualEffectView = UIVisualEffectView()
    
    private init() {
        
    }
    
    func configure() {
        blurView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.frame = UIWindow(frame: UIScreen.main.bounds).frame
        activityIndicator.center = blurView.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        blurView.contentView.addSubview(activityIndicator)
    }
    func startLoading() {
        UIApplication.shared.windows.first?.addSubview(blurView)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        blurView.removeFromSuperview()
        activityIndicator.stopAnimating()
    }
    
}
