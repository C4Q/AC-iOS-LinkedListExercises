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

public class LinkedList<T: Comparable > {
    var head: Node<T>?
    func printAllKeys() {
        var currentNode = head
        while currentNode != nil {
            print(currentNode!.key)
            currentNode = currentNode?.next
        }
    }
    
    //DONE
    var count: Int {
        var listCount = 0
        var currentNode = head
        while currentNode != nil {
            listCount += 1
            currentNode = currentNode?.next
        }
        return listCount
    }
    
    func append(element newKey: T) {
        //add at the end of linked list
        
        //if list is empty
        if self.count == 0 {
            //establish the key as the head
            self.head = Node(key: newKey)
            return
        }
        
        var currentNode = head
        
        while currentNode!.next != nil { //if there is a next value, move on to it
            currentNode = currentNode!.next //moves to the next node
        } //if there is no next node
        currentNode!.next = Node(key: newKey)
    }

    
    //ask for help
    func getNode(at index: Int) -> Node<T>? {
        var current: (node: Node<T>?, index: Int) = (head, 0)
        while current.node != nil {
            if current.index == index { //if current index is the one you want
                return current.node
            }
            //otherwise, keep iterating through nodes
            current = (current.node!.next, current.index + 1)
        }
        //if it iterates through all the nodes and no index matches (no node exists at that index, it'll return a nil)
        return nil
    }
    
    func contains(element targetKey: T) -> Bool {
        var current = head
        
        while current != nil {
            //if current key is target key, return true
            if current?.key == targetKey {
                return true
            } else {
                //otherwise, move to the next node
                current = current?.next
            }
        }
        //if you moved through all the nodes (one after last will be made nil, so it'll break out of the while loop), and no keys matched, return false
        return false
    }
    
    func equals(otherList: LinkedList<T>) -> Bool {
        //if both lists are of different sizes (like one list has (1,2,3) and the other has (1,2,3,4), that's false because that's not truly equal
        guard self.count == otherList.count else {
            return false
        }

        var currentListNode = self.head
        var otherListNode = otherList.head
        
        //iterate through both of them and compare their nodes
        while currentListNode != nil && otherListNode != nil {
            if currentListNode!.key != otherListNode!.key {
                //if they have keys that are not equal, return false
                return false
            } else {
                //if the current keys are equal, move on to the next set of keys
                currentListNode = currentListNode!.next
                otherListNode = otherListNode!.next
            }
        }
        //if all conditions above are true, then this is true
        return true
    }
    
    //converts all of the keys of any type into a single array of that type
    func toArr() -> [T] {
        //empty array to hold the values of all the keys
        var finalArr = Array<T>()
        //keep track of which node you're on
        var currentNode = head
        
        while currentNode != nil {
            //add key of current node to empty array
            finalArr.append(currentNode!.key)
            //move to next node
            currentNode = currentNode!.next
        }
        
        //when currentNode is nil (you've gone through all nodes), return the array
        return finalArr
    }
    
    //Ask for help
    //returns the list, but reversed
    func reversed() -> LinkedList<T> {
        //reversed means it'll return a new list
        let reversedList = LinkedList<T>()
        //ben's way - SLOW WAY
//        let listCount = self.count
//        for index in 0..<listCount {
//            let newKey = self.getNode(at: listCount - 1 - index)?.key
//            reversedList.append(element: newKey!)
//        }
//        return reversedList
        
        //we can also do
        let reversedArr = self.toArr().reversed()
        for element in reversedArr {
            reversedList.append(element: element)
        }
        return reversedList
    }
    
    //remove all the nodes from the list
    func removeAll() {
        self.head = nil
    }
    
    
    //try to understand this!!!
    func reverse() {
        var previousNode: Node<T>? = nil
        var currentNode = head //start with head
        while currentNode != nil {
            
            //if you have list of: A -> B -> C
            //right now:
            //previousNode = nil
            //currentNode = head
            //nextNode = head.next (B)
            //currentNode?.next (head -> B, or A) = previousNode (nil) //making head point to nil
                //so now you got nil <- A B -> C
                //currentNode?.next = nil
            //previousNode (nil) = currentNode (head)
                //previousNode = A
            //currentNode (head) = B //so it moves
            let nextNode = currentNode?.next //stores the next node so that you can change it too
            currentNode?.next = previousNode //make the current node point to the node before it (previous node) - has successfully changed the direction of reference of current node to the node behind it (from the node in front of it)
            //now you need to move to the next node to have it point "backwards"
            previousNode = currentNode //moves to the next node as the previous node
            currentNode = nextNode //makes currentNode move to next node
        }
        //when the above finishes, previousNode will be the last one (C), and currentNode will be nil
        self.head = previousNode //after all the nodes point in the opposite way (currently the head is still A), only its .next reference has changed, you need to reset the head to be the last node of the unreversed list
    }
    
    
    
    //Challenge Questions
    func removeDuplicatesFromSortedList() {
        let mergedArray = self.toArr().sorted{(number1: T, number2: T) -> Bool in
             return number1 < number2
            }

        var noDupeArray: [T] = []
        let noDupeList = LinkedList<T>()
        for number in 0..<mergedArray.count {
            if !noDupeArray.contains(mergedArray[number]) {
                noDupeArray.append(mergedArray[number])
                noDupeList.append(element: mergedArray[number])
            }
        }
        self.head = noDupeList.head
    }
    
    
    //need help understanding why I would need to add <T: Comparable> to the function, since the class definition of LinkedLists only had T: Equatable; does doing T: Comparable make all the properties of the class type it's being called on comparable?
    static func mergeSortedLists<T>(listOne: LinkedList<T>, listTwo: LinkedList<T>) -> LinkedList<T> {
        let mergedArray = (listOne.toArr() + listTwo.toArr()).sorted{$0 < $1}
        let mergedSortedList = LinkedList<T>()
        
        for number in 0..<mergedArray.count {
            mergedSortedList.append(element: mergedArray[number])
        }
        
        return mergedSortedList
        
        
//        guard let comparableListOne = listOne as? LinkedList<C>, let comparableListTwo = listTwo as? LinkedList<C> else {
//            return LinkedList<C>()
//        }
//        let mergedArray = Array<C>((comparableListOne.toArr() + comparableListTwo.toArr()).sorted{$0 < $1})
//        let mergedList = LinkedList<C>()
//
//        for index in 0..<mergedArray.count {
//            mergedList.append(element: mergedArray[index])
//        }
//        return mergedList
    }

}

