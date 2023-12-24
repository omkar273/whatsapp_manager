import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:whatsapp_manager/config/theme/app_theme.dart';

class ChatActionButton extends StatefulWidget {
  const ChatActionButton({super.key});

  @override
  State<ChatActionButton> createState() => _ChatActionButtonState();
}

class _ChatActionButtonState extends State<ChatActionButton> {
  final isDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      child: SpeedDial(
        closeDialOnPop: true,
        backgroundColor: appPrimaryColor,
        overlayOpacity: 0,
        shape: const CircleBorder(),
        foregroundColor: Colors.white,
        animatedIcon: AnimatedIcons.menu_close,
        spacing: 10,
        openCloseDial: isDialOpen,
        activeBackgroundColor: appPrimaryColor,
        childrenButtonSize: const Size.fromRadius(30),
        children: [
          buildSpeedDialChild(
            child: const Icon(Icons.chat),
            label: "Add Contact",
          ),
        ],
      ),
    );
  }
}

SpeedDialChild buildSpeedDialChild({
  Widget? child,
  String? label,
  void Function()? onTap,
}) =>
    SpeedDialChild(
      child: child,
      label: label,
      onTap: onTap,
      shape: const CircleBorder(),
      backgroundColor: appPrimaryColor,
      foregroundColor: Colors.white,
    );
