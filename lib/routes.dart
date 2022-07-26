
import 'package:keluhan/page/Login.dart';
import 'package:keluhan/page/Register.dart';
import 'package:keluhan/page/base.dart';
import 'package:keluhan/page/detailPage.dart';
import 'package:keluhan/page/homePage.dart';
import 'package:keluhan/page/masukanKeluhan.dart';
import 'package:keluhan/page/splashScreen.dart';
import 'package:keluhan/page/welcomePage.dart';
import 'package:provider/provider.dart';


import 'genosLib/bloc/baseBloc.dart';


class GenProvider {
  static var providers = [
    ChangeNotifierProvider<BaseBloc>.value(value: BaseBloc()),

  ];

  static routes(context) {
    return {
//           '/': (context) {
//        return Base();
//      },

      '/': (context) {
        return SplashScreen();
      },

      'login': (context) {
        return LoginPage();
      },

      'welcome': (context) {
        return WelcomePage();
      },

      'home': (context) {
        return Base();
      },

      'detail': (context) {
        return DetailPage();
      },

      'keranjang': (context) {
        return MasukanKeluhan();
      },
      'register': (context) {
        return RegisterPage();
      },
    };
  }
}
