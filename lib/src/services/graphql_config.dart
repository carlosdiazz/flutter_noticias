import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlConfig {
  static HttpLink httpLink = HttpLink('http://192.168.0.5:9999/graphql');

  final AuthLink authLink = AuthLink(
    getToken: () =>
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjgxMDcwNDYzLCJleHAiOjE2ODEyNDMyNjN9.n6ImKXogIW-izglPzzFaU9biTa2ZPrZ_Yi1zsyb-KSg',
  );

  late Link link = authLink.concat(httpLink);

  GraphQLClient clientToQuery() =>
      GraphQLClient(link: link, cache: GraphQLCache());
}
