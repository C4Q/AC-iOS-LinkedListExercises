//
//  LinkedList.swift
//  LinkedListExercises
//
//  Created by C4Q  on 10/24/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

public class Node<T> {
    var key: T
    var next: Node?
    init(key: T) {
        self.key = key
    }
}

public class LinkedList<T: Equatable> {
    var head: Node<T>?
    func printAllKeys() {
        var currentNode = head
        while currentNode != nil {
            print(currentNode!.key)
            currentNode = currentNode?.next
        }
    }

    var count: Int {return 0}
    
    func append(element newKey: T) {}
    
    func getNode(at index: Int) -> Node<T>? {return nil}
    
    func contains(element targetKey: T) -> Bool {return false}
    
    func equals(otherList: LinkedList<T>) -> Bool {return true}
    
    func toArr() -> [T] {return Array<T>()}
    
    func reversed() -> LinkedList<T> {return LinkedList<T>()}
    
    func removeAll() {}
    
    //Challenge Questions
    func removeDuplicatesFromSortedList() {}
    
    static func mergeSortedLists(listOne: LinkedList<T>, listTwo: LinkedList<T>) -> LinkedList<T> {
        return LinkedList<T>()
    }
}

