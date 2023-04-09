import 'package:flutter/material.dart';
import 'package:flutter_noticias/src/screen/screen.dart';
import 'package:provider/provider.dart';

class TabsPages extends StatelessWidget {
  const TabsPages({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  const _Navegacion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
        currentIndex: navegacionModel.paginaActual,
        onTap: (value) => navegacionModel.paginaActual = value,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Para ti'),
          BottomNavigationBarItem(
              icon: Icon(Icons.public), label: 'encabezado'),
          BottomNavigationBarItem(icon: Icon(Icons.home_sharp), label: 'test')
        ]);
  }
}

class _Paginas extends StatelessWidget {
  const _Paginas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      //Aqui bloqueo el Scrool por el user
      controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        //Container(
        //  color: Colors.blueAccent,
        //),
        Tab1Page(),
        //Container(
        //  color: Colors.green,
        //)
        Tab2Pages(),
        Tab3Pages()
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = PageController();

  int get paginaActual => _paginaActual;

  set paginaActual(int valor) {
    _paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}
