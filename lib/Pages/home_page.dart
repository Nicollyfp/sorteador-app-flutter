import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_app_flutter_clone/services/sorteador_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numeroSorteado = 0;
  var penultimoSorteio = 0;
  var qtdSorteios = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu Primeiro App Flutter", style: GoogleFonts.pacifico()),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Tivemos até agr $qtdSorteios sorteios!!",
            style: GoogleFonts.roboto(fontSize: 70),
          ),
          Text(
            numeroSorteado.toString(),
            style: GoogleFonts.roboto(fontSize: 100),
          ),
          Text(
            "O último número sorteado foi: $penultimoSorteio",
            style: GoogleFonts.roboto(fontSize: 50),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.monetization_on_outlined),
        onPressed: () {
          setState(() {
            qtdSorteios++;
            penultimoSorteio = numeroSorteado;
            numeroSorteado = SorteadorService.sortearNumero();
          });
          debugPrint(numeroSorteado.toString());
        },
      ),
    );
  }
}
