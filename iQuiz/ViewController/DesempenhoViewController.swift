//
//  DesempenhoViewController.swift
//  iQuiz
//
//  Created by Juliza Gnoatto on 26/08/23.
//

import UIKit

class DesempenhoViewController: UIViewController {
    
    var pontuacao: Int?

    @IBOutlet weak var resultadoLabel: UILabel!
    @IBOutlet weak var percentualLabel: UILabel!
    
    @IBOutlet weak var botaoReiniciarQuiz: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurarLayout()
        configurarDesempenho()
    }
    
    func configurarLayout() {
        navigationItem.hidesBackButton = true
        botaoReiniciarQuiz.layer.cornerRadius = 12.0
    }

    func configurarDesempenho() {
        guard let pontuacao = pontuacao else { return }
        let percentual = (pontuacao * 100) / questoes.count
        
        resultadoLabel.text = "Você acertou \(pontuacao) de \(questoes.count) questões"
        percentualLabel.text = "Percentual final: \(percentual)%"
    }
}
