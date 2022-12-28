//delete card from list
// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/profile_provider.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../../provider/storage_provider.dart';
import '../../provider/visionboard_provider.dart';
import '../../screens/auth/signin_screen.dart';
import '../methods/methods.dart';

class AlartDialogBox {
  static deleteAccountAlartBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // insetPadding: EdgeInsets.zero,
          elevation: 0,
          title: Center(
            child: Text(
              "Delete Account",
              style: TextStyles.boldTextStyle(context),
            ),
          ),
          content: Text(
            getTranslated("are_you_sure_want_todelete", context),
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
                        onPressed: () async{
                          //cardNumber.removeAt(index);
                          final authProvider =
                              Provider.of<AuthProvider>(context, listen: false);
                          authProvider.authModel.data?.user?.otp = null;

                          authProvider.authModel.statuscode == 0;
                          await Provider.of<ProfileProvider>(context, listen: false).deleteUser(context: context);
                          goPageAndRemove(context, SigninScreen.id);
                          print("${authProvider.authModel.data?.token}");
                        },
                        child: Text(
                          getTranslated("delete", context),
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
  }

  static deleteGoalAlartBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Consumer<StorageProvider>(
            builder: (context, _storeProvider, child) {
          return Consumer<VisionboardProvider>(
              builder: (context, _visionBoard, child) {
            return AlertDialog(
              // insetPadding: EdgeInsets.zero,
              elevation: 0,
              title: Center(
                child: Text(
                  "Delete This Goal !",
                  style: TextStyles.boldTextStyle(context),
                ),
              ),
              content: Text(
                "Are you sure want to delete the goal ?",
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
                              final _goalPlanningProvider =
                                  Provider.of<VisionboardProvider>(context,
                                      listen: false);
                              _goalPlanningProvider.deleteGoal(
                                  goalID: _visionBoard
                                          .storeGoalData
                                          .data
                                          ?.goals?[_storeProvider.goalIndex]
                                          .id ??
                                      0,
                                  context: context);
                            },
                            child: Text(
                              getTranslated("delete", context),
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
                            child: Text(getTranslated("cancel", context)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          });
        });
      },
    );
  }

  static removeCardAlartBox(BuildContext context, String card) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // insetPadding: EdgeInsets.zero,
          elevation: 0,
          title: Center(
            child: Text(
              getTranslated("remove_card", context),
              style: TextStyles.boldTextStyle(context),
            ),
          ),
          content: Text(
            getTranslated("want_to_remove_primary_payment", context),
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
                        onPressed: () {
                          StorageProvider storeProvider = Provider.of<StorageProvider>(context, listen: false);
                          storeProvider.removeCardDetails(card);
                          print("deleted index is ===>>> $card");
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          getTranslated("remove", context),
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
  }
}
