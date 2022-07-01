import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:ecommerce_app/providers/order_provider.dart';
import 'package:ecommerce_app/providers/products.dart';
import 'package:ecommerce_app/user_state.dart';
import 'package:ecommerce_app/views/screens/detail_page.dart';
import 'package:ecommerce_app/views/screens/feeds_category.dart';
import 'package:ecommerce_app/views/screens/order_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import './const.dart';
import './views/screens/auth/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Text(
                  "App Initialized",
                ),
              ),
            ),
          );
        }
        if (snapShot.hasError) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Text("An error occured"),
              ),
            ),
          );
        }
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => Products(),
            ),
            ChangeNotifierProvider(
              create: (context) => CartProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => OrderProvider(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            // theme: ThemeData.dark().copyWith(
            //   scaffoldBackgroundColor: backgroundColor,
            // ),
            home: UserState(),
            routes: {
              DetailPage.routeName: (context) => DetailPage(),
              FeedsCategoryScreen.routeName: (context) => FeedsCategoryScreen(),
              OrderScreen.routeName: (context) => OrderScreen(),
            },
          ),
        );
      },
    );
  }
}
