import 'package:flutter/material.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatsapp_manager/config/routing/app_router.dart';
import 'package:whatsapp_manager/core/get_it/service_locator.dart';
import 'package:whatsapp_manager/core/utils/permission_handler.dart';

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
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        scaffoldMessengerKey: WPmanagerRouter.parentScaffoldMessengerKey,
        routerConfig: WPmanagerRouter.router,
        builder: (context, widget) => ConnectivityWidgetWrapper(
          disableInteraction: true,
          height: 80,
          child: widget!,
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("home"),
          onPressed: () => isPermissionGranted(Permission.calendarFullAccess),
        ),
      ),
    );
  }
}
