// ignore_for_file: avoid_print
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:olga/global/constants/app_constants.dart';
import 'package:olga/global/constants/images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/alart_dialogbox.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/profile_provider.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:olga/screens/visionboard/drawer/notification/notifications.dart';
import 'package:olga/screens/visionboard/drawer/app_settings/offline_usage.dart';
import 'package:olga/screens/visionboard/drawer/payment/add_card.dart';
import 'package:olga/screens/visionboard/drawer/profile/personal_settings.dart';
import 'package:olga/screens/visionboard/drawer/privacy_settings/about_contract_legal.dart';
import 'package:olga/screens/visionboard/drawer/payment/purchase_history.dart';
import 'package:olga/screens/visionboard/drawer/app_settings/sync_calendar.dart';
import 'package:olga/screens/visionboard/drawer/app_settings/change_language.dart';
import 'package:olga/screens/visionboard/drawer/profile/profile_details.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';

import '../payment/payment_info.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  XFile? image;
  String? damiImage;

  @override
  void initState() {
    super.initState();
    ProfileProvider profileData =
        Provider.of<ProfileProvider>(context, listen: false);
    //profileData.viewUserProfileDetails();

    damiImage = profileData.profileModel.data?.userDetails?.image;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StorageProvider>(builder: (context, storeValues, child) {
      return Consumer<ProfileProvider>(builder: (context, profileData, child) {
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: ListTile(
                onTap: () {
                  setState(() {
                    //goPage(context, const AboutContractLegal());
                    goPage(context, const ProfileDetails());

                    print(
                        "${AppConstants.baseURL}${profileData.profileModel.data?.userDetails?.image}");
                  });
                },
                leading: CircularProfileAvatar(
                  '',
                  child: FadeInImage.assetNetwork(
                      placeholder: Images.uploadImage,
                      image: profileData
                                  .profileModel.data?.userDetails?.image ==
                              null
                          ? 'https://raw.githubusercontent.com/muktabd/public-images/main/profile-placeholder.jpeg'
                          : "${AppConstants.baseURL}${profileData.profileModel.data?.userDetails?.image}"),
                  radius: 24,
                  borderWidth: 1,
                  borderColor: Colors.red,
                ),

                /* storeValues.userImage.path.isNotEmpty
                        ? CircularProfileAvatar(
                            '',
                            child: Image.file(
                              File(storeValues.userImage.path),
                              width: 162,
                              height: 110,
                              fit: BoxFit.cover,
                            ),
                            radius: 24,
                          )
                        : Image.asset(
                            Images.uploadImage,
                            height: 20,
                          ), */
                title: Text(
                  profileData.profileModel.data?.userDetails?.firstName ??
                      storeValues.name,
                  style: TextStyles.smallBoldTextStyle(context),
                ),
                subtitle: Text(
                    profileData.profileModel.data?.userDetails?.email ??
                        storeValues.email),
              ),
            ),

            const Divider(height: 1.0, thickness: 0.5, color: Colors.grey),

            //
            ListTile(
              title: Text(
                getTranslated("personal_settings", context),
                style: TextStyles.regularBoldTextStyle(context),
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    goPage(context, const PersonalSettings());
                  });
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 16.sp,
                ),
              ),
            ),
            const Divider(height: 1.0, thickness: 0.5, color: Colors.grey),

            //Modules
            ExpansionTile(
              expandedAlignment: Alignment.centerLeft,
              title: Text(
                getTranslated("modules", context),
                style: TextStyles.regularBoldTextStyle(context),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // showToast("My life is not done yet completly", context);
                            },
                            child: Text(getTranslated("mylife", context)),
                          ),
                          SizedBox(width: 10.w),
                          Shimmer.fromColors(
                            baseColor: Colors.red,
                            highlightColor: Colors.white,
                            child: Text(
                              "Coming Soon",
                              style: TextStyle(fontSize: 9.sp),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                            },
                            child: Text(getTranslated("mycareer", context)),
                          ),
                          SizedBox(width: 10.w),
                          Shimmer.fromColors(
                            baseColor: Colors.red,
                            highlightColor: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Coming Soon",
                                style: TextStyle(fontSize: 9.sp),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                            },
                            child:
                                Text(getTranslated("myrelationships", context)),
                          ),
                          SizedBox(width: 10.w),
                          Shimmer.fromColors(
                            baseColor: Colors.red,
                            highlightColor: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Coming Soon",
                                style: TextStyle(fontSize: 9.sp),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                            },
                            child: Text(getTranslated("myeq", context)),
                          ),
                          SizedBox(width: 10.w),
                          Shimmer.fromColors(
                            baseColor: Colors.red,
                            highlightColor: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Coming Soon",
                                style: TextStyle(fontSize: 9.sp),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                            },
                            child: Text(getTranslated(
                              "myfamily",
                              context,
                            )),
                          ),
                          SizedBox(width: 10.w),
                          Shimmer.fromColors(
                            baseColor: Colors.red,
                            highlightColor: Colors.white,
                            child: Text("Coming Soon",
                                style: TextStyle(
                                  fontSize: 9.sp,
                                )),
                          )
                        ],
                      ),
                      SizedBox(height: 15.h),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 1.0, thickness: 0.5, color: Colors.grey),
            //
            //
            //Payment Methods
            ExpansionTile(
              expandedAlignment: Alignment.centerLeft,
              title: Text(
                getTranslated("payment_methods", context),
                style: TextStyles.regularBoldTextStyle(context),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          goPage(context, const PurchaseHistory());
                        },
                        child: Text(getTranslated("purchase_history", context)),
                      ),
                      SizedBox(height: 8.h),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            goPage(context, const PaymentInfo());
                          });
                        },
                        child: Text(
                          getTranslated("payment_information", context),
                        ),
                      ),
                      SizedBox(height: 15.h),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 1.0, thickness: 0.5, color: Colors.grey),

            //App Settings
            ExpansionTile(
              expandedAlignment: Alignment.centerLeft,
              title: Text(
                getTranslated("app_settings", context),
                style: TextStyles.regularBoldTextStyle(context),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              goPage(context, const Notifications());
                            });
                          },
                          child: Text(getTranslated("notification", context))),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                 // goPage(context, const OfflineUsage());
                                });
                              },
                              child:
                                  Text(getTranslated("offline_usages", context))),

                                   SizedBox(width: 10.w),
                          Shimmer.fromColors(
                            baseColor: Colors.red,
                            highlightColor: Colors.white,
                            child: Text(
                              "Coming Soon",
                              style: TextStyle(fontSize: 9.sp),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                 // goPage(context, const SyncToMyCalendar());
                                });
                              },
                              child: Text(getTranslated("sync_calendar", context))),

                               SizedBox(width: 10.w),
                          Shimmer.fromColors(
                            baseColor: Colors.red,
                            highlightColor: Colors.white,
                            child: Text(
                              "Coming Soon",
                              style: TextStyle(fontSize: 9.sp),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 8.h),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              goPage(context, const ChangeLanguage());
                            });
                          },
                          child:
                              Text(getTranslated("change_language", context))),
                      SizedBox(height: 15.h),
                    ],
                  ),
                )
              ],
            ),
            const Divider(height: 1.0, thickness: 0.5, color: Colors.grey),

            //Privacy Settings
            ExpansionTile(
              expandedAlignment: Alignment.centerLeft,
              title: Text(
                getTranslated("privacy_settings", context),
                style: TextStyles.regularBoldTextStyle(context),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.w), //0389488662
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              goPage(context, const AboutContractLegal());
                            });
                          },
                          child: Text(
                              getTranslated("about_contact_legal", context))),
                      SizedBox(height: 15.h),
                    ],
                  ),
                )
              ],
            ),
            const Divider(height: 1.0, thickness: 0.5, color: Colors.grey),

            //Social
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(getTranslated("social", context))),
                  Row(
                    children: [
                      Flexible(
                        child: Image.asset(
                          Images.instragram,
                          width: 35.sp,
                        ),
                      ),
                      SizedBox(width: 8.sp),
                      Flexible(
                        child: Image.asset(
                          Images.linkedin,
                          width: 35.sp,
                        ),
                      ),
                      SizedBox(width: 8.sp),
                      Flexible(
                        child: Image.asset(
                          Images.facebook,
                          width: 35.sp,
                        ),
                      ),
                      SizedBox(width: 8.sp),
                      Flexible(
                        child: Image.asset(
                          Images.twitter,
                          width: 35.sp,
                        ),
                      ),
                      SizedBox(width: 8.sp),
                      Flexible(
                        child: Image.asset(
                          Images.wechat,
                          width: 35.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //LogOut
            ListTile(
              iconColor: Colors.red,
              textColor: Colors.red,
              leading: const Icon(Icons.logout_sharp),
              title: GestureDetector(
                onTap: () {
                  setState(() {
                    onWillPopLogout(context);
                  });
                },
                child: Text(
                  getTranslated("log_out", context),
                  style: TextStyle(
                      fontFamily: "",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),

            //Delete Account
            ListTile(
              iconColor: Colors.red,
              textColor: Colors.red,
              leading: const Icon(Icons.delete),
              title: GestureDetector(
                onTap: () {
                  setState(() {
                    AlartDialogBox.deleteAccountAlartBox(context);
                  });
                },
                child: Text(
                  getTranslated("delete_account", context),
                  style: TextStyle(
                      fontFamily: "",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        );
      });
    });
  }
}
