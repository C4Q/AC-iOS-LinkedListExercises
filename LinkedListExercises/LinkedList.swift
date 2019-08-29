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
    weak var previous: Node?
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
        var count = 0
        var currentNode = head
        while currentNode != nil {
            currentNode = currentNode?.next
            count += 1
        }
        return count}
    
    func append(element newKey: T) {
        
        var currentNode = head
        if head == nil {
            head = Node(key: newKey)
            return
        }
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        currentNode?.next = Node(key: newKey)
    }
    
    func getNode(at index: Int) -> Node<T>? {
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
            if currentNode?.key == targetKey {return true}
            currentNode = currentNode?.next
        }
        return false
    }
    
    func equals(otherList: LinkedList<T>) -> Bool {
        guard self.count == otherList.count else {
            return false
        }
        var selfCurrentNode: Node? = self.head
        var otherCurrentNode: Node? = otherList.head
        while selfCurrentNode?.key != nil {
            if selfCurrentNode?.key != otherCurrentNode?.key {
                return false
            } else {
                selfCurrentNode = selfCurrentNode?.next
                otherCurrentNode = otherCurrentNode?.next
            }
        }
        return true
    }
    
    func toArr() -> [T] {
        var currentNode = head
        var newArray = [T]()
        
        while currentNode != nil {
            newArray.append(currentNode!.key)
            currentNode = currentNode?.next
        }
        
        return newArray}
    
//    public func reverse() {
//        var node = head
//        tail = node // If you had a tail pointer
//        while let currentNode = node {
//            node = currentNode.next
//            swap(&currentNode.next, &currentNode.previous)
//            head = currentNode
//        }
//    }
    
    func reversed() -> LinkedList<T> {
        var linkedList = self
        var node = linkedList.head
        while let currentNode = node {
            node = currentNode.next
            swap(&currentNode.next, &currentNode.previous)
            head = currentNode
        }
        
        return linkedList
        
    }
    
    func removeAll() {
        
        
    }
    
    //Challenge Questions
    func removeDuplicatesFromSortedList() {}
    
    static func mergeSortedLists(listOne: LinkedList<T>, listTwo: LinkedList<T>) -> LinkedList<T> {
        return LinkedList<T>()
    }
}
