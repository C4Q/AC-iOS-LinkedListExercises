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
    var tail: Node<T>?
    
    func printAllKeys() {
        var currentNode = head
        while currentNode != nil {
            print(currentNode!.key)
            currentNode = currentNode?.next
        }
    }

    var count: Int {
        var count = 0
        var currentNode = head
        while currentNode != nil {
            currentNode = currentNode?.next
            count += 1
        }
        return count
    }
    
    func append(element newKey: T) {
        var currentNode = head
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        currentNode?.next = Node(key: newKey)
    }
    
    func getNode(at index: Int) -> Node<T>? {
        var counter = 0
        var currentNode = head
        
        while counter < index {
            counter += 1
            currentNode = currentNode?.next
        }
        return currentNode
    }
    
    func contains(element targetKey: T) -> Bool {
        var currentNode = head
        while currentNode != nil {
            if currentNode!.key == targetKey { return true }
            currentNode = currentNode?.next
        }
        return false
    }
    
    func equals(otherList: LinkedList<T>) -> Bool {
    let mainList = self
    var currentNode = mainList.head
    var otherCurrentNode = otherList.head
        var boolbaby = false
        while currentNode != nil && otherCurrentNode != nil {
            currentNode = currentNode?.next
            otherCurrentNode = otherCurrentNode?.next
            if currentNode?.key == otherCurrentNode?.key {
            boolbaby = true
            } else {
                boolbaby = false
            }
        }
        return boolbaby
    }
        
    
    func toArr() -> [T] {
        var arr: Array<T> = []
        var currentNode = head
        while currentNode != nil {
            arr.append(currentNode!.key)
            currentNode = currentNode?.next
        }
        return arr
    }
    
    func reversed() -> LinkedList<T> {
    var revList = LinkedList<T>()
    var currentNode = head
    while currentNode != nil {
    revList.head = currentNode
    currentNode = currentNode?.next
    }
    return revList
    }
    
    
    
    func removeAll() {
        head = nil
        tail = nil
    }
    
    //Challenge Questions
    func removeDuplicatesFromSortedList() {}
    
    static func mergeSortedLists(listOne: LinkedList<T>, listTwo: LinkedList<T>) -> LinkedList<T> {return LinkedList<T>()}
    
    
//    {
//        var currentNode = listTwo.head
//        while currentNode != nil {
//            listOne.append(element: currentNode!.key)
//       currentNode = currentNode?.next
//    }
//        return listOne
//}
}
