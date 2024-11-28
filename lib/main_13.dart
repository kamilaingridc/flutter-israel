import 'package:flutter/material.dart';
//import 'main_11_segunda_tela.dart'; // Importe a Segunda_Tela_App

void main() {
  runApp(Projeto01App());
}

class Projeto01App extends StatefulWidget {
  const Projeto01App({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<Projeto01App> {
  String texto = 'Cadastrando Sensores';
  String localizacao = '';
  String tipo = '';
  String macAddress = '';
  double? latitude;
  double? longitude;
  String responsavel = '';
  String observacao = '';
  String unidadeMedida = '';
  bool statusOperacional = true;

  final TextEditingController _localizacaoController = TextEditingController();
  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _macAddressController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  final TextEditingController _responsavelController = TextEditingController();
  final TextEditingController _unidadeMedidaController =
      TextEditingController();
  final TextEditingController _observacaoController = TextEditingController();

  @override
  void dispose() {
    _localizacaoController.dispose();
    _tipoController.dispose();
    _macAddressController.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    _responsavelController.dispose();
    _observacaoController.dispose();
    _unidadeMedidaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Smart City Roberto Mange'),
          backgroundColor: Colors.grey[300],
        ),
        body: SingleChildScrollView(
          // Adicionado para permitir rolagem
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
// Campo Tipo
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _tipoController,
                  decoration: InputDecoration(
                    labelText: 'Tipo',
                    border: OutlineInputBorder(),
                  ),
                  maxLength: 20,
                  onChanged: (value) {
                    tipo = value;
                  },
                ),
              ),
              SizedBox(height: 10), // Espaçamento entre os campos

              // Campo Mac Address
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _macAddressController,
                  decoration: InputDecoration(
                    labelText: 'Mac Address',
                    border: OutlineInputBorder(),
                  ),
                  maxLength: 14,
                  onChanged: (value) {
                    macAddress = value;
                  },
                ),
              ),
              SizedBox(height: 10), // Espaçamento entre os campos

              // Campo Latitude
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _latitudeController,
                  keyboardType: TextInputType.text, // Alterado para texto
                  decoration: InputDecoration(
                    labelText: 'Latitude',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    //alterar para que o valor digitado seja convertido para double?
                    latitude = double.tryParse(value);
                  },
                ),
              ),
              SizedBox(height: 10), // Espaçamento entre os campos

              // Campo Longitude
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _longitudeController,
                  keyboardType: TextInputType.text, // Alterado para texto
                  decoration: InputDecoration(
                    labelText: 'Longitude',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    //alterar para que o valor digitado seja convertido para double?
                    longitude = double.tryParse(value);
                  },
                ),
              ),
              SizedBox(height: 10), // Espaçamento entre os campos

              // Campo Local do Sensor
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _localizacaoController,
                  decoration: InputDecoration(
                    labelText: 'Local do Sensor',
                    border: OutlineInputBorder(),
                  ),
                  maxLength: 20,
                  onChanged: (value) {
                    localizacao = value; // Atualiza a variável ao digitar
                  },
                ),
              ),
              SizedBox(height: 10), // Espaçamento entre os campos

              // Campo Responsável
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _responsavelController,
                  decoration: InputDecoration(
                    labelText: 'Responsável',
                    border: OutlineInputBorder(),
                  ),
                  maxLength: 20,
                  onChanged: (value) {
                    responsavel = value;
                  },
                ),
              ),
              SizedBox(height: 10), // Espaçamento entre os campos

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Text("Status Operacional"),
                    Switch(
                      value: statusOperacional,
                      onChanged: (value) {
                        setState(() {
                          statusOperacional = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // Campo Observação
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _observacaoController,
                  decoration: InputDecoration(
                    labelText: 'Observação',
                    border: OutlineInputBorder(),
                  ),
                  maxLength: 100,
                  onChanged: (value) {
                    observacao = value;
                  },
                ),
              ),
              SizedBox(height: 20), // Espaçamento entre os campos

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    //alterar localSensor para localizacao
                    texto = localizacao.isNotEmpty
                        ? 'Local do Sensor: $localizacao\n'
                            'Tipo: $tipo\n'
                            'Mac Address: $macAddress\n'
                            'Latitude: $latitude\n'
                            'Longitude: $longitude\n'
                            'Responsável: $responsavel\n'
                            'Observação: $observacao'
                        : 'Por favor, insira um local do sensor!';
                  });

                  // Limpa os campos após clicar
                  //Alterar a _controller para _localizacaoController
                  _localizacaoController.clear();
                  _tipoController.clear();
                  _macAddressController.clear();
                  _latitudeController.clear();
                  _longitudeController.clear();
                  _responsavelController.clear();
                  _observacaoController.clear();

                  // Reseta as variáveis
                  localizacao = '';
                  tipo = '';
                  macAddress = '';
                  //alterar latitude elongitude para null
                  latitude = null;
                  longitude = null;
                  responsavel = '';
                  observacao = '';
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50), // Largura: 200, Altura: 50
                ),
                child: Text('Cadastrar Sensor'),
              ),
              SizedBox(
                  height: 20), // Espaçamento entre o botão e o texto do resumo

              // // Resumo do Cadastro
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //   child: Text(
              //     texto,
              //     textAlign: TextAlign.center,
              //     style: TextStyle(fontSize: 16),
              //   ),
              // ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.grey[300], // Cor de fundo cinza claro
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Aqui é o rodapé',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
