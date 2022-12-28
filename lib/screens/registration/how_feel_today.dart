// ignore_for_file: avoid_print
import 'package:olga/global/constants/app_constants.dart';
import 'package:olga/provider/ques_res_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/primary_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/storage_provider.dart';

import 'choose_word.dart';

class HowFeelToday extends StatefulWidget {
  static const String id = "/howFeelToday";
  const HowFeelToday({Key? key}) : super(key: key);

  @override
  State<HowFeelToday> createState() => _HowFeelTodayState();
}

class _HowFeelTodayState extends State<HowFeelToday> {
  bool isSelected = false;
  bool showButton = false;
  int? selectedIndex;

  final List _imageName = [
    Images.row1Icon1,
    Images.row1Icon2,
    Images.row1Icon3,
    Images.row1Icon4,
    Images.row2Icon1,
    Images.row2Icon2,
    Images.row2Icon3,
    Images.row2Icon4,
    Images.row3Icon1,
    Images.row3Icon2,
    Images.row3Icon3,
    Images.row3Icon4,
    Images.row4Icon1,
    Images.row4Icon2,
    Images.row4Icon3,
    Images.row4Icon4,
  ]; // Option 1

  @override
  void initState() {
    super.initState();
    Provider.of<StorageProvider>(context, listen: false).audioSpeak(
        "Select one picture that represents how you feel about life today.");
  }

  @override
  Widget build(BuildContext context) {
    StorageProvider storeValues =
        Provider.of<StorageProvider>(context, listen: false);
    //
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(),
      ),
      body: Container(
        padding: AppConstants.paddingBottomZero,
        margin: EdgeInsets.only(bottom: 50.h),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(height: 10.h),
                Image.asset(Images.userPlaceholder, width: 60.w),
                SizedBox(width: 10.w),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: Text(
                     // getTranslated('choose_a_picture', context),
                     "Select one picture that represents how you feel about life today.",
                      style: TextStyles.smallBoldTextStyle(context),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),

            //
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: (4 / 6),
                ),
                itemCount: 16,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? const Color(0xffB50000).withOpacity(0.1)
                          : const Color(0xffF4F4F6).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                          color: selectedIndex == index
                              ? const Color(0xffB50000)
                              : Color(0xffE9E9E9),
                          width: 0.9),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          print("now selected ===>>> $index");
                          selectedIndex = index;
                          showButton = true;
                        });
                      },
                      child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          _imageName[index],fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // SizedBox(height: 70.h),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: AppConstants.paddingTopZero,
        child: Visibility(
          visible: showButton,
          child: PrimaryButton(
            title: getTranslated("continue", context),
            onPressed: () {
              setState(() {
                print("going to page ===>>> $selectedIndex");
                storeValues.changeOnePicture(selectedIndex);
                Provider.of<StorageProvider>(context, listen: false)
                    .registrationSafetyNet(route: ChooseWord.id);
                // goPage(context, const ChooseWord());
                QuesResProvider quesResProvider =
                    Provider.of<QuesResProvider>(context, listen: false);
                quesResProvider.pictureResponse(
                  pictureId: selectedIndex ?? 0,
                  context: context,
                );
              });
            },
          ),
        ),
      ),
    );
  }
}
