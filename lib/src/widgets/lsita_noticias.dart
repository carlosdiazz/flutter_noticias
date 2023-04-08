import 'package:flutter/material.dart';
import 'package:flutter_noticias/src/models/news_models.dart';
import 'package:flutter_noticias/src/theme/theme_black.dart';

class ListaNoticias extends StatelessWidget {
  const ListaNoticias({
    super.key,
    required this.noticias,
  });

  final List<Article> noticias;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (BuildContext context, int index) {
        return _Noticias(article: noticias[index], index: index);
      },
    );
  }
}

class _Noticias extends StatelessWidget {
  const _Noticias({super.key, required this.article, required this.index});

  final Article article;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjertaTopBar(
          noticia: article,
          index: index,
        ),
        _TarjertaTitulo(
          article: article,
        ),
        _TarjertaImagen(article: article),
        _TarjertaBody(
          article: article,
        ),
        _TarjertaBotones(),
        SizedBox(
          height: 10,
        ),
        Divider(),
      ],
    );
  }
}

class _TarjertaBotones extends StatelessWidget {
  const _TarjertaBotones({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RawMaterialButton(
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            fillColor: (Colors.indigo),
            child: Icon(Icons.star_border),
          ),
          SizedBox(
            width: 10,
          ),
          RawMaterialButton(
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            fillColor: (Colors.redAccent),
            child: Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}

class _TarjertaBody extends StatelessWidget {
  const _TarjertaBody({super.key, required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(article?.description ?? ''),
    );
  }
}

class _TarjertaImagen extends StatelessWidget {
  const _TarjertaImagen({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            child: (article.urlToImage != null)
                ? FadeInImage(
                    placeholder: AssetImage('assets/img/giphy.gif'),
                    image: NetworkImage(article.urlToImage!))
                : Image(image: AssetImage('assets/img/no-image.png'))),
      ),
    );
  }
}

class _TarjertaTitulo extends StatelessWidget {
  const _TarjertaTitulo({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        article?.title ?? '',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TarjertaTopBar extends StatelessWidget {
  const _TarjertaTopBar({
    super.key,
    required this.noticia,
    required this.index,
  });
  final Article noticia;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${index + 1}.',
          ),
          Text('${noticia.source.name}.')
        ],
      ),
    );
  }
}
