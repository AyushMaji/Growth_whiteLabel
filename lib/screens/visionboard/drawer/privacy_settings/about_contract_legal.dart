import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/text_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/screens/visionboard/drawer/privacy_settings/contact.dart';
import 'package:olga/screens/visionboard/drawer/privacy_settings/faq.dart';
import 'package:olga/screens/visionboard/drawer/privacy_settings/privacy_policy.dart';
import 'package:olga/screens/visionboard/drawer/privacy_settings/termof_use.dart';

import 'about_version.dart';
import 'feedback.dart';
import 'package:in_app_review/in_app_review.dart';

class AboutContractLegal extends StatefulWidget {
  static const String id = "AboutContractLegal";

  const AboutContractLegal({Key? key}) : super(key: key);

  @override
  State<AboutContractLegal> createState() => _AboutContractLegalState();
}

class _AboutContractLegalState extends State<AboutContractLegal> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: dashboardAppBar(
        context,
        getTranslated("about_contact_legal", context),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15.sp),
              width: size.width,
              color: Colors.grey.shade200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 15.sp),
                  Text(
                    getTranslated("about", context),
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                  SizedBox(height: 18.sp),
                  GestureDetector(
                    onTap: () {
                      goPage(context, const FAQ());
                    },
                    child: Text(
                      getTranslated("faqs", context),
                      style: TextStyles.regularBoldTextStyle(context),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  GestureDetector(
                    onTap: () {
                      //showToast("In development mode...", context);
                      goPage(context, const FeedBackPage());
                    },
                    child: Text(
                      getTranslated("feedback", context),
                      style: TextStyles.regularBoldTextStyle(context),
                    ),
                  ),
                ],
              ),
            ),

            //
            SizedBox(height: 20.sp),
            Container(
              width: size.width,
              color: Colors.grey.shade200,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getTranslated("contact", context),
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                    SizedBox(height: 18.sp),
                    GestureDetector(
                      onTap: () {
                        goPage(context, const Contact());
                      },
                      child: Text(
                        getTranslated("contact_us", context),
                        style: TextStyles.regularBoldTextStyle(context),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    GestureDetector(
                      onTap: () async {
                         // LaunchReview.launch(
                          // androidAppId: "com.cfpc.olga");
                           final InAppReview inAppReview = InAppReview.instance;
                          //  if (await inAppReview.isAvailable()) {
                          //  inAppReview.requestReview();
                          //  }
                          inAppReview.openStoreListing();
                      },
                      child: Text(
                        getTranslated("rate_the_app", context),
                        style: TextStyles.regularBoldTextStyle(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //
            SizedBox(height: 20.sp),
            Container(
              width: size.width,
              color: Colors.grey.shade200,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getTranslated("legal", context),
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                    SizedBox(height: 18.sp),
                    GestureDetector(
                        onTap: () {
                          goPage(context, const AboutThisVersion());
                        },
                        child: Text(
                          getTranslated("about_the_version", context),
                          style: TextStyles.regularBoldTextStyle(context),
                        )),
                    SizedBox(height: 10.sp),
                    GestureDetector(
                        onTap: () {
                          goPage(context, const TermOfUse());
                        },
                        child: Text(
                          getTranslated("terms_of_use", context),
                          style: TextStyles.regularBoldTextStyle(context),
                        )),
                    SizedBox(height: 10.sp),
                    GestureDetector(
                      onTap: () {
                        goPage(context, const PrivacyPolicy());
                      },
                      child: Text(
                        getTranslated("privacy_policy", context),
                        style: TextStyles.regularBoldTextStyle(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
