//
//  BaseCoordinator.swift
//  TextFieldsCatalog
//
//  Created by Александр Чаусов on 23/01/2019.
//  Copyright © 2019 Александр Чаусов. All rights reserved.
//

import Foundation

/// Provides base realisation of coordinator's methods
/// Subclass from this base class for making new flow coordinator
class BaseCoordinator: Coordinator {

    // MARK: - Properties
    var childCoordinators: [Coordinator] = []

    func start() {
        start(with: nil)
    }

    func start(with deepLinkOption: DeepLinkOption?) { }

    // add only unique object
    func addDependency(_ coordinator: Coordinator) {
        guard !haveDependency(coordinator) else {
            return
        }
        childCoordinators.append(coordinator)
    }

    func removeDependency(_ coordinator: Coordinator?) {
        guard
            !childCoordinators.isEmpty,
            let coordinator = coordinator
            else { return }

        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }

    func removeAllChilds() {
        guard
            !childCoordinators.isEmpty
            else { return }

        for coordinator in childCoordinators {
            if let coordinator = coordinator as? BaseCoordinator {
                coordinator.removeAllChilds()
            }
        }

        childCoordinators.removeAll()
    }

    // MARK: - Private methods

    private func haveDependency(_ coordinator: Coordinator) -> Bool {
        for element in childCoordinators {
            if element === coordinator {
                return true
            }
        }
        return false
    }

}
