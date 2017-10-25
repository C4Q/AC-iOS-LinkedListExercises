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

    var count: Int {
        var currentNode = head
        var total = 0
        while currentNode != nil {
            total += 1
            currentNode = currentNode?.next
        }
        return total
    }
    
    func append(element newKey: T) {
        guard self.count != 0 else {
            self.head = Node(key: newKey)
            return
        }
        getNode(at: count - 1)?.next = Node(key: newKey)
    }
    
    func getNode(at index: Int) -> Node<T>? {
        guard index >= 0 else {
            return nil
        }
        var current: (node: Node?, index: Int) = (self.head, 0)
        while current.index != index {
            if current.node == nil {
                return nil
            }
            current.node = current.node?.next
            current.index += 1
        }
        return current.node
    }
    
    func contains(element targetKey: T) -> Bool {
        var currentNode: Node<T>? = head
        while currentNode != nil {
            if currentNode!.key == targetKey {
                return true
            }
            currentNode = currentNode!.next
        }
        return false
    }
    
    func equals(otherList: LinkedList<T>) -> Bool {
        guard self.count == otherList.count else {
            return false
        }
        var thisCurrentNode = self.head
        var otherCurrentNode = otherList.head
        
        while thisCurrentNode != nil {
            if thisCurrentNode!.key != otherCurrentNode!.key {
                return false
            }
            thisCurrentNode = thisCurrentNode!.next
            otherCurrentNode = otherCurrentNode!.next
        }
        return true
    }
    
    func toArr() -> [T] {
        var arr = [T]()
        var currentNode = self.head
        while currentNode != nil {
            arr.append(currentNode!.key)
            currentNode = currentNode!.next
        }
        return arr
    }
    
    func reversed<C: Comparable>() -> LinkedList<C> {
        let cList = self as? LinkedList<C>
        var arr = Array(cList!.toArr().reversed())
        
        let newList = LinkedList<C>()
        newList.head = Node<C>(key: arr[0])
        var currentNode = newList.head
        
        for i in 1..<self.count {
            currentNode!.next = Node(key: arr[i])
            currentNode = currentNode!.next
        }
        
        return newList
    }
    
    func removeAll() {
        self.head = nil
    }
    
    
    //Challenge Questions
    func removeDuplicatesFromSortedList() {
        var keys: Array<T> = Array<T>()
        
        var currentNode = self.head
        var previousNode: Node<T>?
        
        while currentNode != nil {
            if keys.contains(currentNode!.key) {
                previousNode?.next = currentNode!.next
            } else {
                keys.append(currentNode!.key)
                previousNode = currentNode
            }
            currentNode = currentNode!.next
        }
    }
    
    static func mergeSortedLists<C: Comparable>(listOne: LinkedList<C>, listTwo: LinkedList<C>) -> LinkedList<C> {
        let arr1 = listOne.toArr()
        let arr2 = listTwo.toArr()
        var arrMergeSorted = arr1 + arr2
        arrMergeSorted.sort(by: {$0 < $1})
        
        
        let newList = LinkedList<C>()
        newList.head = Node<C>(key: arrMergeSorted[0])
        var currentNode = newList.head
        
        
        for i in 1..<arrMergeSorted.count {
            currentNode?.next = Node<C>(key: arrMergeSorted[i])
            currentNode = currentNode?.next
        }
        
        return newList
    }
}

