// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/provider/ques_res_provider.dart';
import 'package:provider/provider.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/storage_provider.dart';
import '../../global/styles/button_style.dart';
import 'explain_selected_picture.dart';

class ChooseWord extends StatefulWidget {
  static const String id = "/chooseaWord";
  const ChooseWord({Key? key}) : super(key: key);

  @override
  State<ChooseWord> createState() => _ChooseWordState();
}

class _ChooseWordState extends State<ChooseWord> {
  bool showButton = false;
  int? selectedIndex;

  final List<String> _wordName = [
    // "Anxious",
    // "Bored",
   // "Confused",
   // "Disorganized",
    "Engaged in my Life",
    //"Fatigued",
    "Feel Alive",
    "Happy",
    "Love my Life",
    "Positive",
    "Relaxed",
    "Satisfied with my Life",
    // "Stressed",
    "Strong",
    //"Unhappy",
    //"Upset",
  ];

    @override
  void initState(){
     super.initState();
     Provider.of<StorageProvider>(context, listen: false).audioSpeak("Now select one word that represents how you would love your life to be.");
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
        padding: EdgeInsets.all(15.w),
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
                      getTranslated('how_you_love_your_life', context),
                      style: TextStyles.smallBoldTextStyle(context),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
            //
            SizedBox(height: 10.sp),
            //
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 2,
                  childAspectRatio: (16 / 8),
                ),
                itemCount: _wordName.length,
                itemBuilder: (context, index) {
                  return buildCard(index);
                },
              ),
            ),
            Visibility(
              visible: showButton,
              child: SubmitButton(
                title: getTranslated("continue", context),
                onPressed: () {
                  setState(() {
                    //  Provider.of<StorageProvider>(context, listen: false).audioSpeak(_wordName[selectedIndex as int]);
                    storeValues.addOneWordIndex(selectedIndex);
                    print("going to page ===>>> $selectedIndex");
                    //goPage(context, const ExplainSelectedPicture());
                    Provider.of<StorageProvider>(context, listen: false)
                  .registrationSafetyNet(route: ExplainSelectedPicture.id);
                    final quesResProvider =
                        Provider.of<QuesResProvider>(context, listen: false);
                    quesResProvider.wordLoveLifeRespose(
                        wordId: selectedIndex ?? 0, context: context);
                  });
                },
                buttonStyle: ButtonStyles.getCommonStyle(context),
              ),
            )
          ],
        ),
      ),
      // bottomSheet: Padding(
      //   padding: EdgeInsets.all(15.sp),
      //   child: Visibility(
      //     visible: showButton,
      //     child: PrimaryButton(
      //       title: getTranslated("continue", context),
      //       onPressed: () {
      //         setState(() {
      //           storeValues.addOneWordIndex(selectedIndex);
      //           print("going to page ===>>> $selectedIndex");
      //           //goPage(context, const ExplainSelectedPicture());
      //           QuesResProvider quesResProvider =
      //               Provider.of<QuesResProvider>(context, listen: false);
      //           quesResProvider.wordLoveLifeRespose(
      //               wordId: selectedIndex ?? 0, context: context);
      //         });
      //       },
      //     ),
      //   ),
      // ),
    );
  }

  //
  Widget buildCard(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Provider.of<StorageProvider>(context, listen: false).audioSpeak(_wordName[index]);
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Center(
                child: Text(_wordName[index].toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 0.5.sp,
                      fontWeight: selectedIndex == index
                          ? FontWeight.w700
                          : FontWeight.w400,
                      color: selectedIndex == index
                          ? const Color(0xffDEB988)
                          : Colors.black,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
