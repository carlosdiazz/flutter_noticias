import 'package:flutter/material.dart';
import 'package:flutter_noticias/src/services/services.dart';
import 'package:flutter_noticias/src/widgets/lsita_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({super.key});

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    final headlines = newsService.headlines;
    //ListaNoticias(noticias: newsService.headlines),
    return Scaffold(
        body: (headlines.length == 0)
            ? Center(child: CircularProgressIndicator())
            : ListaNoticias(noticias: newsService.headlines));
  }

  //Con esto no desturyo el widget por ende se quedara ene l mismo lugar cuando cambie
  @override
  bool get wantKeepAlive => true;
}
