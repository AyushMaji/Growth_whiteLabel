import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:provider/provider.dart';
import '../../../../global/styles/button_style.dart';
import '../../../../global/styles/text_styles.dart';
import '../../../../global/widgets/custom_widgets.dart';
import '../../../../global/widgets/submit_button.dart';
import '../../../../localization/language_constrants.dart';
import '../../../../provider/feedback_provider.dart';
import '../../../../provider/profile_provider.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
   final _feedbackContacEmailtController = TextEditingController();
   final _feedbackMessageController = TextEditingController();

   @override
  void initState() {
    super.initState();
    ProfileProvider profileData =Provider.of<ProfileProvider>(context, listen: false);

    profileData.viewUserProfileDetails();
    _feedbackContacEmailtController.text =profileData.profileModel.data?.userDetails?.email ?? "";

  }

  
  @override
  void dispose(){
     _feedbackContacEmailtController.dispose();
     _feedbackMessageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: dashboardAppBar(
        context,
        getTranslated("feed_back", context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              Text(
               // getTranslated("contact", context),
               "Feedback",
                style: TextStyles.boldTextStyle(context),
              ),
              Text(
               // getTranslated("if_youhave_gota_question", context)
               "If you've got a feedback then we want to hear it"
                ),
              SizedBox(height: 15.h),

              
              SizedBox(height: 20.sp),
              

              Text(
                getTranslated("email_address", context),
                style: TextStyles.smallBoldTextStyle(context),
              ),
              TextFormField(
                controller: _feedbackContacEmailtController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                onChanged: (val) {
                  setState(() {
                    print("typing email ===>> $val");
                  });
                },
              ),

              SizedBox(height: 20.sp),

              Text(
                getTranslated("message", context),
                style: TextStyles.smallBoldTextStyle(context),
              ),
              TextFormField(
                controller: _feedbackMessageController,
                keyboardType: TextInputType.text,
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                onChanged: (val) {
                  setState(() {
                    print("typing message ===>> $val");
                  });
                },
              ),
              SizedBox(height: 20.sp),

              SubmitButton(
                title: getTranslated("submit", context),
                onPressed: () {
                if(_feedbackMessageController.text.isNotEmpty){ 
                    _sendDataAndNavigate();
                  } else {
                    showToast("Message is required", context);
                  }
                },
                buttonStyle: ButtonStyles.getCommonStyle(context),
              ),
              SizedBox(height: 20.sp),
            ],
          ),
        ),
      ),
    );
  }



   void _sendDataAndNavigate() {

    var _email = _feedbackContacEmailtController.text;
    var _message = _feedbackMessageController.text;

    FeedbackProvider _feedBackToUS =
        Provider.of<FeedbackProvider>(context, listen: false);
    _feedBackToUS.feedBack(

        email: _email,
        message: _message,
        context: context);
    // goPage(context, const PaymentInfo());
  }
}