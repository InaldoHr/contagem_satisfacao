import 'package:contagem_satisfacao/model/resultado_model.dart';
import 'package:contagem_satisfacao/view/votar_view.dart';
import 'package:flutter/material.dart';

class ResultadosController{
  TextEditingController inputIdTerminal = TextEditingController();
  ResultadoModel resultadoModel = ResultadoModel();

  Future<ResultadoModel> obterResultado() async {
    return await ResultadoModel.obterResultado();
  }

  void iniciarVotacao(context){
    Navigator.push(context, 
    MaterialPageRoute(builder: (context) => VotarView(idTerminal:  inputIdTerminal.text)));
  } 
}