import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class HelperFunctions {
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static void navigateToScreenAndRemove(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => screen,
      ),
      (route) {
        return false;
      },
    );
  }

  static void navigateToBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void customAlertDialog(BuildContext context, String messageOfAlert) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(messageOfAlert),
          actions: [
            ElevatedButton(
              onPressed: () {
                navigateToBack(context);
              },
              child: Text(
                S.of(context).ok, //"ok",
              ),
            ),
          ],
        );
      },
    );
  }

  static void customConfirmDialog(BuildContext context, String messageOfAlert,
      {required void Function()? onPressed}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(messageOfAlert),
          actionsAlignment: MainAxisAlignment.start,
          actions: [
            ElevatedButton(
              onPressed: onPressed,
              child: Text(
                S.of(context).ok, // "ok",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                HelperFunctions.navigateToBack(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                S.of(context).cancel, //  "cancel",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  // static void showSnackBar(BuildContext context, SnackBar customSnackBar) {
  //   ScaffoldMessenger.of(context).showSnackBar(customSnackBar);
  // }

  //  void showTopSnackBar(BuildContext context) {
  //    showTopSnackBar(
  //         Overlay.of(context),
  //         padding: EdgeInsets.zero,
  //         const CustomSnackBarWidget(),
  //       );

  // }

  // static bool isAndroid() {
  //   return Platform.isAndroid;
  // }

  // static bool isIos() {
  //   return Platform.isIOS;
  // }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // static double getBottomNavigationBarHeight(BuildContext context) {
  //   double screenHeight = MediaQuery.of(context).size.height;

  //   double paddingBottom = MediaQuery.of(context).padding.bottom;

  //   double visibleHeight = screenHeight - paddingBottom;

  //   return visibleHeight;
  // }
}
