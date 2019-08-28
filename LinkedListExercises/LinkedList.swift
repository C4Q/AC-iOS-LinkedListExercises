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
    var next: Node<T>?
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
    
    func append(element newKey: T) {
        var currentNode = head
        if currentNode == nil {
            head = Node(key: newKey)
            return
        }
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        currentNode?.next = Node(key: newKey)
    }
    
    func getNode<T>(at index: Int) -> Node<T>? {return nil}
    
    func contains<T>(element targetKey: T) -> Bool {return false}
    
    func equals<T>(otherList: LinkedList<T>) -> Bool {return true}
    
    func toArr<T>() -> [T] {return Array<T>()}
    
    func reversed<T>() -> LinkedList<T> {return LinkedList<T>()}
    
    func removeAll() {}
    
    //Challenge Questions
    func removeDuplicatesFromSortedList() {}
    
    static func mergeSortedLists<T>(listOne: LinkedList<T>, listTwo: LinkedList<T>) -> LinkedList<T> {
        return LinkedList<T>()
    }
    
    


}

