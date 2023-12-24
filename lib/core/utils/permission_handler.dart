import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatsapp_manager/config/routing/app_router.dart';

Future<bool> isPermissionGranted(Permission permissionType) async {
  final PermissionStatus status = await permissionType.request();

  if (status == PermissionStatus.granted) {
    return true;
  }

  // if (status == PermissionStatus.denied ||
  //     status == PermissionStatus.limited) {}

  if (status == PermissionStatus.permanentlyDenied ||
      status == PermissionStatus.restricted) {
    openAppSettings();
  }

  WPmanagerRouter.parentScaffoldMessengerKey.currentState
      ?.hideCurrentSnackBar();
  WPmanagerRouter.parentScaffoldMessengerKey.currentState
      ?.showSnackBar(permissionMessage);
  return false;
}

SnackBar permissionMessage = SnackBar(
  content: const Text(
      "Some functionalities won't work without the necessary permission"),
  action: SnackBarAction(
    label: "GRANT",
    onPressed: () {
      openAppSettings();
    },
  ),
);
