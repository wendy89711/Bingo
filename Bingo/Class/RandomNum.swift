//
//  RandomNum.swift
//  Bingo
//
//  Created by 吳佩玟 on 2022/2/8.
//

import Foundation

class RandomNum {
    
    var array = [Int] ()
    
    func getNums() -> Array<Int> {
        
        for _ in 1...9 {
            var randomInt = Int.random(in: 1..<10)
            
            repeat {
                randomInt = Int.random(in: 1..<10)
                //                print(randomInt)
                //                print(array.count)
            } while array.contains(randomInt)
            
            array.append(randomInt)
            //            print(array)
        }
        
        return array
    }
    
    var nowArr = [Int] ()
    
    func presentNum() -> Array<Int> {
        
        
        for _ in 1...9 {
            var num = Int.random(in: 1..<10)
            
            repeat {
                num = Int.random(in: 1..<10)
            } while nowArr.contains(num)
            
            nowArr.append(num)
            
        }
        return nowArr
    }
}
