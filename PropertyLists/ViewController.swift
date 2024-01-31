//
//  ViewController.swift
//  PropertyLists
//
//  Created by Dianelys Saldaña on 1/31/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let a1 = Alumno(nombre: "Pepe", notas: [5, 8.5, 10])
        let a2 = Alumno(nombre: "Eva", notas: [10, 9])
        let alumnos = [a1,a2]
        
        do {
            var urlDocs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let urlPlist = urlDocs.appendingPathComponent("alumnos.plist")
            let encoder = PropertyListEncoder()
            encoder.outputFormat = .xml
            
            let data = try encoder.encode(alumnos)
            try data.write(to: urlPlist)
            
            print("Data saved successfully to \(urlPlist)")
        } catch {
            print("Error saving data: \(error.localizedDescription)")
        }
    }


}

