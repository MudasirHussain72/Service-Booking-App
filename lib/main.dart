import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp/firebase_options.dart';
import 'package:fyp/res/theme.dart';
import 'package:fyp/utils/routes/route_name.dart';
import 'package:fyp/utils/routes/routes.dart';
import 'package:fyp/view_model/customer_dashboard/customer_home/customer_home_controller.dart';
import 'package:fyp/view_model/services/theme_settings.dart';
import 'package:fyp/view_model/signup/create_shop_controller.dart';
import 'package:fyp/view_model/signup/signup_controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  //setting app orientation in portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final isDark = prefs.getBool('isDark') ?? true;
  runApp(MyApp(theme: isDark));
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final theme;
  const MyApp({Key? key, this.theme}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SignupController()),
          ChangeNotifierProvider(create: (context) => CustomerHomeController()),
          ChangeNotifierProvider(create: (context) => CreateShopController()),
          ChangeNotifierProvider(
              create: (context) => ThemeChanger(theme)), //ThemeChanger
        ],
        child: Builder(builder: (context) {
          final provider = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            title: 'IN-Remote Services',
            debugShowCheckedModeBanner: false,
            theme: provider.themeMode,
            initialRoute: RouteName.splashScreen,
            onGenerateRoute: Routes.generateRoute,
          );
        }));
  }
}
