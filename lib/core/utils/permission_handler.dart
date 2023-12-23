import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatsapp_manager/config/routing/app_router.dart';

Future<bool> isPermissionGranted(Permission permissionType) async {
  final PermissionStatus status = await permissionType.request();
  if (status == PermissionStatus.granted) {
    return true;
  } else if (status == PermissionStatus.denied ||
      status == PermissionStatus.limited) {
    WPmanagerRouter.parentScaffoldMessengerKey.currentState
        ?.hideCurrentSnackBar();
    WPmanagerRouter.parentScaffoldMessengerKey.currentState
        ?.showSnackBar(permissionMessage);
  } else if (status == PermissionStatus.permanentlyDenied) {
    openAppSettings();
  }
  return false;
}

SnackBar permissionMessage = SnackBar(
  content: const Text(
      "Some functionalities won't work without the necessary permission"),
  action: SnackBarAction(
    label: "Open Settings",
    onPressed: () {
      openAppSettings();
    },
  ),
);
