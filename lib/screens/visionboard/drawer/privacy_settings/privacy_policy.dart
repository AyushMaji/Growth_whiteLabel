// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:olga/global/constants/color_resources.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/localization/language_constrants.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dashboardAppBar(
        context,
        getTranslated("privacy_policy", context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.sp),
              Text(
               // getTranslated("what_does_the_mobile_app", context),
               "Privacy Policy",
                style: TextStyles.boldTextStyle(context),
              ),
              //
              SizedBox(height: 10.sp),
              //
              RichText(
                text: TextSpan(
                  // text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp
                      ),
                  children: <TextSpan>[
                     TextSpan(text: 'Please read this Privacy Policy  (this'),
                     TextSpan(text: '“Privacy Policy”', style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' carefully). To use the services that Olga and its affiliates (collectively, '),
                      TextSpan(text: ' “Olga”, “Centre for Positive Change”, “CFPC”, “Power Coaching Global Pty Ltd”, “we”, “us”, ', style: const TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'or'),
                    TextSpan(text: ' “our”', style: const TextStyle(fontWeight: FontWeight.bold)),
                     TextSpan(text: ')'),
                      TextSpan(text: ' provide, you as a user of the Services must accept this Privacy Policy '),
                       TextSpan(text: '('),
                       TextSpan(text: '“User”, “you”, “your”', style: const TextStyle(fontWeight: FontWeight.bold)),
                       TextSpan(text: ').'),

                       TextSpan(text: '  If you do not consent to the terms of the Privacy Policy, please do not access or use the Services.'),

                       TextSpan(text: '\nWe have implemented this Privacy Policy because your privacy, and the privacy of other Service users, is important to us. We operate in accordance with applicable data protection legislation, and regulations. We recognize the importance of protecting the privacy of Personal Information collected about our users. This Privacy Policy discloses what Personal Information we gather, how we use it, and how you can correct or change it. It is our intention to give you as much control over your Personal Information as possible to preserve your privacy, while still allowing us to utilize that Personal Information in the course of our business to provide you a valuable service.'),
                  ],
                  
                ),
              ),

               SizedBox(height: 10.sp),

              RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"1.  Information we collect and hold",
                    ),
                  ],
                ),
              ),




              
                 RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"Olga collects personal information about you in a number of ways, including:  ",
                    ),
                  ],
                ),
              ),
 SizedBox(height: 10.h,),

               RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "via our websites (including https:www.olga.com.au);",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),

               RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "social media pages, and internal websites or intranet (each a “Website”);",
                    ),
                  ],
                ),
              ),


 SizedBox(height: 5.h,),
                RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "via our mobile and tablet applications (each an “Application”); and ",
                    ),
                  ],
                ),
              ),


 SizedBox(height: 5.h,),
                RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "when you interact with us and provide personal information by any other means including either physically or electronically (“Collection Channels”).  ",
                    ),
                  ],
                ),
              ),





              SizedBox(height: 30.h,),
                RichText(
                text: TextSpan(
                 // text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Personal information that Olga collects and holds may include your name, email address, date of birth, phone number, payment method, social media handles, photographs of you and other identifying information you choose to provide via a particular Collection Channel. When you use a Website or Application, we may also collect personal information about you in the following general categories:",
                    ),
                  ],
                ),
              ),






              SizedBox(height: 10.h,),

               RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Location information: If you permit an Application to access location services through the permission system in your mobile device, we may collect the precise location of your device when the Application is running in the foreground or background in order or to send you alerts such as the location of your nearest Olga coach.",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),

               RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Transaction information: We collect your transaction details when you place an order via a Website or Application, including the products you have ordered, the date and time of your order and the amount charged.",
                    ),
                  ],
                ),
              ),


 SizedBox(height: 5.h,),
                RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Usage and preferences: We collect information about how you interact with our Websites or Applications, including the pages you visit, your preferences and settings that you choose. We may do this through the use of cookies and other similar technologies that uniquely identify you.",
                    ),
                  ],
                ),
              ),


 SizedBox(height: 5.h,),
                RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Device information: We may collect information about your mobile device such as the hardware model, operating system, preferred language, unique device identifier and mobile network.",
                    ),
                  ],
                ),
              ),




               SizedBox(height: 5.h,),
                RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Other information: We may also collect and log information such as your IP address, access dates and times, browser type and pages visited when you interact with a Website or Application.",
                    ),
                  ],
                ),
              ),




               SizedBox(height: 15.h,),
                RichText(
                text: TextSpan(
                 // text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "In addition to the information listed above, in some cases we may collect personal information about you from third parties, including:",
                    ),
                  ],
                ),
              ),





              
               SizedBox(height: 5.h,),
                RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "When you choose to create an account or register for a product or service via a Website or Application using a social media platform such as Facebook;",
                    ),
                  ],
                ),
              ),



               SizedBox(height: 5.h,),
                RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "When a third party has your consent to disclose your personal information to us, such as when you enter a competition or promotion administered by a third party on our behalf; and",
                    ),
                  ],
                ),
              ),



               SizedBox(height: 5.h,),
                RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "When it is otherwise lawful for a third party to disclose your personal information to us.",
                    ),
                  ],
                ),
              ),





                SizedBox(height: 25.h,),
                RichText(
                text: TextSpan(
                  //text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "We may also collect personal or anonymous information about you from other sources and may combine that information with other information collected from you or from third parties for the purposes disclosed in this Privacy Policy.",
                    ),
                  ],
                ),
              ),






               SizedBox(height: 10.sp),

              RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"2.  How Olga collects and holds personal information",
                    ),
                  ],
                ),
              ),




              
                 RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"Olga will not collect or monitor any personal information about you without your consent including as provided in this privacy policy. ",
                    ),
                  ],
                ),
              ),
 SizedBox(height: 10.h,),


 //!+++++++++++++++++++

      SizedBox(height: 10.sp),

              RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"3.  Active information collection",
                    ),
                  ],
                ),
              ),




              
                 RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"Olga may collect your personal information via our Collection Channels when you:",
                    ),
                  ],
                ),
              ),
 SizedBox(height: 10.h,),




    SizedBox(height: 10.h,),

               RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "purchase a product or make a booking through a Website or Application;",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),

               RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "participate in any offers, marketing activities and/or promotional activities;",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),





      RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "contact us or provide us with personal information directly via any medium including a Website or Application, SMS (Short Message Service), MMS (Multimedia Message Service), IM (Instant Messaging) and email (“Electronic Messages”), social media platforms, mail, telephone and in person;",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),





  RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "interact with a Website or Application for a specific purpose;",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),





 RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "browse a Website or Application generally;",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),





  RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "sign-up to, or register an account via, any Collection Channel; or",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),





  RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "apply for employment with Olga.",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 35,),





       RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"4.  Consent & Modification",
                    ),
                  ],
                ),
              ),




              SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"By using this Service, you consent to the terms of this Privacy Policy and to our processing of Personal Information for the purposes set forth herein. If you do not agree to this Privacy Policy, please do not use the Service. We reserve the right, at our discretion, to change this Privacy Policy at any time, which change shall become effective upon posting by the Company on the Website, the Mobile App, via the Service or sending you an email or other notification. You will be deemed to have agreed to Additional Terms (as defined in the Terms and Conditions) by your decision to continue accessing the Mobile App or the Website or otherwise using any of the Services following the date in which such Additional Terms becomes effective.",
                    ),
                  ],
                ),
              ),







              SizedBox(height: 35,),
       RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"5. Demographic & Non-Identifying Information",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"Olga may collect and process demographic information from or about User at the Website and the Mobile App from time to time, such as information about User’s gender, age, country, and zip code (“Demographic Information”). Olga may collect this information through various forms and in various places on the Website and/or the Mobile App. To the extent that Olga combines any non-personally identifiable Demographic Information with User’s Personal Information that Olga collects directly from User on the Website and the Mobile App, Olga will treat the combined data as Personal Information under this Privacy Policy.\n\nOlga also collects data about User, including about User’s make-up and related information that does not identify User and that enables User to fully participate in the Service.",
                    ),
                  ],
                ),
              ),







                   SizedBox(height: 35,),
       RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"6. Information Olga Collects or Stores as User Accesses and Uses the Website and Service",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"In addition to any Personal Information or other information that User choose to submit to Olga via Olga’s Website and/or mobile App, Olga and Olga’s third-party service providers may use a variety of technologies that automatically (or passively) store or collect certain information whenever User visits or interacts with the Website or Mobile Application (“Usage Information”). This Usage Information may be stored or accessed using a variety of technologies that may be downloaded to User’s personal computer, browser, laptop, tablet, mobile phone or other device (a “Device”) whenever User visits or interacts with Olga’s Website and/or Mobile App. To the extent Olga associates Usage information with User’s Personal Information Olga collects directly from User on the Website and/or Mobile Application, Olga will treat it as Personal Information.",
                    ),
                  ],
                ),
              ),


SizedBox(height: 30.h,),
               RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"The Usage Information may include:",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),

               RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "User’s IP address, UDID or other unique identifier (“Device Identifier”). A Device Identifier is a number that is automatically assigned to User’s Device used to access the Website, and Olga’s computers identify User’s Device by its Device Identifier; ",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),







               RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "User’s Device functionality (including browser, operating system, hardware, mobile network information);",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),





   RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "User’s subscription level;",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),




     RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "The URL that referred User to Olga’s website",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),






  RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "The areas within Olga’s Website and/or Mobile App that User visits and User’s activities there, including remembering User, User’s preferences and pages User requested and/or viewed;",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),





  RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "User’s Device location;",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),





 RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "User’s Device characteristics; and ",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),






  RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Certain other Device data, including the time of day, among other information.",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 25.h,),




   RichText(
                text: TextSpan(
                 // text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Olga may use various methods and technologies to store or collect Usage Information (“Tracking Technologies”). Tracking Technologies may set, change, alter or modify settings or configurations on User’s Device. The Tracking Technologies that may be used are the following (and subsequent technology and methods later developed which perform a similar function):",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),





     SizedBox(height: 35,),
       RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"6.1 Cookies ",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"A cookie is a data file placed on a Device when it is used to visit the Website. A Flash Cookie (or locally stored object) is a data file placed on a Device via the Adobe Flash plug-in that may be built-in or downloaded by User to User’s Device. HTML5 cookies can be programmed through HTML5 local storage. Unlike Flash Cookies, HTML5 cookies do not require a plug-in. Regular cookies may generally be disabled or removed by tools that are available as part of most commercial browsers, and in some but not all instances can be blocked in the future by selecting certain settings. Each browser User uses will need to be set separately and different browsers offer different functionality options in this regard. Also, these tools may not be effective with regard to Flash cookies or HTML5 cookies. For information on disabling Flash cookies go to Adobe’s website www.adobe.com. Please be aware that if User disables or removes cookies, Flash cookies, or HTML5 cookies on User’s device, some parts of Olga’s Website, Mobile App and/or other services may not function properly, and that when User revisits Olga’s Website, Mobile App and Services User’s ability to limit cookies is subject to User’s browser settings and limitations. ",
                    ),
                  ],
                ),
              ),







  

                      SizedBox(height: 35,),
       RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"6.2 Embedded Scripts",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"An embedded script is programming code that is designed to collect information about User’s interactions with the Website, Mobile App and Services, such as the links User’s click on. The code is temporarily downloaded onto User’s Device from Olga’s web server and/or Mobile App or a third party service provider, is active only while User is connected to the Website and/or Mobile App, and is deactivated or deleted thereafter.",
                    ),
                  ],
                ),
              ),







                   SizedBox(height: 35,),

                      RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"6.3 Web Beacons",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"Small graphic images or other web programming code called “web beacons” (also known as “1x1 GIFs” or “clear GIFs”) may be included in pages and messages of our website, Mobile App and Services. Web beacons may be invisible to User, but any electronic image or other web programming code inserted into a page or e-mail can act as a web beacon. Web beacons or similar technologies may be used for a number of purposes, including, without limitation, to count visitors to the Website, Mobile App and Services, to monitor how users navigate the Website, Mobile App and Services, to count how many e-mails that were actually opened or to count how many particular articles or links were actually viewed.",
                    ),
                  ],
                ),
              ),




              
                   SizedBox(height: 35,),

                      RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"6.4 WETag, or entity tag",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"A feature of the cache in browsers. It is an opaque identifier assigned by a web server to a specific version of a resource found at a URL. If the resource content at that URL ever changes, a new and different ETag is assigned. Used in this manner ETags are a form of Device Identifier. ETag tracking may generate unique tracking values even where the consumer blocks HTTP, Flash, and/or HTML5 cookies.",
                    ),
                  ],
                ),
              ),






               SizedBox(height: 35,),

                      RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"6.5 Strictly Necessary",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"Olga may use cookies or other Tracking Technologies that are Olga considers is strictly necessary to allow User to use and access Olga’s website, Mobile App and Services, including cookies required for system administration, to prevent fraudulent activity, or to improve.",
                    ),
                  ],
                ),
              ),









                 SizedBox(height: 35,),

                      RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"6.6 Performance Related",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"Olga may use cookies or other Tracking Technologies that are useful in order to assess the performance of the Website, Mobile App and Services, including as part of Olga’s analytic practices or otherwise to improve the content, products or services offered through the Website, Mobile App and Services.",
                    ),
                  ],
                ),
              ),






               SizedBox(height: 35,),

                      RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"6.7 Functionality Related",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"Olga may use cookies or other Tracking Technologies that are required to offer User enhanced functionality when accessing the Website, including identifying User when User sign in to Olga’s Website or keeping track of User’s specified preferences, including in  terms of the presentation of content on Olga’s Website.",
                    ),
                  ],
                ),
              ),





                SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"Olga obtains User’s consent to Olga’s information storage or collection Tracking Technologies by providing User with transparent information in Olga’s Privacy Policy and providing User with the opportunity to make a choice to disable cookies as set forth above. Please note that Olga is not required to obtain User’s consent to the information collection Tracking Technologies identified above that is strictly necessary. User has the right to object to other use of information storage or collection technologies. ",
                    ),
                  ],
                ),
              ),





                SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"There may be other Tracking Technologies now and later devised and used by Olga in connection with the Website, Mobile App and Services. Further, third parties may use Tracking Technologies with Olga’s Website. Olga does not control those Tracking Technologies and Olga is not responsible for them. However, User consent to potentially encountering third party Tracking Technologies in connection with use of Olga’s Website, Mobile App and Services and accepts that Olga’s statements under this Privacy Policy do not apply to the Tracking Technologies or practices of such third parties. User should check the third party websites to confirm how User’s information Is collected and used.",
                    ),
                  ],
                ),
              ),




               SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"Various third parties are developing or have developed signals or other mechanisms for the expression of consumer choice regarding the collection of information about an individual consumer’s online activities over time and across third-party web sites or online services (e.g., browser do not track signals). Currently, Olga does not monitor or take action with respect to these signals or other mechanisms.",
                    ),
                  ],
                ),
              ),











SizedBox(height: 30,),
              
                      RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"7. Platform Permissions",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"Mobile platforms such as iOS and Android generally define certain types of information or data that applications cannot access without your consent. Each platform has its own permissions system for obtaining your consent. For example, the iOS platform generally alerts you the first time the Olga Application wants permission to access certain types of data, such as location services, and will let you choose whether or not to consent to that request. Android devices will generally notify you of the permissions that the Olga Application seeks before you first use the Application, and your use of the Application constitutes your consent. You can generally manage your platform level permissions via the Settings section on your device. For more information, please contact your device provider or refer to the user manual for your device.",
                    ),
                  ],
                ),
              ),










              SizedBox(height: 30,),
              
                      RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"8. Privacy Policy",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"Olga Privacy Policy contains information about how you can access and correct your personal information, how you can lodge a complaint regarding the handling of your personal information and how any complaint will be handled by Olga. You may contact Olga with any queries via email: hello@olga.io or by post at:",
                    ),
                  ],
                ),
              ),








                 SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"Power Coaching Global Pty. Ltd.",
                    ),
                  ],
                ),
              ),

              Text("Australian Business Number: 43 624 919 473 ", style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),),



                        Text("Attention: Olga Privacy Officer  ", style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),),




                       Text("Building K513, 37-45 John Street", style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),),
                       Text("Windsor, Victoria 3181", style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),),
                       Text("AUSTRALIA", style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),),



SizedBox(height: 10.sp),

              RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"9. Purposes for which Olga collects, holds, uses and discloses personal information",
                    ),
                  ],
                ),
              ),




              
                 RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"Personal information collected may be used for a number of purposes connected with our business operations, which include the following primary purposes:",
                    ),
                  ],
                ),
              ),
 SizedBox(height: 10.h,),




    SizedBox(height: 10.h,),

               RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "For the purposes stated on a particular Collection Channel.",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),







  SizedBox(height: 10.h,),

               RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "To maintain and improve the functionality of a Website or Application to provide better service to Website or Application visitors and users, including the compilation and analysis of statistics and trends, the provision of information to you relating to the content available on that Website or Application and any e-commerce transactions conducted via that Website or Application.",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),
  SizedBox(height: 10.h,),

               RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "To fulfill obligations in respect of any sale and purchase contract and/or any other contract between you and Olga.",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),
  SizedBox(height: 10.h,),

               RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "To manage your orders and facilitate payment.",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),
  SizedBox(height: 10.h,),

               RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "To send you any technical, administrative or legal notices important to our Websites and Applications.",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),
  SizedBox(height: 10.h,),

               RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "To provide you with information about your transactions (including uploading of, access to, and receipt of, content on a Website or Application and purchase transactions undertaken on a Website or Application), content, services and products.",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),
  SizedBox(height: 10.h,),

               RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "To provide marketing materials and information about our products and services, events, special offers, competitions and promotions via any medium including mail, telephone and, where you have opted in, Electronic Messages or any other form of electronic, emerging, digital or conventional communications channel, or to request your feedback for promotional purposes.",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),
  SizedBox(height: 10.h,),

               RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "To maintain our relationship with you. ",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),
  SizedBox(height: 10.h,),

               RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "To respond to customer enquiries or complaints.",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),
  SizedBox(height: 10.h,),

               RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "To manage your employment or process your application for employment with Olga, including Olga franchisees and facilitate effective employment practices.",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),
  SizedBox(height: 10.h,),

               RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "To obtain opinions or comments about products and/or services and to conduct other market research and development (including to record statistical data for marketing analysis).",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),
  SizedBox(height: 10.h,),

               RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "To enter you into and administer promotions.",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),
  SizedBox(height: 10.h,),

               RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "To provide, maintain and improve our products and services.",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),
  SizedBox(height: 10.h,),

               RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "To customize a Website or Application based on your preferences.",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),
  SizedBox(height: 10.h,),

               RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "To allow you to use and enjoy the functionality of a Website or Application.",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),
  SizedBox(height: 10.h,),

               RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "To share with trusted third parties including professional service providers, our related bodies corporate, our franchisees, our suppliers and our promotional partners and other trusted third parties (and their directors, servants and agents) and agencies (Olga Family).",
                    ),
                  ],
                ),
              ),

 SizedBox(height: 5.h,),
  SizedBox(height: 10.h,),

               RichText(
                text: TextSpan(
                  text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "To share with your social media communities, to the extent allowed by you.",
                    ),
                  ],
                ),
              ),














SizedBox(height: 30,),
              
                      RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"10. Not providing information",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"Failure to provide personal information via our Collection Channels may result in you being unable to register for certain products or services, participate in a promotion, access elements of a Website or Application, place orders, make contributions to a Website or Application, and/or Olga being unable to provide you with relevant content, products and/or services. ",
                    ),
                  ],
                ),
              ),










              SizedBox(height: 30,),
              
                      RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"11. Sharing your personal information",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"For the purposes described above, Olga may share personal information with the Olga Family, either in Australia or overseas countries. Olga will use best endeavours to ensure that any use of this information by the Olga Family will comply with this privacy policy. Members of the Olga Family may be engaged by Olga to perform a variety of functions, such as fulfilling orders, conducting market research, processing credit card payments, assisting with promotions, data storage and providing technical services for our Websites and Applications. These companies may have access to personal information if needed to perform such functions. However, these companies may only use such personal information for the purpose of performing that function and may not use it for any other purpose. Olga recognizes the trust with which you provide personal information, and except as stated in this privacy policy, such information will not be used or disclosed for any other purposes without consent. However, Olga reserves the right to use or disclose any information, including personal information, as needed to satisfy any law, regulation or legal request, to protect the rights or property of Olga, any member of the Olga Family, or any member of the public, to protect the integrity of a Website or Application, to fulfill your requests, or to cooperate in any law enforcement investigation or an investigation on a matter of public safety.",
                    ),
                  ],
                ),
              ),






                SizedBox(height: 30,),
              
                      RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"12. Contact by Olga and third parties",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"Members of the Olga Family and other trusted third parties (and their directors, servants and agents), either in Australia or overseas, may contact you via Electronic Messages, telephone, post or any other form of electronic, emerging, digital or conventional communications channel using the personal information provided, in respect of the primary purposes for collection of personal information as stated above. Olga does not send advertising or marketing information without obtaining prior consent, for example the consent contained via a particular Collection Channel within this privacy policy. If you receive any form of communication from Olga and would like to opt out of receiving any more such communication, you may remove your name from the database by utilizing the functional unsubscribe facility. If applicable, you may also nominate your preferred contact methods by following the instructions provided in an electronic message. Despite removing you from the database from receiving future advertising and marketing information or, if applicable, removing you from particular communication channels as selected by you, Olga may send you non-commercial, administrative Electronic Messages which relate to an existing user account. Non-commercial, administrative Electronic Messages may include administrative and transaction confirmations, requests and inquiries or information about a particular Olga user account. If you no longer wish to receive any communications from Olga via an Application, you may delete the Application from your mobile or other device.",
                    ),
                  ],
                ),
              ),














               SizedBox(height: 30,),
              
                      RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"13. Ability of others to view information",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"Olga may provide areas on a Website or Application where you can upload user-generated content, post or provide information about yourself, communicate with other users, provide reviews for content, products and/or services or interact with or vote on particular content. This information may be publically posted on an Olga Website or Application and/or shared with others, including without limitation, on social media platforms and other public forums in which you choose to participate. This information may become publically available and may be read, collected and used by others outside of an Olga Website or Application. Olga is not responsible for the conduct of others who may read, collect and use this information.",
                    ),
                  ],
                ),
              ),





















                 SizedBox(height: 30,),
              
                      RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"14. Children",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"Olga is very sensitive to privacy issues. We are proud of our long-time commitment to our customers. Olga does not intend to collect personal information from any person under the age of 18 years without the consent of a parent or legal guardian. We urge parents to regularly monitor and supervise their children's on-line activities.",
                    ),
                  ],
                ),
              ),












              SizedBox(height: 30,),
              
                      RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"15. Security of personal information",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"Olga will endeavor to take all reasonable steps to keep secure any personal information recorded, and to keep this information complete, accurate and up to date. All information is passed through to a secure server using encryption technology and stored on secure servers that are protected in controlled facilities, which in some cases may be overseas. Olga employees and data processors are obliged to respect the confidentiality of any personal information held by Olga. However, security of communications over the Internet cannot be guaranteed, and therefore absolute assurance that information will be secure at all times cannot be given. Olga will not be held responsible for events arising from unauthorized access to personal information beyond Olga’s reasonable control.",
                    ),
                  ],
                ),
              ),














              SizedBox(height: 30,),
              
                      RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"16. Disclosure of personal information to overseas recipients",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"In some cases, Olga may disclose your personal information to overseas recipients. Olga employees and data processors are obliged to respect the confidentiality of any personal information held by Olga.",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              
                      RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"17. Access to personal information",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"You are in control of any personal information you provide to us. If at any time, you would like to access, review, correct and/or delete the personal information we have about you, or if you would like to change your preferences for contacts from us, you can let us know via the contact details listed below. Please allow 30 days for this request to be processed. Your personal information may be stored in different locations depending upon the reason for which you originally submitted the information. If you make an inquiry in relation to your personal information, the more information you can provide us about when you originally submitted your personal information, the quicker Olga will be able to retrieve your personal information. If requested, all reasonable steps to delete personal information will be made, except where it is required for legal reasons. Deletion of information may result in Olga being unable to facilitate or provide you with information about certain transactions (including the uploading of, access to, and receipt of, content on a Website or Application, and purchase transactions undertaken on a Website or Application), other content, services or product information, upcoming promotions, competitions or event information, and/or provide certain content, products or services. We are not responsible for removing your personal information from the lists of any third party who has previously been provided your information in accordance with this privacy policy.",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              
                      RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"18. Links to other sites",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"Our Websites or Applications may, from time to time, offer links to sites that may be of interest to you but which are not operated by Olga. Their inclusion cannot be taken to imply any endorsement or validation by us of the content of the third party website. Linked websites are responsible for their own privacy practices. If you visit one of these linked websites, you should review their privacy and other policies. We are not responsible, nor do we accept any liability, for the policies, practices and conduct of other companies linked to any Olga Website or Mobile Application. We may use third party advertisements on our Websites and Applications. All third-party advertising, if paid for, is paid for by the relevant third party advertisers. Third party advertisements are not recommendations or endorsements by Olga or any of its affiliates. To the extent permitted by law, Olga is not responsible for the content (including representations) of any third party advertisement on a Website or Application. Cookies may be associated with these advertisements to enable the advertiser to track the number of anonymous users responding to the campaign.",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              
                      RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"19. Related Olga Websites or Applications",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"All Websites and Applications operated by Olga will adhere to this privacy policy. The policies on the Websites and Applications of some other members of the Olga Family may vary, however, because of local customs, practices or laws.",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              
                      RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"20. Changes to our Privacy Policy",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"From time to time, it may be necessary for Olga to change this privacy policy without notice. We will post any changes to this privacy policy on our Websites and Applications. Rest assured, however, that any changes will not be retroactively applied and will not alter how we handle previously collected personal information.",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              
                      RichText(
                text: TextSpan(
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"21. Sale of the Company",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35,),

                  RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:"If Olga merges with, or is acquired by, another company, or sells all or a portion of its assets, your personal information may be disclosed to our advisers and any prospective purchaser’s adviser, and may be among the assets transferred. However, personal information will always remain subject to this privacy policy.",
                    ),
                  ],
                ),
              ),















              //!! -------------------------------------Tanay---------------------------------------
              SizedBox(height: 5.h),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Notice to California Residents",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "If you are a California resident, California law may provide you with additional rights regarding our use of your personal information. To learn more about your California privacy rights, visit:",
                    ),
                    TextSpan(
                        text:
                            "/terms-and-conditions-of-use/CCPA-notice-for-California-residents/",
                        style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                      //decoration: TextDecoration.,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp,
                      fontStyle: FontStyle.italic),
                  children: <TextSpan>[
                    TextSpan(
                      text: "California Online Privacy Protection Act Notice",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              RichText(
                text: TextSpan(
                  // text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "On September 27, 2013, California enacted A.B. 370, amending the California Online Privacy Protection Act to require website operators like us to disclose how we respond to “Do Not Track Signals”; and whether third parties collect personally identifiable information about users when they visit us.",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                  text: '(1) ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "On September 27, 2013, California enacted A.B. 370, amending the California Online Privacy Protection Act to require website operators like us to disclose how we respond to “Do Not Track Signals”; and whether third parties collect personally identifiable information about users when they visit us.",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              RichText(
                text: TextSpan(
                  text: '(2) ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "On September 27, 2013, California enacted A.B. 370, amending the California Online Privacy Protection Act to require website operators like us to disclose how we respond to “Do Not Track Signals”; and whether third parties collect personally identifiable information about users when they visit us.",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                  // text: '(2) ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "California Civil Code Section 1798.83 also permits our customers who are California residents to request certain information regarding our disclosure of Personal Information to third parties for their direct marketing purposes. To make such a request, please send an email to ",
                    ),
                    TextSpan(
                        text: "support@Olga.com",
                        style: TextStyle(
                          color: Colors.blue,
                        )),
                    TextSpan(
                      text:
                          ". Please note that we are only required to respond to one request per customer each year",
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  // text: '(2) ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Personal Information Access and Corrections",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                  // text: '(2) ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "Upon receipt of User’s written request and upon Olga’s receipt of enough information to permit Olga to identify User’s Personal Information, Olga will disclose to User the Personal Information Olga holds about User. Olga will also correct, amend or delete any Personal Information that is inaccurate and notify any third party recipients of the necessary changes. User may update any information User has given to Olga by sending an email to ",
                    ),
                    TextSpan(
                        text: "support@Olga.com",
                        style: TextStyle(color: Colors.blue)),
                    TextSpan(
                      text:
                          ". Requests to delete Personal Information are subject to any applicable legal and ethical reporting or document retention obligations imposed on Olga.",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Notice to Residents of the European Economic Area",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                      //decoration: TextDecoration.,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp,
                      fontStyle: FontStyle.italic),
                  children: <TextSpan>[
                    TextSpan(
                      text: "If you elect not to provide Personal Information",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                  // text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "You may choose not to provide Olga with your Personal Information. However, if you choose not to provide your Personal Information, you may not be able to use our Services, as the processing of this information is necessary for the performance of our Services",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                      //decoration: TextDecoration.,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp,
                      fontStyle: FontStyle.italic),
                  children: <TextSpan>[
                    TextSpan(
                      text: "How to exercise your rights",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                  // text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "Olga takes steps to keep your Personal Information accurate and up to date. If you reside in the European Economic Area, you have certain rights to the Personal Information that we have collected about you. To exercise your rights to your Personal Information, please contact us at GDPRsupport@Olga.com or at the address listed below. Subject to applicable law and in exceptional circumstances only, we may charge for this service and we will respond to reasonable requests as soon as practicable, and in any event, within the time limits prescribed by law.",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                      //decoration: TextDecoration.,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp,
                      fontStyle: FontStyle.italic),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "Right to lodge a complaint before the Data Protection Authority",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                  // text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "We encourage you to contact us directly and allow us to work with you to address your concerns. Nevertheless, you have the right to lodge a complaint with a competent data protection supervisory authority, in particular in the EU Member State where you reside, work or the place of the alleged infringement. You have the right to do so if you consider that the processing of Personal Information relating to you infringes applicable data protection laws.",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                      //decoration: TextDecoration.,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp,
                      fontStyle: FontStyle.italic),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "Changes to this Notice to Residents of the European Economic Area",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                  // text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "In order to enhance our Services it might be necessary to change this Notice to Residents of the European Economic Area from time to time. We therefore reserve the right to modify this Notice to Residents of the European Economic Area in accordance with the applicable data protection laws. Please visit our Website from time to time for information on updates to this Notice to Residents of the European Economic Area.",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                      //decoration: TextDecoration.,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp,
                      fontStyle: FontStyle.italic),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "How to contact us or our privacy office as a Resident of the European Economic Area",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                  // text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "In case of questions about the processing of your Personal Information please contact us at GDPRsupport@Olga.com.",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                  // text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "If we are required under applicable law to appoint a data protection officer (DPO), you can contact the DPO that is responsible for your country/region at GDPRsupport@Olga.com.",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                  // text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "For the purposes of applicable data protection laws, Olga, Inc. is the controller of the Personal Information you provide to us or to our mobile apps. As a data controller, we process the Personal Information we maintain about you in accordance with this Privacy Policy.",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                      //decoration: TextDecoration.,
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 18.sp,
                      fontStyle: FontStyle.italic),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Our Accountability/Dispute Resolution",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                  // text: '• ',
                  style: TextStyle(
                      color: ColorResources.getBlackTextColor(context),
                      fontSize: 13.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "Olga uses a self-assessment approach to assure compliance with this Privacy Policy and periodically verifies that the policy is accurate, comprehensive for the information intended to be covered, prominently displayed, completely implemented and accessible and in conformity with the promises in this policy. Olga encourages interested persons to raise any concerns using the contact information provided and Olga will investigate and attempt to resolve any complaints and disputes regarding use and disclosure of Personal Information in accordance with this policy.",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              // SizedBox(
              //   height: 10.h,
              // ),
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'If you have any questions about our privacy policy, or any problems or complaints about how we have collected, used, stored, handled and/or disclosed your personal information, please contact us at:',
                style: TextStyle(
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Power Coaching Global Pty Ltd',
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              ),
              Text(
                'Australian Business Number (ABN) 43 624 919 473',
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              ),
              Text(
                'Attention: Olga Privacy Officer',
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
              Text(
                'Building K513, 37-45 John Street',
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
              Text(
                'Windsor, Victoria 3181',
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
              Text(
                'AUSTRALIA',
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
              Text(
                'Email: hello@olga.io',
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Please allow 14 days for this request to be processed. If you do not receive a satisfactory response from Olga to your query, problem or complaint within fourteen (14) days, you may refer your query, problem or complaint to the Office of the Australian Information Commissioner via the contact details listed at https:www.oaic.gov.au/about-us/contact-us.',
                style: TextStyle(
                  fontSize: 13.sp,
                ),
              )






              






              //!=================================================================================================
              // SizedBox(height: 5.h),
              // RichText(
              //   text: TextSpan(
              //     text: '• ',
              //     style: TextStyle(
              //         color: ColorResources.getBlackTextColor(context),
              //         fontSize: 18.sp),
              //     children: <TextSpan>[
              //       TextSpan(
              //         text: getTranslated("use_of_personal_info", context),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 5.h),
              // RichText(
              //   text: TextSpan(
              //     text: '• ',
              //     style: TextStyle(
              //         color: ColorResources.getBlackTextColor(context),
              //         fontSize: 18.sp),
              //     children: <TextSpan>[
              //       TextSpan(
              //         text:
              //             getTranslated("disclosure_of_personal_info", context),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 5.h),
              // RichText(
              //   text: TextSpan(
              //     text: '• ',
              //     style: TextStyle(
              //         color: ColorResources.getBlackTextColor(context),
              //         fontSize: 18.sp),
              //     children: <TextSpan>[
              //       TextSpan(
              //         text: getTranslated("cookies", context),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 5.h),
              // RichText(
              //   text: TextSpan(
              //     text: '• ',
              //     style: TextStyle(
              //         color: ColorResources.getBlackTextColor(context),
              //         fontSize: 18.sp),
              //     children: <TextSpan>[
              //       TextSpan(
              //         text: getTranslated("third_party_access", context),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 5.h),
              // RichText(
              //   text: TextSpan(
              //     text: '• ',
              //     style: TextStyle(
              //         color: ColorResources.getBlackTextColor(context),
              //         fontSize: 18.sp),
              //     children: <TextSpan>[
              //       TextSpan(
              //         text: getTranslated("geo_location", context),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 5.h),
              // RichText(
              //   text: TextSpan(
              //     text: '• ',
              //     style: TextStyle(
              //         color: ColorResources.getBlackTextColor(context),
              //         fontSize: 18.sp),
              //     children: <TextSpan>[
              //       TextSpan(
              //         text: getTranslated("opt_out_right", context),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
