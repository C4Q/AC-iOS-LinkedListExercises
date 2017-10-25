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
    
    var count: Int? {
        var counter: Int? = 0
        var currentNode = head
        while currentNode != nil {
            counter! += 1
            currentNode = currentNode?.next
        }
        return counter}
    
    func append(element newKey: T) {
        var currentNode = head
        let newNode = Node(key: newKey)
        while currentNode!.next != nil {
            currentNode = currentNode!.next
        }
        currentNode!.next = newNode
    }
    
    func getNode(at index: Int) -> Node<T>? {
        var currentNode = head
        var counter = 0
        while currentNode != nil {
            if index == counter {
                return currentNode!
            } else {
                counter += 1
                currentNode = currentNode!.next
            }
        }
        return nil
    }
    
    func contains(element targetKey: T) -> Bool {
        var currentNode = head
        while currentNode != nil {
            if targetKey == currentNode!.key {
                return true
            } else {
                currentNode = currentNode!.next
            }
        }
        return false
    }
    
    
    func equals(otherList: LinkedList<T>) -> Bool {
        var currentNode = head
        var otherListCurrentNode = otherList.head
        while currentNode != nil && otherListCurrentNode != nil {
            if currentNode!.key == otherListCurrentNode!.key {
                currentNode = currentNode!.next
                otherListCurrentNode = otherListCurrentNode!.next
                return true
            } else {
                return false
            }
        }
        return false
    }
    
    func toArr() -> [T] {
        var currentNode = head
        var newArr: [T] = []
        while currentNode != nil {
            newArr.append(currentNode!.key)
            currentNode = currentNode?.next
        }
        return newArr
    }
    
    func reversed() -> LinkedList<T> {
        var currentNode = head
        var newArr: [T] = []
        while currentNode != nil {
            newArr.append(currentNode!.key)
            currentNode = currentNode!.next
        }
        var newLinkedList = LinkedList()
        var newCurrentNode = newLinkedList.head
        while currentNode != nil {
            for index in 0..<newArr.count + (count! - 1) {
              newCurrentNode = newArr[index!.]
                newCurrentNode = newCurrentNode!.next
        }
            return newLinkedList
    }
        

        
        
        return LinkedList<T>()
    }
    
    func removeAll() {}
    
    //Challenge Questions
    func removeDuplicatesFromSortedList() {}
    
    static func mergeSortedLists<T>(listOne: LinkedList<T>, listTwo: LinkedList<T>) -> LinkedList<T> {
        return LinkedList<T>()
    }
    
    
    
    
}

