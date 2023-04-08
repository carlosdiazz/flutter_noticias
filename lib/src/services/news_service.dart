import 'package:flutter/material.dart';
import 'package:flutter_noticias/src/models/category_models.dart';
import 'package:flutter_noticias/src/models/news_models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

final _urlNews = 'https://newsapi.org/v2';
final _apiKey = 'a48b1e46666b44099e1805254a07e5f8';

class NewsService with ChangeNotifier {
  String _selectedCategory = 'business';
  List<Article> headlines = [];
  List<Category> categories = [
    Category(icon: FontAwesomeIcons.building, name: 'business'),
    Category(icon: FontAwesomeIcons.tv, name: 'entertainment'),
    Category(icon: FontAwesomeIcons.addressCard, name: 'general'),
    Category(icon: FontAwesomeIcons.headSideVirus, name: 'health'),
    Category(icon: FontAwesomeIcons.vials, name: 'science'),
    Category(icon: FontAwesomeIcons.volleyball, name: 'sports'),
    Category(icon: FontAwesomeIcons.memory, name: 'technology')
  ];

  NewsService() {
    getTopHeadlines();
    categories.forEach((element) {
      categoryArrticles[element.name] = [];
    });
    getArticlesByCategory('business');
  }

  Map<String, List<Article>> categoryArrticles = {};

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String valor) {
    _selectedCategory = valor;
    getArticlesByCategory(valor);
    notifyListeners();
  }

  getTopHeadlines() async {
    final url = "$_urlNews/top-headlines?country=us&apiKey=$_apiKey";
    final resp = await http.get(Uri.parse(url));
    final newsResponse = newsResponseFromJson(resp.body);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  List<Article> get getArticulosCategoriasSeleccionada =>
      categoryArrticles[selectedCategory]!;

  getArticlesByCategory(String category) async {
    if (categoryArrticles[category]!.isNotEmpty) {
      return categoryArrticles[category];
    }

    final url =
        "$_urlNews/top-headlines?country=us&apiKey=$_apiKey&category=$category";
    final resp = await http.get(Uri.parse(url));
    final newsResponse = newsResponseFromJson(resp.body);
    categoryArrticles[category]!.addAll(newsResponse.articles);
    notifyListeners();
  }
}
