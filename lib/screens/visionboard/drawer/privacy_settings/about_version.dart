
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutThisVersion extends StatefulWidget {
  const AboutThisVersion({Key? key}) : super(key: key);

  @override
  State<AboutThisVersion> createState() => _AboutThisVersionState();
}

class _AboutThisVersionState extends State<AboutThisVersion> {
  var _version;

  void _init() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String version = packageInfo.version;
    setState(() {
      _version = version;
    });
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dashboardAppBar(
        context,
        getTranslated("about_the_version", context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.h),
              Text(
                getTranslated("title", context),
                style: TextStyles.smallBoldTextStyle(context),
              ),
              SizedBox(height: 12.h),
              (_version == null)
                  ? const CircularProgressIndicator()
                  : Text('Version $_version'),
              Text(getTranslated("app_size", context)),
              SizedBox(height: 12.h),
              Text(
                getTranslated("libraries_we_use", context),
                style: TextStyles.smallBoldTextStyle(context),
              ),
              SizedBox(height: 15.sp),
              Text(
                getTranslated(
                    "following_sets_forth_attribution_notices", context),
              ),
              /* ExpansionTile(
                childrenPadding: EdgeInsets.zero,
                tilePadding: EdgeInsets.zero,
                title: Text(
                  getTranslated("password_app_extension", context),
                  style: TextStyles.smallBoldTextStyle(context),
                ),
                children: [
                  Text(
                    getTranslated("copyright", context),
                  ),
                ],
              ), */
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

