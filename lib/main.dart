import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:school_bus/connections/end_point_url.dart';
import 'package:school_bus/pages/splash_page.dart';
import 'package:school_bus/token/token_secure_helper_class.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initHiveForFlutter();
  HttpLink httpLink = HttpLink(EndPointConnection.theUrlEndPoint);
  AuthLink authLink = AuthLink(getToken: () async {
    final token = await TokenSecureHelperClass.getToken();
    return token != null ? 'JWT $token' : null;
  });

  final link = authLink.concat(httpLink);

  final client = GraphQLClient(
    link: link,
    cache: GraphQLCache(store: HiveStore()),
  );

  runApp(
    GraphQLProvider(
      client: ValueNotifier(client),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
