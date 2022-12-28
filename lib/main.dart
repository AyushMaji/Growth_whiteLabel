// ignore_for_file: avoid_print
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:olga/global/routes/my_route_observer.dart';
import 'package:olga/provider/feedback_provider.dart';
import 'package:olga/provider/global_data_provider.dart';
import 'package:olga/provider/last_route_provider.dart';
import 'package:olga/provider/visionboard_provider.dart';
import 'package:olga/screens/start/starting_screen.dart';
import 'getit_locator.dart' as getit_locator;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:olga/global/constants/app_constants.dart';
import 'package:olga/global/routes/routes.dart';
import 'package:olga/helper/custom_delegate.dart';
import 'package:olga/localization/app_localization.dart';
import 'package:olga/provider/auth_provider.dart';
import 'package:olga/provider/common_provider.dart';
import 'package:olga/provider/goal_planning_provider.dart';
import 'package:olga/provider/happy_life_provider.dart';
import 'package:olga/provider/localization_provider.dart';
import 'package:olga/provider/profile_provider.dart';
import 'package:olga/provider/ques_res_provider.dart';
import 'package:olga/provider/question_master.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:olga/provider/theme_provider.dart';
import 'package:olga/theme/dark_theme.dart';
import 'package:olga/theme/light_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'provider/payment_provider.dart';
import 'provider/slot_boking_provider.dart';
import 'screens/visionboard/visionboard.dart';
import 'dart:io' show Platform;

Future<void> main() async {
  ///* Never remove these lines bellow */
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //Stripe.publishableKey = "pk_test_51JrcmqSGDH9UyD5pzdMFAVo2YtJN3E6ASu50axHxPL8ReN8qQkHuOxcXXEOYy9DUBpduozNPkfuAq5bVPu1rqo8800F3VNVuwn";
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await getit_locator.init(prefs);
  String lastRoute = prefs.getString('last_route') ?? StartingScreen.id;
  print("now visiting ===>>> $lastRoute");

  //* Never remove these lines bellow *//
  // Get the operating system as a string.
  String os = Platform.operatingSystem;
  // Or, use a predicate getter.
  if (Platform.isMacOS) {
    print('is a Mac');
  } else if (Platform.isAndroid) {
    print(Platform.operatingSystem); // "ios"
    print(Platform.operatingSystemVersion); 
    print(Platform.version); 

    print('is android');

  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocalizationProvider(prefs: prefs)),
        ChangeNotifierProvider(create: (_) => ThemeProvider(prefs: prefs)),
        ChangeNotifierProvider(create: (_) => StorageProvider(prefs)),
        ChangeNotifierProvider(create: (_) => GlobalDataProvider()),
        ChangeNotifierProvider(create: (_) => CommonProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider(prefs: prefs)), 
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => QuesResProvider()),
        ChangeNotifierProvider(create: (_) => HappyLifeSurvey()),
        ChangeNotifierProvider(create: (_) => GoalPlanningProvider()),
        ChangeNotifierProvider(create: (_) => QuestionMaster()),
        ChangeNotifierProvider(create: (_) => VisionboardProvider()),
        ChangeNotifierProvider(create: (_) => SlotBookingProvider()),
        ChangeNotifierProvider(create: (_) => PaymentProvider()),
        ChangeNotifierProvider(create: (_) => FeedbackProvider()),
        ChangeNotifierProvider(create: (_) => LastRouteProvider()),
      ],
      child: DevicePreview(
         enabled: false,
         // ignore: prefer_const_literals_to_create_immutables
         tools: [
        ...DevicePreview.defaultTools,
        //  CustomPlugin(),
      ],
     builder: (context) => MyApp(lastRoute: lastRoute)),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String? lastRoute;
  const MyApp({Key? key, required this.lastRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Locale> locals = [];
    for (var language in AppConstants.languages) {
      locals.add(Locale(language.languageCode!, language.countryCode));
    }
    
    print("now visiting ===>>> $lastRoute");

    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return ScreenUtilInit(
              builder: (_, child) => GetMaterialApp(
                navigatorObservers: <NavigatorObserver>[MyRouteObserver()],
                debugShowCheckedModeBanner: false,
                title: 'Olga',
                locale: Provider.of<LocalizationProvider>(context).locale,
                themeMode: ThemeMode.system,
                theme: themeProvider.darkTheme ? dark : light,
                localizationsDelegates: [
                  AppLocalization.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  FallbackLocalizationDelegate(),
                ],
                supportedLocales: locals,
                builder: (context, widget) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: widget!,
                  );
                },
                initialRoute: (lastRoute != null)
                    ? lastRoute
                    : authProvider.isLoggedIn()
                        ? VisionBoard.id 
                        
                        : StartingScreen.id, 
                      
                routes: routes,
                home: const StartingScreen(),
              ),
            );
          },
        );
      },
    );
  }
}
