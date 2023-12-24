import 'package:flutter/material.dart';
import 'package:whatsapp_manager/core/utils/capitalize.dart';

class ChatTile extends StatelessWidget {
  final String contactName;
  final String? description;
  const ChatTile({
    super.key,
    required this.contactName,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: Colors.black.withOpacity(0.25),
      onTap: () {},
      title: Text(
        capitalize(contactName),
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      subtitle: Text(
        description ?? "beginning of conversation",
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black54,
        ),
      ),
      leading: const CircleAvatar(
        backgroundColor: Colors.grey,
        radius: 28,
        child: Icon(
          Icons.person_2_sharp,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
