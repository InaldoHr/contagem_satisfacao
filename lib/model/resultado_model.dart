import 'dart:convert';

import 'package:http/http.dart' as http;
class ResultadoModel {
  Resultados? resultados;
  VotosPorTerminal? votosPorTerminal;

  ResultadoModel({this.resultados, this.votosPorTerminal});

  ResultadoModel.fromJson(Map<String, dynamic> json) {
    resultados = json['resultados'] != null
        ? Resultados.fromJson(json['resultados'])
        : null;
    votosPorTerminal = json['votos_por_terminal'] != null
        ? VotosPorTerminal.fromJson(json['votos_por_terminal'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (resultados != null) {
      data['resultados'] = resultados!.toJson();
    }
    if (votosPorTerminal != null) {
      data['votos_por_terminal'] = votosPorTerminal!.toJson();
    }
    return data;
  }

  static Future<ResultadoModel> obterResultado() async {
    final response =
        await http.get(Uri.parse('https://estevaorada.com/aulas/api/voto/resultados.php'));
    if (response.statusCode == 200) {
      return ResultadoModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Falha ao obter o CEP.');
    }
  }
}

class Resultados {
  int? i1;
  int? i2;
  int? i3;
  int? i4;
  int? i5;

  Resultados({this.i1, this.i2, this.i3, this.i4, this.i5});

  Resultados.fromJson(Map<String, dynamic> json) {
    i1 = json['1'];
    i2 = json['2'];
    i3 = json['3'];
    i4 = json['4'];
    i5 = json['5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['1'] = i1;
    data['2'] = i2;
    data['3'] = i3;
    data['4'] = i4;
    data['5'] = i5;
    return data;
  }
}

class VotosPorTerminal {
  int? t5002;
  int? t5003;
  int? t5004;
  int? t5005;
  int? t5006;
  int? t5007;
  int? t5008;
  int? t5009;
  int? t5010;

  VotosPorTerminal(
      {this.t5002,
      this.t5003,
      this.t5004,
      this.t5005,
      this.t5006,
      this.t5007,
      this.t5008,
      this.t5009,
      this.t5010});

  VotosPorTerminal.fromJson(Map<String, dynamic> json) {
    t5002 = json['t_5002'];
    t5003 = json['t_5003'];
    t5004 = json['t_5004'];
    t5005 = json['t_5005'];
    t5006 = json['t_5006'];
    t5007 = json['t_5007'];
    t5008 = json['t_5008'];
    t5009 = json['t_5009'];
    t5010 = json['t_5010'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['t_5002'] = t5002;
    data['t_5003'] = t5003;
    data['t_5004'] = t5004;
    data['t_5005'] = t5005;
    data['t_5006'] = t5006;
    data['t_5007'] = t5007;
    data['t_5008'] = t5008;
    data['t_5009'] = t5009;
    data['t_5010'] = t5010;
    return data;
  }
}