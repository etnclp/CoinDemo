//
//  SpecialCell.swift
//  CoinDemo
//
//  Created by Erdi Tunçalp on 2.09.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

public protocol SpecialCell: class {
    
    static var Identifier: String { get set }
    
    static var Nib: UINib { get }
    
    static var Height: CGFloat { get set }
    
    static var EstimatedHeight: CGFloat { get set }
    
    static var Size: CGSize { get set }
    
    static func register(to tableView: UITableView) -> Void
    
    static func register(to collectionView: UICollectionView) -> Void
    
}

public extension SpecialCell where Self: UITableViewCell {
    
    static var Identifier: String {
        get { return String(describing: self).lowercaseFirstLetter() }
        set { Identifier = newValue }
    }
    
    static var Nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
    
    static var EstimatedHeight: CGFloat {
        get { return UITableView.automaticDimension }
        set { EstimatedHeight = newValue }
    }
    
    static var Size: CGSize {
        get { return CGSize(width: 0, height: 0)  }
        set { }
    }
    
    static func register(to tableView: UITableView) {
        tableView.register(self)
    }
    
    static func register(to collectionView: UICollectionView) {
    }
    
}

public extension SpecialCell where Self: UICollectionViewCell {
    
    static var Identifier: String {
        get { return String(describing: self).lowercaseFirstLetter() }
        set { Identifier = newValue }
    }
    
    static var Nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
    
    static var Height: CGFloat {
        get { return 0 }
        set {  }
    }
    
    static var EstimatedHeight: CGFloat {
        get { return 0 }
        set {  }
    }
    
    //@available(*, unavailable)
    static func register(to tableView: UITableView) {
    }
    
    static func register(to collectionView: UICollectionView) {
        collectionView.register(self)
    }
    
}

extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) where T: SpecialCell {
        register(T.Nib, forCellReuseIdentifier: T.Identifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: SpecialCell {
        guard let cell = dequeueReusableCell(withIdentifier: T.Identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.Identifier)")
        }
        
        return cell
    }
    
    func dequeueReusableCell(cellType: SpecialCell.Type, indexPath: IndexPath) -> UITableViewCell {
        return self.dequeueReusableCell(withIdentifier: cellType.Identifier, for: indexPath)
    }
    
}

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_: T.Type) where T: SpecialCell {
        register(T.Nib, forCellWithReuseIdentifier: T.Identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: SpecialCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.Identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.Identifier)")
        }
        
        return cell
    }
    
}

fileprivate extension String {
    
    func lowercaseFirstLetter() -> String {
        return prefix(1).lowercased() + dropFirst()
    }
    
}

extension Reactive where Base: UITableView {
    
    public func items<S: Sequence, Cell: UITableViewCell, O : ObservableType>(cellType: Cell.Type = Cell.self)
        -> (_ source: O)
        -> (_ configureCell: @escaping (Int, S.Iterator.Element, Cell) -> Void)
        -> Disposable
        where O.E == S, Cell: SpecialCell {
            return self.items(cellIdentifier: Cell.Identifier, cellType: Cell.self)
    }
    
}

extension Reactive where Base: UICollectionView {
    
    public func items<S: Sequence, Cell: UICollectionViewCell, O : ObservableType>(cellType: Cell.Type = Cell.self)
        -> (_ source: O)
        -> (_ configureCell: @escaping (Int, S.Iterator.Element, Cell) -> Void)
        -> Disposable
        where O.E == S, Cell: SpecialCell {
            return self.items(cellIdentifier: Cell.Identifier, cellType: Cell.self)
    }
    
}
