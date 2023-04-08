import 'package:flutter/material.dart';
import 'package:flutter_noticias/src/models/category_models.dart';
import 'package:flutter_noticias/src/services/news_service.dart';
import 'package:flutter_noticias/src/widgets/lsita_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Pages extends StatelessWidget {
  const Tab2Pages({super.key});

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          _ListaCategorias(),
          newsService.getArticulosCategoriasSeleccionada.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: ListaNoticias(
                  noticias: newsService.getArticulosCategoriasSeleccionada,
                ))
        ]),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  const _ListaCategorias({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      height: 80,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cName = categories[index].name;
          return Padding(
            padding: EdgeInsets.all(8),
            child: Column(children: [
              _CategoryButton(categoria: categories[index]),
              SizedBox(
                height: 5,
              ),
              Text('${cName[0].toUpperCase()}${cName.substring(1)}')
            ]),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    super.key,
    required this.categoria,
  });

  final Category categoria;

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = categoria.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(categoria.icon,
            color: (newsService.selectedCategory == categoria.name)
                ? Colors.indigo
                : Colors.black),
      ),
    );
  }
}
