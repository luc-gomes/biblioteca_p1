//import 'package:biblioteca_p1/Telas/paginas/confg_ui.dart';
import 'package:biblioteca_p1/Telas/widgetblocos/grid_configuracoes.dart';
import 'package:flutter/material.dart';
import '/Telas/paginas/blocos001.dart';
//import '/Telas/paginas/confg_ui.dart';
class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  //Índice da página que será carregada inicialmente
  var telaAtual = 0;

  //Controlador utilizado para troca das telas (páginas)
  var pageController = PageController();

  @override
  Widget build(BuildContext context) {
       return Scaffold(
        body: PageView(
        controller: pageController,
        children: [
          FeedBlocos01(),
          GridMenuConfiguracoes(),
        ],
        onPageChanged: (index) {
          setState(() {
            telaAtual = index;
          });
        },
      ),
      //
      // BARRA DE NAVEGAÇÃO
      //
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue.shade900,

        selectedItemColor: Colors.orange.shade400,
        unselectedItemColor: Colors.white.withOpacity(.40),
        selectedFontSize: 16,
        unselectedFontSize: 16,
        iconSize: 40,
        //Index do Botão Selecionado
        currentIndex: telaAtual,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
         
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'configuraçoes',
          ),
        ],
        // Mudança de Tela (Página)
        onTap: (index) {
          setState(() {
            telaAtual = index;
          });
          pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
        },
      ),
    );
  }
}
