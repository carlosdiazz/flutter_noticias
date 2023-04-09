import 'package:flutter/material.dart';
import 'package:flutter_noticias/src/models/juego_models.dart';
import 'package:flutter_noticias/src/services/graphql_service.dart';

class Tab3Pages extends StatefulWidget {
  const Tab3Pages({super.key});

  @override
  State<Tab3Pages> createState() => _Tab3PagesState();
}

class _Tab3PagesState extends State<Tab3Pages> {
  List<JuegoModel>? _juegos;
  GraphQLService _graphQLService = GraphQLService();
  void _load() async {
    _juegos = null;
    _juegos = await _graphQLService.getJuegos(limit: 2);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: _juegos == null
                ? const Center(child: CircularProgressIndicator())
                : Text('data')));
  }
}
