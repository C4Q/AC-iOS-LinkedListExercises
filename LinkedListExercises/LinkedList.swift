//
//  LinkedList.swift
//  LinkedListExercises
//
//  Created by C4Q  on 10/24/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

public class Node<T: Equatable>: Equatable {
    public static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.key == rhs.key
    }
    
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

    var count: Int {
        var counter = 0
        var currentNode = head
        if head == nil {
            return 0
        }
        while currentNode != nil {
            currentNode = currentNode?.next
            counter += 1
        }
        return counter
    }
    
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
    
    func getNode(at index: Int) -> Node<T>? {
        guard index >= 0 else {return nil}
        guard index <= count - 1 else {return nil}
        var counter = 0
        var currentNode = head
        while counter < index {
            currentNode = currentNode?.next
            counter += 1
        }
        return currentNode
    }
    
    func contains(element targetKey: T) -> Bool {
        var currentNode = head
        while currentNode != nil {
            if currentNode?.key == targetKey {
                return true
            } else {
                currentNode = currentNode?.next
            }
        }
        return false
    }
    
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

