import 'package:flutter/material.dart';

PreferredSize buildAppbar() {
  const popupMenuTextStyle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );

  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: AppBar(
      elevation: 0,
      title: const Padding(
        padding: EdgeInsets.all(12),
        child: Text(
          "WP Manager",
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 10),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ),
        PopupMenuButton(
          color: Colors.white,
          position: PopupMenuPosition.under,
          padding: const EdgeInsets.symmetric(vertical: 20),
          iconSize: 28,
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 1,
              child: Text(
                "Add new Contact",
                style: popupMenuTextStyle,
              ),
            ),
            const PopupMenuItem(
              value: 2,
              child: Text(
                "Add new Contact",
                style: popupMenuTextStyle,
              ),
            ),
            const PopupMenuItem(
              value: 3,
              child: Text(
                "Add new Contact",
                style: popupMenuTextStyle,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
