import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp/firebase_options.dart';
import 'package:fyp/res/theme.dart';
import 'package:fyp/utils/routes/route_name.dart';
import 'package:fyp/utils/routes/routes.dart';
import 'package:fyp/view_model/customer_dashboard/customer_home/customer_home_controller.dart';
import 'package:fyp/view_model/signup/create_shop_controller.dart';
import 'package:fyp/view_model/signup/signup_controller.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignupController()),
        ChangeNotifierProvider(create: (context) => CustomerHomeController()),
        ChangeNotifierProvider(create: (context) => CreateShopController()),
      ],
      child: MaterialApp(
        title: 'The Parlour App',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        initialRoute: RouteName.splashScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
