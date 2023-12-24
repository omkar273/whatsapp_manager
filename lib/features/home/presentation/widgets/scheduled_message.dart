import 'package:flutter/material.dart';
import 'package:whatsapp_manager/core/utils/capitalize.dart';
import 'package:intl/intl.dart';

class ScheduledMessageTile extends StatelessWidget {
  final String contactName;
  final String message;
  const ScheduledMessageTile({
    super.key,
    required this.contactName,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Text(DateFormat('HH:mm a').format(DateTime.now()),
          style: const TextStyle(fontSize: 13)),
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
        message,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black54,
        ),
      ),
    );
  }
}
