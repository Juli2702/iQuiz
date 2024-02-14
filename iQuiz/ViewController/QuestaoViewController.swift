//
//  QuestaoViewController.swift
//  iQuiz
//
//  Created by Juliza Gnoatto on 26/08/23.
//

import UIKit

class QuestaoViewController: UIViewController {
    
    var pontuacao = 0
    var numeroQuestao = 0

    @IBOutlet weak var tituloQuestaoLabel: UILabel!
    @IBOutlet var botoesResposta: [UIButton]!
    
    @IBAction func respostaBotaoPressionado(_ sender: UIButton) {
        let usuarioAcertouResposta: Bool = sender.tag == questoes[numeroQuestao].respostaCorreta
        
        if usuarioAcertouResposta {
            pontuacao += 1
            print("O usuário acertou!")
            sender.backgroundColor = UIColor(red: 11/255, green: 161/255, blue: 53/255, alpha: 1.0)
        } else {
            sender.backgroundColor = UIColor(red: 211/255, green: 17/255, blue: 17/255, alpha: 1.0)
        }
        
        if numeroQuestao < questoes.count - 1 {
            numeroQuestao += 1
            Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(configurarQuestao), userInfo: nil, repeats: false)
        } else {
            navegaParaTelaDesempenho()
        }
    }
    
    func navegaParaTelaDesempenho() {
        performSegue(withIdentifier: "irParaTelaDesempenho", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurarLayout()
        configurarQuestao()
    }
    
    func configurarLayout() {        
        navigationItem.hidesBackButton = true
        
        for botao in botoesResposta {
            botao.layer.cornerRadius = 12.0
        }
        
    }
    
    @objc func configurarQuestao() {
        tituloQuestaoLabel.text = questoes[numeroQuestao].titulo
        
        for botao in botoesResposta {
            let titulo = questoes[numeroQuestao].respostas[botao.tag]
            botao.setTitle(titulo, for: .normal)
            botao.backgroundColor = UIColor(red: 116/255, green: 50/255, blue: 255/255, alpha: 1.0)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let desempenhoVC = segue.destination as? DesempenhoViewController else { return }
        
        desempenhoVC.pontuacao = pontuacao
    }
}
