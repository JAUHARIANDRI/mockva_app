import 'package:flutter/material.dart';

class AppBarCustom {
  // app bar with back button using navigator
  static appBarStyle1(BuildContext context, String title) {
    return AppBar(
      title: Text(
        title,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }

  static appBarStyle(BuildContext context, String title) {
    return AppBar(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }

  static appBarStyleCinfirm(BuildContext context, String title) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          // Icons.arrow_back_ios,
          Icons.arrow_back,
          size: 20,
        ),
        // TransferPage
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}
