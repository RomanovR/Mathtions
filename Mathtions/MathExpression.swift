//
//  Model.swift
//  Mathtions
//
//  Created by xdrond on 10.04.2020.
//  Copyright © 2020 xdrond. All rights reserved.
//

import Foundation

internal struct MathExpression {
    enum ArithOp: String {
        case addition = "+"
        case substract = "−"
        case multiplication = "×"
        case division = "÷"
    }
    
    
    var correctAnswer: Int {
        switch arithOperator{
        case .addition:
            return leftOperand + rightOperand
        case .substract:
            return leftOperand - rightOperand
        case .multiplication:
            return leftOperand * rightOperand
        case .division:
            return Int((Float(leftOperand) / Float(rightOperand)).rounded())
        }
    }
    var expression: String {
        return "\(leftOperand) \(arithOperator.rawValue) \(rightOperand)"
    }
    
    private var leftOperand: Int = 40
    private var arithOperator: ArithOp = .addition
    private var rightOperand: Int = 2
    private let upperLimit = 100
    private let numOfOperators = 4
    
    mutating func update(){
        leftOperand = Int.random(in: 0 ..< upperLimit)
        rightOperand = Int.random(in: 1 ..< upperLimit)
        let randOperator = Int(arc4random_uniform(UInt32(numOfOperators)))
        switch randOperator {
        case 0:
            arithOperator = .addition
        case 1:
            arithOperator = .division
        case 2:
            arithOperator = .multiplication
        case 3:
            arithOperator = .substract
        default:
            arithOperator = .addition
        }
    }
    
    init(leftOperand: Int, arithOperator: ArithOp, rightOperand: Int){
        self.leftOperand = leftOperand
        self.rightOperand = rightOperand
        self.arithOperator = arithOperator
    }
    init(){
        update()
    }
}

internal var expressionByApp = MathExpression()
