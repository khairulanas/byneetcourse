import 'package:byneetcourseapp/src/modules/account/mycourse_repository.dart';
import 'package:byneetcourseapp/src/modules/course/services/materi_repository.dart';
import 'package:byneetcourseapp/src/modules/login/services/login_service.dart';
import 'package:byneetcourseapp/src/modules/wishlist/wishlist_repository.dart';
import 'package:byneetcourseapp/src/tools/constColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/modules/splashScreen/screens/android/splashScreen_android.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginService.instance()),
        ChangeNotifierProvider(create: (context) => WishListRepository()),
        ChangeNotifierProvider(create: (context) => MateriRepository()),
        ChangeNotifierProvider(create: (context) => MyCourseRepository()),
      ],
      child: MaterialApp(
        title: 'Byneet Course',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        theme: ThemeData(
          fontFamily: "Nunito",
          scaffoldBackgroundColor: CustomColor.background,
        ),
      ),
    );
  }
}
