import 'package:flutter/material.dart';

class TelaContato extends StatefulWidget {
  const TelaContato({super.key});

  @override
  TelaContatoState createState() => TelaContatoState();
}

class TelaContatoState extends State<TelaContato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Contato"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.email, color: Colors.green, size: 60),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Contato",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text("Email: atedimento@novaroma.edu.br"),
                  ),
                   Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text("Telefone: (81) xxxx-xxxx"),
                  ),
                     Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text("Celular: 9xxxx-xxxx")
                  )
             
             
                ],
              )
              // Implementar os dados de contato
              
            ],
          ),
        ),
      ),
    );
  }
}
