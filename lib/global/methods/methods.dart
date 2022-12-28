// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:olga/models/data_model/auth_model.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/auth_provider.dart';

import '../../screens/start/starting_screen.dart';

//* ============== |> will be back where we want <| ============== */
void goPage(BuildContext? context, page) {
  Navigator.push(
    context!,
    MaterialPageRoute(builder: (context) => page),
  );
}

goPageWithName(BuildContext? context, page) {
  Navigator.of(context!).pushNamed(page);
}

goNamedWithBool(BuildContext context, String page, bool? value) {
  Navigator.of(context).pushNamed(page, arguments: value);
}

goPageAndRemove(BuildContext? context, page) {
  Navigator.pushNamedAndRemoveUntil(
    context!,
    page,
    (route) => false,
  );
}

//* ============== |>   toast    <| ============== */
void showToast(message, BuildContext? context) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

Future<void> showSuccessToast(message, BuildContext? context) async {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.green,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

//* ============== |>   snackBar    <| ============== */
void errorSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: Colors.red,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void successSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: Colors.green,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

//* ============== |>   Asset Image Path    <| ============== */

Future<File> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load('assets/$path');

  final file = File('${(await getTemporaryDirectory()).path}/$path');
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file;
}

//* ======== |> will be back where we want || for ios app <| ========== */
/* Future<bool> onWillPopWarning(BuildContext context) async {
  AuthProvider _authProvider =
      Provider.of<AuthProvider>(context, listen: false);
  return (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // insetPadding: EdgeInsets.zero,
            elevation: 0,
            title: Center(
              child: Text(
                getTranslated("warning", context),
                style: TextStyles.boldTextStyle(context),
              ),
            ),
            content: Text(
              getTranslated("strat_from_initial", context),
              textAlign: TextAlign.center,
            ),
            actions: [
              Column(
                children: [
                  const Divider(
                    height: 1.0,
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            goPageAndRemove(context, StartingScreen.id);
                            _authProvider.authModel.resStatusCode == 0;
                            _authProvider.authModel.statuscode == 0;
                          },
                          child: Text(
                            getTranslated("agree", context),
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const VerticalDivider(
                          width: 1.0,
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(getTranslated("contine", context)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      )) ??
      false;
} */

//* ============== |> onWillPop when logout <| ============== */
Future<bool> onWillPopLogout(BuildContext context) async {
  return (await showDialog(
        context: context,
          builder: (BuildContext context) {
            return Consumer<AuthProvider>(
                builder: (context, authProvider, child) {
              return AlertDialog(
                elevation: 0,
                title: Center(
                  child: Text(
                    getTranslated("log_out", context),
                    style: TextStyles.boldTextStyle(context),
                  ),
                ),
                content: Text(
                  getTranslated("want_to_logout", context),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  Column(
                    children: [
                      const Divider(
                        height: 1.0,
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(getTranslated("cancel", context)),
                            ),
                            const VerticalDivider(
                              width: 1.0,
                              thickness: 0.5,
                              color: Colors.grey,
                            ),
                            TextButton(
                              onPressed: () async {
                                final authProvider = Provider.of<AuthProvider>(context,listen: false);                                
                                authProvider.authModel = AuthModel();
                                final storage = Provider.of<StorageProvider>(context,listen: false);                                
                                storage.changeName("");
                                storage.updateUserEmail("");
                                
                                authProvider.prefs!.clear();
                                await FirebaseAuth.instance.signOut();
                                await GoogleSignIn().signOut();
                                
                                goPageAndRemove(context, StartingScreen.id);

                              },
                              child: Text(
                                getTranslated("log_out", context),
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      )) ??
      true;
}

//* ============== |> onWillPop when exit <| ============== */
Future<bool> onWillPopExit(BuildContext context, key) async {
  return (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // insetPadding: EdgeInsets.zero,
            elevation: 0,
            title: Center(
              child: Text(
                getTranslated("exit", context),
                style: TextStyles.boldTextStyle(context),
              ),
            ),
            content: Text(
              getTranslated("want_to_exit", context),
              textAlign: TextAlign.center,
            ),
            actions: [
              Column(
                children: [
                  const Divider(
                    height: 1.0,
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(getTranslated("no", context)),
                        ),
                        const VerticalDivider(
                          width: 1.0,
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                        TextButton(
                          onPressed: () {
                            exit(0);
                          },
                          child: Text(
                            getTranslated("yes", context),
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      )) ??
      false;
}

//* ============== |> onWillPop when DeleteAccount <| ============== */
Future<bool> onWillPopDeleteAccount(BuildContext context) async {
  return (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // insetPadding: EdgeInsets.zero,
            elevation: 0,
            title: Center(
              child: Text(
                getTranslated("exit", context),
                style: TextStyles.boldTextStyle(context),
              ),
            ),
            content: Text(
              getTranslated("want_to_exit", context),
              textAlign: TextAlign.center,
            ),
            actions: [
              Column(
                children: [
                  const Divider(
                    height: 1.0,
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(getTranslated("no", context)),
                        ),
                        const VerticalDivider(
                          width: 1.0,
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                        TextButton(
                          onPressed: () {
                            exit(0);
                          },
                          child: Text(
                            getTranslated("yes", context),
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      )) ??
      false;
}
//------> 

