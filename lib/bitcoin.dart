import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Bitcoin extends StatefulWidget {
  const Bitcoin({super.key});

  @override
  BitcoinState createState() => BitcoinState();
}

class BitcoinState extends State<Bitcoin> {
  

  String _preco = "0";

  void _recuperarPreco() async {
    setState(() {
      _preco = "Carregando...";
    });

    try {
      // Construção da URL para a API do Bitcoin
      var url = Uri.https("blockchain.info", "/ticker");

      // Requisição HTTP GET para a API
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        // Conversão do retorno para JSON
        Map<String, dynamic> retorno = json.decode(response.body);

        if (retorno.containsKey("BRL")) {
          // Extração dos valores de "buy" e "symbol"
          String buy = retorno["BRL"]["buy"].toString();
          String symbol = retorno["BRL"]["symbol"];

          setState(() {
            // Atualização do preço do Bitcoin em Reais
            _preco = "$symbol ${double.parse(buy).toStringAsFixed(2)}";
          });
        } else {
          setState(() {
            _preco = "Dados não encontrados para BRL";
          });
        }
      } else {
        setState(() {
          _preco = "Erro na requisição: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        _preco = "Erro ao recuperar dados: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Título tela"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/bitcoin.png", height: 70),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text("Valor do Bitcoin",
                  style: TextStyle(
                    fontSize: 35
                  ),
                ),
              ),
              Text(
                _preco,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: _recuperarPreco,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                child: Text("Atualizar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
