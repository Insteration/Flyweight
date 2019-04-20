//
//  ViewController.swift
//  Flyweight
//
//  Created by Artem Karmaz on 4/20/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let red = UIColor.red
        let red2 = UIColor.red
        print(red === red2) //создали два объекта, но по факту эти объекты используют одну ячейку памяти
        
        let color = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        let color2 = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        print(color === color2) // эти два объекта сссылаются на разные ячейки памяти, так как они были проиницализированы
        
        // таким образом мы создали леговесный объект, который ссылается на одну ячейку памяти и экономим место (соответственно это оптимазация, быстрый доступ к ячейке, но нужно следить за переполненеим памяти)
        let flyColor = UIColor.rgba(1, 0, 0, 1)
        let flyColor2 = UIColor.rgba(1, 0, 0, 1)
        print(flyColor === flyColor2)
    }


}

// есть словарь и юзер передает какие-то параметры и тем самым собирая цвет из палитры, получаем ключ путем объединения параметров и в словаре по ключу пытаемся получить цвет, если получаем то вовзращаем, если нет, то создаем и возвращаем
extension UIColor {
    static var colorStore: [String: UIColor] = [:] // будет хранить какой-то словарь
    class func rgba(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat) -> UIColor {
        let key = "\(red)\(green)\(blue)\(alpha)"
        if let color = colorStore[key] {
            return color
        }
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        colorStore[key] = color
        return color
    }
}
