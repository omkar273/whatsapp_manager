import 'package:flutter/material.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:whatsapp_manager/config/routing/app_router.dart';
import 'package:whatsapp_manager/config/theme/app_theme.dart';
import 'package:whatsapp_manager/core/get_it/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocatorInit();
  await WPmanagerRouter.instance;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ConnectivityAppWrapper(
      app: MaterialApp.router(
        title: 'Whatsapp Manager',
        theme: appThemeData,
        scaffoldMessengerKey: WPmanagerRouter.parentScaffoldMessengerKey,
        routerConfig: WPmanagerRouter.router,
        debugShowCheckedModeBanner: false,
        builder: (context, widget) => ConnectivityWidgetWrapper(
          disableInteraction: false,
          height: 70,
          child: widget ?? Container(),
        ),
      ),
    );
  }
}
