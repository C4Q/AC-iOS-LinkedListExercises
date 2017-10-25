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
        var counter = 0
        var currentNode = head
        while currentNode != nil {
            counter += 1
            currentNode = currentNode?.next // move to the next node
        }
        return counter
    }
    
  func append(element newKey: T){
        // insert a new key at head node
        guard newKey != nil else {
            let newNode = Node(key: newKey)
            newNode.next = self.head
            self.head = newNode
            return
        }
        //insert a new key
        var currentNode = head
        while currentNode != nil {
            if currentNode?.next == nil {
                //set the currentNode to be the newly inserted key of that node
                let newNode = Node(key: newKey)
                newNode.next = currentNode?.next
                currentNode!.next = newNode //inserting value here
                //return true
            }
            //moving to the next node
            currentNode = currentNode?.next
        }
        //return false
    }
    
    func getNode(at index: Int) -> Node<T>? {
        var current: (node: Node?, index: Int) = (head, 0)
//        var currentNode = head
//        var currentIndex = 0
        while current.node != nil {
            if current.index == index {
                return current.node
            }
            //moving to the next node
//            currentNode = currentNode!.next
//            currentIndex += 1
            current = (current.node?.next, current.index + 1)
        }
        return nil
    }
    
    func contains(element targetKey: T) -> Bool {
        var currentNode = head
        while currentNode != nil {
            if currentNode!.key == targetKey {
                return true
            }
            //moving to the next node
            currentNode = currentNode!.next //if not a number
        }
        return false
    }
    
    
    func equals(otherList: LinkedList<T>) -> Bool {
        var currentNode = head
        var otherCurrentNode = otherList.head
        var result = true
        while currentNode != nil && otherCurrentNode != nil{
            // if keys are equal , keep track and move to next node
            if currentNode!.key == otherCurrentNode?.key {
                 result = true
            } else {
                return false
            }
            //move to next node
            currentNode = currentNode!.next
            otherCurrentNode = otherCurrentNode!.next
        }
        
        if currentNode == nil && otherCurrentNode == nil {
            return result
        }
        return false
    }
    
    
    //build an array of [T]
    func toArr() -> [T] {
        // taking key of each node and appending into an arr
        var currentNode = head
        var myArr: [T] = []
        while currentNode != nil {
            myArr.append(currentNode!.key)
            currentNode = currentNode!.next
        }
        return myArr
    }
    
    
    func reversed() -> LinkedList<T> {
        //SLOW WAY
        //building new LinkedList
       let reversedList = LinkedList<T>()
//        let count = self.count
//        for index in 0..<count {
//            //sub from index looking at
//            let newKey = self.getNode(at: count - 1 - i)!.key
//            reversedList.append(element: newKey)
//        }
//        return reversedList
//
        //FAST WAY
        let reversedArr = self.toArr().reversed()
        for element in reversedArr {
            reversedList.append(element: element)
        }
        return reversedList
    }

    func removeAll() {
        self.head = nil
    }
    
    func reversed() {
        //reverse actual list and not change anything
        var previousNode: Node<T>? = nil
        var currentNode = head
        while currentNode != nil {
            let nextNode = currentNode!.next
            currentNode?.next = previousNode
            previousNode = currentNode
            currentNode = nextNode
        }
        self.head = previousNode
    }
    
//    //Challenge Questions
//        func removeDuplicatesFromSortedList(){
//            var currentNode = head
//            let linkedList = LinkedList()
//            while currentNode != nil {
//                if !linkedList.contains(element: (currentNode?.key)!) {
//                    linkedList.append(element: currentNode!.key)
//
//                }
//                currentNode = currentNode?.next
//            }
//            head = linkedList.head
//        }
//    }
//
//
//        static func mergeSortedLists(listOne: LinkedList<T>, listTwo: LinkedList<T>) -> LinkedList<T> {
//            let returnLinkList = LinkedList()
//            var listOneCurrentNode = listOne.head
//            var listTwoCurrentNode = listTwo.head
//
//            while listOneCurrentNode != nil || listTwoCurrentNode != nil {
//
//                if listOneCurrentNode == nil && listTwoCurrentNode != nil {
//                    while listTwoCurrentNode != nil {
//                        returnLinkList.append(element: (listTwoCurrentNode?.key)!)
//                        listTwoCurrentNode = listTwoCurrentNode?.next
//                    }
//                    return returnLinkList
//                }
//                if listOneCurrentNode != nil && listTwoCurrentNode == nil {
//                    while listOneCurrentNode != nil {
//                        returnLinkList.append(element: (listOneCurrentNode?.key)!)
//                        listOneCurrentNode = listOneCurrentNode?.next
//                    }
//                    return returnLinkList
//                }
//                if listOneCurrentNode!.key < listTwoCurrentNode!.key {
//                    returnLinkList.append(element: (listOneCurrentNode?.key)!)
//                    listOneCurrentNode = listOneCurrentNode?.next
//                } else {
//                    returnLinkList.append(element: (listTwoCurrentNode?.key)!)
//                    listTwoCurrentNode = listTwoCurrentNode?.next
//                }
//            }
//            return returnLinkList
//        }
//

}


