import 'package:flutter_noticias/src/models/juego_models.dart';
import 'package:flutter_noticias/src/services/graphql_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  static GraphqlConfig grapQLConfig = GraphqlConfig();
  GraphQLClient client = grapQLConfig.clientToQuery();

  Future<List<JuegoModel>> getJuegos({required int limit}) async {
    try {
      print('Pore aca');
      QueryResult result = await client.query(
          QueryOptions(fetchPolicy: FetchPolicy.noCache, document: gql("""
              query AllJuego(\$limit: Int) {
                allJuego(limit: \$limit) {
                  abreviatura
                  activo
                  descripcion
                  id
                  name
                  posiciones
                  rango_maximo
                  rango_minimo
                }
              }
            """), variables: {"limit": limit}));
      if (result.hasException) {
        print(result.hasException);
        print(result.exception);
        //throw Exception(result.exception);
      }
      List? res = result.data?['allJuego'];
      if (res == null || res.isEmpty) {
        return [];
      }

      List<JuegoModel> juegos =
          res.map((juego) => JuegoModel.fromJson(juego)).toList();

      return juegos;
    } catch (error) {
      print(error);
      return [];
    }
  }
}
