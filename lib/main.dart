import 'package:covid_19_mob/pages/details/detail_kasus.dart';
import 'package:covid_19_mob/pages/home/home.dart';
import 'package:covid_19_mob/pages/splash.dart';
import 'package:covid_19_mob/providers/dailycases_provider.dart';
import 'package:covid_19_mob/providers/provinsicases_provider.dart';
import 'package:covid_19_mob/providers/totalcases_provider.dart';
import 'package:covid_19_mob/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: TotalCasesProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ProvinceCasesProvider(),
        ),
        ChangeNotifierProvider.value(
          value: DailyCasesProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Covid 19 Indo',
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        initialRoute: "/",
        routes: {
          "/": (context) => SplashScreen(),
          HomeScreen.route_name: (context) => HomeScreen(),
          KasusProvinsiScreen.route_name: (context) => KasusProvinsiScreen(),
        },
        // onGenerateRoute: (RouteSettings settings) {
        //   print('build route for ${settings.name}');
        //   var routes = <String, WidgetBuilder>{
        //     OTPScreen.route_name: (ctx) => OTPScreen(settings.arguments),
        //   };
        //   WidgetBuilder builder = routes[settings.name];
        //   return MaterialPageRoute(builder: (ctx) => builder(ctx));
        // },
      ),
    );
  }
}
