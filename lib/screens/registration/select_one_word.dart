// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/widgets/primary_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/ques_res_provider.dart';
import 'package:provider/provider.dart';

import '../../provider/storage_provider.dart';
import 'one_word_result.dart';

class SelectOneWord extends StatefulWidget {
  static const String id = "/selectOneWord";
  const SelectOneWord({Key? key}) : super(key: key);

  @override
  State<SelectOneWord> createState() => _SelectOneWordState();
}

class _SelectOneWordState extends State<SelectOneWord> {
  bool showButton = false;
  int? selectedIndex;
  final List<String> _wordName = [
    "Engaged in my Life",
    "Feel Alive",
    "Happy",
    "Love my Life",
    "Positive",
    "Relaxed",
    "Satisfied with my Life",
    "Strong",
  ];

  @override
  void initState() {
    super.initState();
    Provider.of<StorageProvider>(context, listen: false).audioSpeak(
        "Now select one word that represents how you would love your life to be.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(),
      ),
      body: Container(
        padding: EdgeInsets.all(15.w),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(height: 10.h),
                Image.asset(
                  Images.userPlaceholder,
                  width: 60.w,
                ),
                SizedBox(width: 10.w),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: Text(
                      getTranslated('how_you_love_your_life', context),
                      style: TextStyles.smallBoldTextStyle(context),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Expanded(
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 2,
                    childAspectRatio: (16 / 8),
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          Provider.of<StorageProvider>(context, listen: false)
                              .audioSpeak(_wordName[index]);
                          print("now selected ===>>> $index");
                          selectedIndex = index;
                          showButton = true;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? const Color(0xffDEB988).withOpacity(0.2)
                              : const Color(0xffF4F4F6).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: selectedIndex == index
                                  ? const Color(0xffDEB988)
                                  : Colors.transparent,
                              width: 1),
                          image: const DecorationImage(
                            image: AssetImage(Images.buttonBG),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Row(
                          children: [
                            Flexible(
                              child: Center(
                                child: Text(_wordName[index].toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      letterSpacing: 1.sp,
                                      fontWeight: selectedIndex == index
                                          ? FontWeight.w700
                                          : FontWeight.normal,
                                      color: selectedIndex == index
                                          ? const Color(0xffDEB988)
                                          : Colors.black,
                                    )
                                    // color: index==0 ? Colors.amber : null,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
      bottomSheet: Visibility(
        visible: showButton,
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: PrimaryButton(
            title: getTranslated("continue", context),
            onPressed: () {
              setState(() {
                QuesResProvider quesResProvider =
                    Provider.of<QuesResProvider>(context, listen: false);
                Provider.of<StorageProvider>(context, listen: false)
                    .registrationSafetyNet(route: OneWordResult.id);
                quesResProvider.oneWordBestCapture(
                    wordId: selectedIndex ?? 0, context: context);
                print("button called the navigator fuction");
                print("going to page ===>>> $selectedIndex");
                //goPage(context, const OneWordResult());
              });
            },
          ),
        ),
      ),
    );
  }
}
