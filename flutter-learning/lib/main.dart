import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_0/core/store.dart';
import 'package:flutter_application_0/firebase_options.dart';

import 'package:flutter_application_0/pages/Order_History.dart';
import 'package:flutter_application_0/pages/Password.dart';
import 'package:flutter_application_0/pages/Password2.dart';
import 'package:flutter_application_0/pages/Payment.dart';
import 'package:flutter_application_0/pages/categories.dart';
import 'package:flutter_application_0/pages/confirmation2.dart';
import 'package:flutter_application_0/pages/create1.dart';
import 'package:flutter_application_0/pages/confirmation1.dart';
import 'package:flutter_application_0/pages/address.dart';
import 'package:flutter_application_0/pages/cart.dart';
import 'package:flutter_application_0/pages/create2.dart';
import 'package:flutter_application_0/pages/create3.dart';
import 'package:flutter_application_0/pages/favourites.dart';
import 'package:flutter_application_0/pages/first.dart';
import 'package:flutter_application_0/pages/hello.dart';
import 'package:flutter_application_0/pages/home_page.dart';
import 'package:flutter_application_0/pages/homepage2.dart';
import 'package:flutter_application_0/pages/items.dart';
import 'package:flutter_application_0/pages/moodselection.dart';

import 'package:flutter_application_0/pages/new_password.dart';
import 'package:flutter_application_0/pages/newaddress.dart';
import 'package:flutter_application_0/pages/newpassword2.dart';
import 'package:flutter_application_0/pages/newpsuccess.dart';
import 'package:flutter_application_0/pages/newpsuccess2.dart';
import 'package:flutter_application_0/pages/offers.dart';
import 'package:flutter_application_0/pages/pchange.dart';
import 'package:flutter_application_0/pages/personal.dart';
import 'package:flutter_application_0/pages/popular.dart';
import 'package:flutter_application_0/pages/psuccess.dart';
import 'package:flutter_application_0/pages/pverification.dart';
import 'package:flutter_application_0/pages/recommend.dart';
import 'package:flutter_application_0/pages/recoveryverification.dart';
import 'package:flutter_application_0/pages/recoveryverification2.dart';
import 'package:flutter_application_0/pages/restaurants.dart';
import 'package:flutter_application_0/pages/select2.dart';
import 'package:flutter_application_0/pages/sellect1.dart';
import 'package:flutter_application_0/pages/setnotification.dart';
import 'package:flutter_application_0/pages/setting.dart';
import 'package:flutter_application_0/pages/user.dart';
import 'package:flutter_application_0/utils/routess.dart';
import 'package:flutter_application_0/pages/notification.dart';
import 'package:flutter_application_0/widgets/themes.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));

  runApp(VxState(store: MyStore(), child: MyApp()));
}

class AuthenticationRepository {}

class App {
  const App();
}

class Get {
  static put(authenticationRepository) {}

  static find() {}
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
        publicKey: "test_public_key_f5480c93cafd49f1a208abbfca5d8b05",
        enabledDebugging: true,
        builder: (context, navKey) {
          return MaterialApp(
            title: "FoodBuddy",
            themeMode: ThemeMode.light,
            theme: MyTheme.lightTheme(context),
            darkTheme: MyTheme.darkTheme(context),
            initialRoute: MyRoutes.homeRoute,
            debugShowCheckedModeBanner: false,
            routes: {
              MyRoutes.homeRoute: (context) => homepage(
                    controller: TextEditingController(),
                  ),
              MyRoutes.homepage2Route: (context) => homepage2(
                    controller: TextEditingController(),
                  ),
              MyRoutes.cartRoute: (context) => CartPage(),
              MyRoutes.orderhistoryRoute: (context) => Order_History(),
              MyRoutes.notificationRoute: (context) => NotificationPage(),
              MyRoutes.firstRoute: (context) => firstapp(),
              MyRoutes.helloRoute: (context) => hello(),
              MyRoutes.personalRoute: (context) => personal(),
              MyRoutes.accountRoute: (context) => account1(
                    controller: TextEditingController(),
                  ),
              MyRoutes.verificationRoute: (context) => account2(),
              MyRoutes.firstappRoute: (context) => firstapp(),
              MyRoutes.userRoute: (context) => user(),
              MyRoutes.addressRoute: (context) => address(),
              MyRoutes.settingRoute: (context) => setting(),
              MyRoutes.pchangeRoute: (context) => pchange(
                    controller: TextEditingController(),
                  ),
              MyRoutes.pverificationRoute: (context) => pverification(),
              MyRoutes.psuccessRoute: (context) => psuccess(),
              MyRoutes.paymentRoute: (context) => payment(),
              MyRoutes.RecoveryRoute: (context) => Recovery(),
              MyRoutes.recoveryverificationRoute: (context) =>
                  recoveryverification(),
              MyRoutes.recoveryverificaion2Route: (context) =>
                  recoveryverification2(),
              MyRoutes.newpassword1Route: (context) => newpassword1(
                    controller: TextEditingController(),
                  ),
              MyRoutes.newpassword2Route: (context) => newpassword2(
                    controller: TextEditingController(),
                  ),
              MyRoutes.newpsuccessRoute: (context) => newpsuccess(),
              MyRoutes.newpsuccess2Route: (context) => newpsuccess2(),
              MyRoutes.setnotificationRoute: (context) => setnotification(),
              MyRoutes.newaddressRoute: (contex) => newaddress(),
              MyRoutes.favouritesRoute: (context) => favourites(),
              MyRoutes.sellect1Route: (context) => select1(),
              MyRoutes.sellect2Route: (context) => select2(),
              MyRoutes.create2Route: (context) => create2(
                    controller: TextEditingController(),
                  ),
              MyRoutes.create3Route: (context) => create3(),
              MyRoutes.confirmation2Route: (context) => confirmation2(),
              MyRoutes.Recovery2Route: (context) => Recovery2(),
              MyRoutes.popularRoute: (context) => popular(),
              MyRoutes.offersRoute: (context) => offers(),
              MyRoutes.categoriesRoute: (context) => categories(),
              MyRoutes.restaurantsRoute: (context) => restaurants(),
              MyRoutes.itemsRoute: (context) => items(),
              MyRoutes.moodRoute: (context) => mood(),
              MyRoutes.recommendRoute: (context) => recommend(),
            },
            navigatorKey: navKey,
            localizationsDelegates: const [
              KhaltiLocalizations.delegate,
            ],
          );
        });
  }
}
