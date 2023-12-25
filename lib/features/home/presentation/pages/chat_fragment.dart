import 'package:flutter/material.dart';
import 'package:whatsapp_manager/features/home/presentation/widgets/chat_action_button.dart';
import 'package:whatsapp_manager/features/home/presentation/widgets/scheduled_message.dart';

import 'package:whatsapp_manager/features/home/presentation/widgets/chat_tile.dart';

class ChatFragement extends StatelessWidget {
  const ChatFragement({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Column(
            children: [
              ChatTile(contactName: "omkar sonawane"),
              ScheduledMessageTile(
                contactName: "omkar sonawane",
                message: "lvkt yeshil re",
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ChatActionButton(),
    );
  }
}
