import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();

  String _infoText = "Informe seus dados:";
  void calcular() {
    setState(() {
      double altura = double.parse(alturaController.text) / 100;
      double peso = double.parse(pesoController.text);
      double imc = (peso / (altura * altura));
      if (imc < 18.6) {
        _infoText = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso ideal (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Levemente acima do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Obsedidade Grau I (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 34.9 && imc < 39.0) {
        _infoText = "Obsedidade Grau II (${imc.toStringAsPrecision(3)})";
      } else {
        _infoText = "Obsedidade Grau III (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IMC Calculator"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.indigoAccent,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            //Tudo que estiver na coluna ocupa toda a largura do aplicativo
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Cálculo do IMC",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Peso(kg)",
                  labelStyle:
                      TextStyle(color: Colors.greenAccent, fontSize: 30),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.greenAccent, fontSize: 15),
                controller: pesoController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Digite seu peso!";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Altura(cm)",
                  labelStyle:
                      TextStyle(color: Colors.greenAccent, fontSize: 30),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.greenAccent, fontSize: 15),
                controller: alturaController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Digite sua altura!";
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        calcular();
                      }
                    },
                    child: Text("Calcular"),
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, color: Colors.greenAccent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
