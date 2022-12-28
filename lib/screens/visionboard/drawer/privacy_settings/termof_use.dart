// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:olga/global/constants/color_resources.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:url_launcher/url_launcher.dart';

class TermOfUse extends StatefulWidget {
  const TermOfUse({Key? key}) : super(key: key);

  @override
  State<TermOfUse> createState() => _TermOfUseState();
}

class _TermOfUseState extends State<TermOfUse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dashboardAppBar(
        context,
        getTranslated("terms_of_use", context),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 20.sp),
            Text(
            //  getTranslated("Acceptable_Use_Policy", context),
            "Acceptable Use Policy; Copyright and Trademark Policy; Refund Policy; Revisions",
              style: TextStyle(fontSize: 13.sp),
            ),
            SizedBox(height: 15.sp),

            Text("Terms of Use", style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold)),
            Text("Effective: March 1, 2022"),

            SizedBox(height: 15.h,),
            
            Text("Thank you for using Olga brought to you by the Centre for Positive Change!",style: TextStyle(fontSize: 13.sp),),




            SizedBox(height: 15.h,),
            Text("“Olga” the Application offers products and services provided by the Centre for Positive Change, our subsidiaries, and our international network of coaches (\"Olga,\" \"us,\" \"we,\" or \"our\"). These Terms of Use (\"Terms\") govern your use of our website, apps, and other products and services (\"Services\"). As some of our Services may be software that is downloaded to your computer, phone, tablet, or other device, you agree that we may automatically update this software, and that these Terms will apply to such updates. Please read these Terms carefully, and contact us if you have any questions. By using our Services, you agree to be bound by these Terms, including the policies referenced in these Terms."),
            
            SizedBox(height: 15.h,),
            Text("THESE TERMS INCLUDE AN ARBITRATION AGREEMENT AND CLASS ACTION WAIVER THAT APPLY TO ALL CLAIMS BROUGHT AGAINST OLGA. PLEASE READ THEM CAREFULLY; THEY AFFECT YOUR LEGAL RIGHTS.",style: TextStyle(fontSize: 13.sp),),
            SizedBox(height: 15.h,),



             Text("Using Olga", style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold)),
             SizedBox(height: 15.h,),
             Text("Who May Use our Services",style: TextStyle(fontSize: 13.sp),),

              SizedBox(height: 15.h,),
              Text("You may use our Services only if you can form a binding contract with Olga, and only in compliance with these Terms and all applicable laws. When you create your Olga account, and subsequently when you use certain features, you must provide us with accurate and complete information, and you agree to update your information to keep it accurate and complete. Any use or access by anyone under the age of 16 is prohibited, and certain regions and Content Offerings may have additional requirements and/or restrictions."),

             SizedBox(height: 15.h,),
             Text("Our License to You",style: TextStyle(fontSize: 13.sp),),
             SizedBox(height: 15.h,),


              Text("Subject to these Terms and our policies (including the Acceptable Use Policy, Honor Code, and other terms), we grant you a limited, personal, non-exclusive, non-transferable, and revocable license to use our Services. You may download content from our Services only for your personal, non-commercial use, unless you obtain our written permission to otherwise use the content. You also agree that you will create, access, and/or use only one user account, unless expressly permitted by Olga, and you will not share access to your account or access information for your account with any third party. Using our Services does not give you ownership of or any intellectual property rights in our Services or the content you access."),



              SizedBox(height: 15.h,),
             Text("Content Offerings", style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold)),
             SizedBox(height: 15.h,),
             Text("Changes to Content Offerings",style: TextStyle(fontSize: 13.sp),),

              SizedBox(height: 15.h,),
              Text("Olga offers coaching and additional content (\"Content Offerings\") from licensed coaches and other providers (\"Content Providers\"). While we seek to provide world-class Content Offerings, unexpected events do occur. Olga reserves the right to cancel, interrupt, reschedule, or modify any Content Offerings. Content Offerings are subject to the Disclaimers and Limitation of Liability sections below."),

             
             
             
             SizedBox(height: 15.h,),
             Text("Disclaimer of Student-Content Provider Relationship",style: TextStyle(fontSize: 13.sp),),

             SizedBox(height: 15.h,),
             Text("Except as described below, nothing in these Terms or otherwise with respect to your participation in any Content Offerings by Olga : "),
             Text("(a) establishes any relationship between you and any Content Provider; or"),
             Text("(b) entitles you to use the resources of Olga beyond participation in the Content Offering."),





               SizedBox(height: 15.h,),
             Text("Your Content", style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold)),
             SizedBox(height: 15.h,),
             Text("User Content",style: TextStyle(fontSize: 13.sp),),
              SizedBox(height: 15.h,),
              Text("The Services enable you to share your content, posts you make in the forums, and the like (\"User Content\"), with Olga, Coaches, and/or other users. You retain all intellectual property rights in, and are responsible for, the User Content you create and share. User Content does not include program content or other materials made available on or placed on to the Olga platform by or on behalf of Content Providers. As between Olga and Content Providers, such Content Offerings are governed by the relevant agreements in place between Olga and Content Providers."),



             SizedBox(height: 15.h,),
             Text("How Olga and Others May Use User Content",style: TextStyle(fontSize: 13.sp),),
              SizedBox(height: 15.h,),
              Text("To the extent that you provide User Content, you grant Olga a fully-transferable, royalty-free, perpetual, sub-licensable, non-exclusive, worldwide license to copy, distribute, modify, create derivative works based on, publicly perform, publicly display, and otherwise use the User Content. This license includes granting Olga the right to authorize Content Providers to use User Content with their registered mentees, independent of the Services. Nothing in these Terms shall restrict other legal rights Olga may have to User Content, for example under other licenses. We reserve the right to remove or modify User Content for any reason; including User Content that we believe violates these Terms or other policies including our Acceptable Use Policy and Code of Conduct."),

              SizedBox(height: 15.h,),
             Text("Feedback",style: TextStyle(fontSize: 13.sp),),
              SizedBox(height: 15.h,),
              Text("We welcome your suggestions, ideas, comments, and other feedback regarding the Services (\"Feedback\"). By submitting any Feedback, you grant us the right to use the Feedback without any restriction or any compensation to you. By accepting your Feedback, Olga does not waive any rights to use similar or related Feedback previously known to Olga, developed by our employees, contractors, or obtained from other sources."),



               SizedBox(height: 15.h,),
             Text("Security", style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold)),
              SizedBox(height: 15.h,),
               RichText(
                           // textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                 ),
                                children: [
                                  TextSpan(
                                      text: 'We care about the security of our users. While we work to protect the security of your account and related information, Olga cannot guarantee that unauthorized third parties will not be able to defeat our security measures. Please notify us immediately of any compromise or unauthorized use of your account by emailing',
                                      style: TextStyle(color: Colors.black)),
                                 
                                  TextSpan(
                                      text: ' security@Olga.com.',
                                      style: TextStyle(color: Color(0xffB50000)),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          //Code to launch your URL
                                          const url = 'security@Olga.com';
                                          if (await canLaunchUrl(Uri.parse(url))) launch(url);
                                        }),
                                ])),
                      
             // Text("We care about the security of our users. While we work to protect the security of your account and related information, Olga cannot guarantee that unauthorized third parties will not be able to defeat our security measures. Please notify us immediately of any compromise or unauthorized use of your account by emailing security@Olga.com."),



               SizedBox(height: 15.h,),
             Text("Third Party Content", style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold)),
              SizedBox(height: 15.h,),
              Text("Through the Services, you will have the ability to access and/or use content provided by coaches, other users, and/or other third parties and links to websites and services maintained by third parties. Olga cannot guarantee that such third party content, in the Services or elsewhere, will be free of material you may find objectionable or otherwise inappropriate or of malware or other contaminants that may harm your computer, mobile device, or any files therein. Olga disclaims any responsibility or liability related to your access or use of, or inability to access or use, such third party content."),



             SizedBox(height: 15.h,),
             Text("Copyright and Trademark", style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold)),
              SizedBox(height: 15.h,),
              Text("Olga respects the intellectual property rights of our users, Content Providers, and other third parties and expects our users to do the same when using the Services. We have adopted and implemented the Olga Copyright and Trademark Policy below in accordance with applicable law, including the Digital Millennium Copyright Act."),
            
            
             SizedBox(height: 15.h,),
             Text("Research", style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold)),
              SizedBox(height: 15.h,),
              Text("Olga is committed to advancing the science of Personal Development, and records of your participation in the Olga offering and programs may be used for research. In the interest of this research, you may be exposed to variations in the Content Offerings. Research findings will typically be reported at the aggregate level. Your personal identity will not be publicly disclosed in any research findings without your express consent."),
             
             
             SizedBox(height: 15.h,),
             Text("Paid Services from Olga", style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold)),
              SizedBox(height: 15.h,),
              Text("Olga offers paid Services for a fee. Unless otherwise stated, all fees are quoted in U.S. Dollars. You are responsible for paying all fees charged by or for Olga and applicable taxes in a timely manner with a payment mechanism associated with the applicable paid Services. If your payment method fails or your account is past due, we may collect fees using other collection mechanisms. Fees may vary based on your location and other factors, and Olga reserves the right to change any fees at any time at its sole discretion. Any change, update, or modification will be effective immediately upon posting through the relevant Services. Refunds may be available for paid Services as described in our Refund Policy below."),
             
             
             SizedBox(height: 15.h,),
             Text("Modifying or Terminating our Services", style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold)),
              SizedBox(height: 15.h,),
              Text("We are constantly changing and improving our Services. We may add or remove functions, features, or requirements, and we may suspend or stop part of our Services altogether. Accordingly, Olga may terminate your use of any Service for any reason. If your use of a paid Service is terminated, a refund may be available under our Refund Policy. We may not be able to deliver the Services to certain regions or countries for various reasons, including due to applicable export control requirements or internet access limitations and restrictions from governments. None of Olga, its Content Providers and Coaches, its contributors, sponsors, and other business partners, and their employees, contractors, and other agents (the \"Olga Parties\") shall have any liability to you for any such action. You can stop using our Services at any time, although we'll be sorry to see you go."),
             
             
             SizedBox(height: 15.h,),
             Text("Disclaimers", style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold)),
              SizedBox(height: 15.h,),
              Text("THE SERVICES AND ALL INCLUDED CONTENT ARE PROVIDED ON AN \"AS IS\" BASIS WITHOUT WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED. THE OLGA PARTIES SPECIFICALLY DISCLAIM ANY AND ALL WARRANTIES AND CONDITIONS OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT, AND ANY WARRANTIES ARISING OUT OF DEALING OR USAGE OF TRADE. THE OLGA PARTIES FURTHER DISCLAIM ANY AND ALL LIABILITY RELATED TO YOUR ACCESS OR USE OF THE SERVICES OR ANY RELATED CONTENT. YOU ACKNOWLEDGE AND AGREE THAT ANY ACCESS TO OR USE OF THE SERVICES OR SUCH CONTENT IS AT YOUR OWN RISK."),
            
            
             SizedBox(height: 15.h,),
             Text("Limitation of Liability", style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold)),
              SizedBox(height: 15.h,),
              Text("TO THE MAXIMUM EXTENT PERMITTED BY LAW, THE OLGA PARTIES SHALL NOT BE LIABLE FOR ANY INDIRECT, INCIDENTAL, SPECIAL, CONSEQUENTIAL, OR PUNITIVE DAMAGES, OR ANY LOSS OF PROFITS OR REVENUES, WHETHER INCURRED DIRECTLY OR INDIRECTLY, OR ANY LOSS OF DATA, USE, GOODWILL, OR OTHER INTANGIBLE LOSSES, RESULTING FROM: "),

           SizedBox(height: 15.h,),
           Text("(A) YOUR ACCESS TO OR USE OF OR INABILITY TO ACCESS OR USE THE SERVICES;\n(B) ANY CONDUCT OR CONTENT OF ANY PARTY OTHER THAN THE APPLICABLE OLGA PARTY, INCLUDING WITHOUT LIMITATION, ANY DEFAMATORY, OFFENSIVE, OR ILLEGAL CONDUCT; OR\n(C) UNAUTHORIZED ACCESS, USE, OR ALTERATION OF YOUR CONTENT OR INFORMATION.IN NO EVENT SHALL OLGA'S AGGREGATE LIABILITY FOR ALL CLAIMS RELATED TO THE SERVICES EXCEED TWENTY U.S. DOLLARS (\$20) OR THE TOTAL AMOUNT OF FEES RECEIVED BY OLGA FROM YOU FOR THE USE OF PAID SERVICES DURING THE PAST SIX MONTHS, WHICHEVER IS GREATER.\n\nYOU ACKNOWLEDGE AND AGREE THAT THE DISCLAIMERS AND THE LIMITATIONS OF LIABILITY SET FORTH IN THIS TERMS OF USE REFLECT A REASONABLE AND FAIR ALLOCATION OF RISK BETWEEN YOU AND THE OLGA PARTIES, AND THAT THESE LIMITATIONS ARE AN ESSENTIAL BASIS TO OLGA'S ABILITY TO MAKE THE SERVICES AVAILABLE TO YOU ON AN ECONOMICALLY FEASIBLE BASIS.\n\nYOU AGREE THAT ANY CAUSE OF ACTION RELATED TO THE SERVICES MUST COMMENCE WITHIN ONE (1) YEAR AFTER THE CAUSE OF ACTION ACCRUES. OTHERWISE, SUCH CAUSE OF ACTION IS PERMANENTLY BARRED."),
           
           
           
           
           
           
             SizedBox(height: 15.h,),
             Text("Indemnification", style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold)),
              SizedBox(height: 15.h,),
              Text("You agree to indemnify, defend, and hold harmless the Olga Parties from any and all claims, liabilities, expenses, and damages, including reasonable attorneys' fees and costs, made by any third party related to: "),
               SizedBox(height: 15.h,),
              Text("(a) your use or attempted use of the Services in violation of these Terms;\n(b) your violation of any law or rights of any third party; or\n(c) User Content, including without limitation any claim of infringement or misappropriation of intellectual property or other proprietary rights."),



               SizedBox(height: 15.h,),
             Text("Governing Law and Venue", style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold)),
              SizedBox(height: 15.h,),
              Text("The Services are managed by Olga, which is located in Melbourne, Victoria, AUSTRALIA. You agree that any dispute related to these Terms will be governed by the laws of the State of Victoria, excluding its conflicts of law provisions. In the event of any dispute related to these Terms that is not subject to binding arbitration, you and Olga will submit to the personal jurisdiction of an exclusive venue in the federal and state courts located in and serving Victoria, AUSTRALIA as the legal forum for any such dispute."),
               SizedBox(height: 15.h,),




                  SizedBox(height: 15.h,),
             Text("Binding Arbitration and Class Action Waiver", style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold)),
              SizedBox(height: 15.h,),
              Text("You and Olga agree to submit to binding arbitration in any and all disputes, claims, or controversies of any kind, whether based on statute, regulation, constitution, common law, equity, or any other legal basis or theory, and whether pre-existing, present, or future, that arise out of or relate to our Services, these Terms, and/or any other relationship or dispute between you and us, including without limitation "),
               SizedBox(height: 15.h,),

               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("(i)"),
                   ),
                   Flexible(child: Text("The scope, applicability, or enforceability of these Terms and"))
                 ],
               ),
               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text("(ii)"),
                   ),
                   Flexible(child: Text("relationships with third parties who are not parties to these Terms or this arbitration provision to the fullest extent permitted by applicable law (each a “Claim,” and collectively the “Claims”)."))
                 ],
               ),




                SizedBox(height: 15.h,),
              Text("Any and all Claims shall be submitted for binding arbitration in accordance with the Consumer Arbitration Rules of the Australian Centre for International Commercial Arbitration (the “ACICA Rules”), as amended, in effect at the time arbitration is initiated. The ACICA Rules are available online at https://acica.org.au/arbitration-rules/ or by calling +61 (0)2 9223 1099, and are hereby incorporated by reference. In the event of any inconsistency between this arbitration provision and the ACICA Rules, such inconsistency shall be resolved in favor of this provision. If you decide to initiate arbitration, you agree to pay the initiation fee of \$500 (or the amount otherwise required by the ACICA Rules), and we agree to pay the remaining arbitration initiation fee and any additional deposit required by ACICA to initiate your arbitration. We will pay the costs of the arbitration proceeding, including the arbitrator’s fees; however, other fees, such as attorney’s fees and expenses of travel to the arbitration, shall be paid in accordance with the ACICA Rules and applicable law. We will pay all costs associated with any arbitration that we commence. A single, neutral arbitrator selected in accordance with the ACICA Rules shall decide all Claims."),
               SizedBox(height: 15.h,),


               Text("The arbitrator shall be an active member in good standing of the bar for any state in the Commonwealth of Australia and shall be either actively engaged in the practice of law for at least five years or a retired judge. The arbitrator shall honor claims of privilege recognized at law. Unless inconsistent with applicable law, and except as otherwise provided herein, each party shall bear the expense of its respective attorney, expert, and witness fees, regardless of which party prevails in the arbitration. Any arbitration proceedings shall be conducted in the federal judicial district of your residence, and you will be given the opportunity to attend the proceeding and be heard. The arbitrator’s decision will be final and binding upon the parties and may be enforced in any federal or state court that has jurisdiction. You and we agree that the arbitration shall be kept confidential and that the existence of the proceeding and any element of it (including, without limitation, any pleadings, briefs or other documents submitted or exchanged and any testimony or other oral submissions and awards) will not be disclosed beyond the arbitration proceedings, except as may lawfully be required in judicial proceedings relating to the arbitration or by applicable disclosure rules and regulations of governmental agencies."),
               SizedBox(height: 15.h,),


                Text("Neither you nor Olga may act as a class representative, nor participate as a member of a class of claimants, with respect to any Claim. The Claims may not be arbitrated on a class or representative basis. The arbitrator can decide only your and/or Olga individual Claims. The arbitrator may not consolidate or join the claims of other persons or parties who may be similarly situated. Accordingly, you and we agree that the ACICA Supplementary Rules for Class Arbitrations do not apply to our arbitration. This arbitration provision and the procedures applicable to the arbitration contemplated by this provision are governed by the International Arbitration Act 1974 (Cth) (“IAA”), notwithstanding any state law that may be applicable."),
               SizedBox(height: 15.h,),



                Text("This arbitration agreement does not preclude you or us from seeking action by federal, state, or local government agencies. You and we also have the right to exercise self-help remedies, such as set-off, or to bring qualifying claims in small claims court so long as the matter remains in such court and advances only on an individual (non-class, non-representative) basis. In addition, you and we retain the right to apply to any court of competent jurisdiction for provisional or ancillary relief, including pre-arbitral attachments or preliminary injunctions, and any such request shall not be deemed incompatible with any of these Terms, nor a waiver of the right to have disputes submitted to arbitration as provided in this provision."),
               SizedBox(height: 15.h,),


                Text("A court may sever any portion of this Binding Arbitration and Class Action Waiver Section that it finds to be unenforceable, except for the prohibitions on any Claim being handled on a class or representative basis, and the remaining portions of this arbitration provision will remain valid and enforceable. No waiver of any provision of this Section will be effective or enforceable unless recorded in a writing signed by the party waiving such a right or requirement. Such a waiver shall not waive or affect any other portion of these Terms."),
               SizedBox(height: 15.h,),


                Text("THIS BINDING ARBITRATION AND CLASS ACTION WAIVER SECTION LIMITS CERTAIN RIGHTS, INCLUDING THE RIGHT TO MAINTAIN A COURT ACTION, THE RIGHT TO A JURY TRIAL, THE RIGHT TO PARTICIPATE IN ANY FORM OF CLASS OR REPRESENTATIVE CLAIM, AND THE RIGHT TO ENGAGE IN DISCOVERY EXCEPT AS PROVIDED IN THE AAA RULES. OTHER RIGHTS THAT YOU OR OLGA WOULD HAVE IN COURT ALSO MAY NOT BE AVAILABLE IN ARBITRATION."),
               SizedBox(height: 15.h,),





                  SizedBox(height: 15.h,),
             Text("General Terms", style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold)),
              SizedBox(height: 15.h,),
              Text("Revisions to the Terms"),
               SizedBox(height: 15.h,),
              Text("We reserve the right to revise the Terms at our sole discretion at any time. Any revisions to the Terms will be effective immediately upon posting by us. For any material changes to the Terms, we will take reasonable steps to notify you of such changes, via a banner on the website, email notification, another method, or combination of methods. In all cases, your continued use of the Services after publication of such changes, with or without notification, constitutes binding acceptance of the revised Terms."),


               SizedBox(height: 15.h,),
              Text("Severability; Waiver"),
               SizedBox(height: 15.h,),
              Text("If it turns out that a particular provision of these Terms is not enforceable, this will not affect any other terms. If you do not comply with these Terms, and we do not take immediate action, this does not indicate that we relinquish any rights that we may have (such as taking action in the future)."),
              
              
               SizedBox(height: 15.h,),
              Text("Content Providers"),
               SizedBox(height: 15.h,),
              Text("Our Content Providers and integrated service providers are third party beneficiaries of the Terms and may enforce those provisions of the Terms that relate to them."),



                SizedBox(height: 15.h,),
             Text("Referenced Policies", style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold)),
              SizedBox(height: 15.h,),

              Text("Acceptable Use Policy\nEffective: March 1st, 2022",style: TextStyle(fontSize: 13.sp),),
               SizedBox(height: 15.h,),
              Text("Our mission is to provide universal access to the world’s best Personal Development Programs. We believe strongly in preserving free speech and expression for our users. We also want to make sure that all of our users and Coach’s feel safe and comfortable while using our Services. We have drafted this policy to ensure that people understand and follow the rules when participating in our online community and otherwise using our Services."),

               SizedBox(height: 15.h,),
              Text("We may remove or edit inappropriate content or activity identified by or reported to us. We may separately suspend, disable, or terminate a user's access to all or part of the Services."),


               SizedBox(height: 15.h,),
              Text("You are prohibited from using our Services to share content that:",style: TextStyle(fontSize: 13.sp),),

            //  RichText(
            //   text: TextSpan(
            //     text: '• ',
            //     style: TextStyle(
            //         color: ColorResources.getBlackTextColor(context),
            //         ),
            //     children: <TextSpan>[
            //       TextSpan(
            //         text:"Contains illegal content or promotes illegal activities with the intent to commit such activities. Please keep in mind that users who are as young as 16 use Olga, and we do not allow content that is inappropriate for these younger users.",
            //       ),
            //     ],
            //   ),
            // ),

             Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("Contains illegal content or promotes illegal activities with the intent to commit such activities. Please keep in mind that users who are as young as 16 use Olga, and we do not allow content that is inappropriate for these younger users."))
                 ],
               ),


             Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("Contains credible threats or organizes acts of real-world violence. We don’t allow content that creates a genuine risk of physical injury or property damage, credibly threatens people or public safety, or organizes or encourages harm."))
                 ],
               ),


             Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("Harasses others. Commentary about people and matters of public interest, which is abusive or otherwise inappropriate content directed at private individuals is not allowed."))
                 ],
               ),


             Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("Violates intellectual property, privacy, or other rights. Do not share content that you do not have the right to share, claim content that you did not create as your own, or otherwise infringe or misappropriate someone else’s intellectual property or other rights. Always attribute materials used or quoted by you to the original copyright owner."))
                 ],
               ),


             Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("Spam’s others. Do not share irrelevant or inappropriate advertising, promotional, or solicitation content."))
                 ],
               ),


             Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("Otherwise violates the Olga Terms of Use."))
                 ],
               ),


              SizedBox(height: 15.h,),
               Text("Please note that specific Content Offerings may have additional rules and requirements."),




                SizedBox(height: 15.h,),
              Text("You also aren't allowed to:",style: TextStyle(fontSize: 13.sp),),


               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("Do anything that violates local, state, national, or international law or breaches any of your contractual obligations or fiduciary duties."))
                 ],
               ),


               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("Share your password, let anyone besides yourself access your account, or do anything that might put your account at risk."))
                 ],
               ),


               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("Attempt to access any other user's account."))
                 ],
               ),


               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("Reproduce, transfer, sell, resell, or otherwise misuse any content from our Services, unless specifically authorized to do so."))
                 ],
               ),

               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("Access, tamper with, or use non-public areas of our systems, unless specifically authorized to do so."))
                 ],
               ),


               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("Break or circumvent our authentication or security measures or otherwise test the vulnerability of our systems or networks, unless specifically authorized to do so."))
                 ],
               ),



               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("Try to reverse engineer any portion of our Services."))
                 ],
               ),


               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("Try to interfere with any user, host, or network, for example by sending a virus, overloading, spamming, or mail-bombing."))
                 ],
               ),



               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("Use our Services to distribute malware."))
                 ],
               ),



               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("Use our Services or any functionality of the Olga platform for anything other than for completing online courses or for pedagogical purposes."))
                 ],
               ),


               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("Impersonate or misrepresent your affiliation with any person or entity."))
                 ],
               ),



               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("Encourage or help anyone do any of the things on this list."))
                 ],
               ),



               SizedBox(height: 15.sp),

            Text("Copyright and Trademark Policy", style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold)),
            Text("Effective as of March 1st, 2022"),



             SizedBox(height: 15.h,),
              Text("Olga respects the intellectual property rights of our Content Providers, Coach’s, and other third parties and expects our users to do the same when using the Services. We reserve the right to suspend, disable, or terminate the accounts of users who repeatedly infringe or are repeatedly charged with infringing the copyrights, trademarks, or other intellectual property rights of others."),
 

             SizedBox(height: 15.h,),
              Text("The Digital Millennium Copyright Act of 1998 (the \"DMCA\") provides recourse for copyright owners who believe that material appearing on the Internet infringes their rights under U.S. copyright law. If you would like to read the DMCA, please visit the U.S. Copyright Office website at http://www.copyright.gov/legislation/dmca.pdf."),
            
            
             SizedBox(height: 15.h,),
              Text("If you believe in good faith that materials on the Olga platform infringe your copyright, the DMCA provides that you (or your agent) may send us a notice requesting that the material be removed or access to it blocked."),
            
            
             SizedBox(height: 15.h,),
              Text("The notice must include the following information:"),


              SizedBox(height: 15.h,),
               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("the physical or electronic signature of a person authorized to act on behalf of the owner of an exclusive right that is allegedly infringed;"))
                 ],
               ),


               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("identification of the copyrighted work claimed to have been infringed (or, if multiple copyrighted works located on the platform are covered by a single notification, a representative list of such works);"))
                 ],
               ),



               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("identification of the material that is claimed to be infringing or the subject of infringing activity, and information reasonably sufficient to allow Olga to locate the material on the platform;"))
                 ],
               ),



               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("the name, address, telephone number, and email address (if available) of the complaining party;"))
                 ],
               ),



               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("a statement that the complaining party has a good faith belief that use of the material in the manner complained of is not authorized by the copyright owner, its agent, or the law; and"))
                 ],
               ),


               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("a statement that the information in the notification is accurate and, under penalty of perjury, that the complaining party is authorized to act on behalf of the owner of an exclusive right that is allegedly infringed."))
                 ],
               ),




                SizedBox(height: 15.h,),
              Text("Notices must meet the then-current statutory requirements imposed by the DMCA. Notices and counter-notices with respect to the Services can either be sent:"),


              SizedBox(height: 15.h,),



              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("via mail: Copyright Agent, Olga 381 [INSERT ADDRESS]"))
                 ],
               ),


              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,right:8.0),
                     child: Text("•"),
                   ),
                   Flexible(child: Text("via email: copyright@Olga.com"))
                 ],
               ),




                 SizedBox(height: 15.h,),
              Text("We suggest that you consult your legal advisor before filing a notice. Also, be aware that there can be penalties for false claims under the DMCA."),
              SizedBox(height: 15.h,),



              Text("Olga also respects the trademark rights of others. Accounts with any other content that misleads others or violates another's trademark may be updated, suspended, disabled, or terminated by Olga in its sole discretion. If you are concerned that someone may be using your trademark without proper permission on our Services, please email us at copyright@Olga.com, and we will review your submission. If we deem appropriate, we may remove the offending content, warn the individual who posted the content, and/or temporarily or permanently suspend or disable the individual’s account."),
              SizedBox(height: 15.h,),





               SizedBox(height: 15.sp),

            Text("Refund Policy", style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold)),
            Text("Effective as of March 1st, 2022"),


            SizedBox(height: 15.h,),
              Text("For details on our refund deadlines and policies, please refer to the information below. Please note that our policies differ between subscription payments and one-time payments made for course, specialization, and guided project purchases, and that payment options may vary from one offering to another. Please also note that we treat violations of our Terms of Use and Honor Code very seriously, and we have no obligation to offer refunds to users who violate these or other Olga policies, even if their requests are made within the designated refund period."),
              SizedBox(height: 15.h,),



              Text("For more information about our refund process, including instructions for requesting a refund, please visit our Help Center."),
              SizedBox(height: 15.h,),


              Text("For Month-to-Month Subscriptions",style: TextStyle(fontSize: 13.sp),),
              SizedBox(height: 15.h,),


              Text("Olga does not offer refunds for payments made on a month-month subscription plan. To avoid being charged during a free trial promotion, you must cancel your subscription before your free trial ends."),
              SizedBox(height: 15.h,),


              Text("Your subscription will continue on a month-to-month basis unless and until you cancel or the subscription is suspended or discontinued by Olga."),
              SizedBox(height: 15.h,),


              Text("If you cancel your subscription, cancellation will be effective at the end of the current monthly period; you will continue to have access to your subscription for the remainder of that period, but you will not receive a refund."),
              SizedBox(height: 15.h,),



               Text("For Olga Plus",style: TextStyle(fontSize: 13.sp),),
              SizedBox(height: 15.h,),



              Text("To get a full refund of your Olga Premium subscription payment, submit a refund request via the Help Center within 14 days of your payment. Refunds will not be provided if requested after this 14-day period. Some Olga Plus subscriptions may have a free trial period instead of a refund period. If you do not cancel during the free trial, you will be billed the full amount for the subscription you signed up for and be unable to request a refund."),
              SizedBox(height: 15.h,),


              Text("Your Olga Plus subscription will continue for the subscription period identified at the time of your purchase and then automatically renew unless and until you cancel your subscription or the subscription is suspended or discontinued by Olga."),
              SizedBox(height: 15.h,),


              Text("If you cancel your subscription after the refund period of your subscription, you will continue to have access until the end of the subscription period and will not be billed for the next billing cycle."),
              SizedBox(height: 15.h,),



               Text("For One-time Coaching and Specialization Purchases",style: TextStyle(fontSize: 13.sp),),
              SizedBox(height: 15.h,),


              Text("If you cancel your paid enrollment for a standalone coaching session, Olga will offer you a complete refund until 72 hours prior to your coaching session. However, if you’re taking a course through your company, organization, or a Olga sponsored program (e.g. Olga for Business, Olga for Governments or Organizations, Olga for Refugees, or other Olga Social Good programs) then you can earn your certificate as long as your company's contract with Olga is active and your access has not expired in accordance with the terms of that contract or Olga is still running a sponsored program. Similarly, refunds and cancellations will also be governed by the terms of that contract between your organization and Olga."),
              SizedBox(height: 15.h,),




               Text("For Other Paid Services",style: TextStyle(fontSize: 13.sp),),
              SizedBox(height: 15.h,),


              Text("Except as described in this Refund Policy or as explicitly stated as part of the sign-up process for a Service, Olga has no obligation to provide refunds or vouchers for any other Services."),
              SizedBox(height: 15.h,),


               Text("Third Party Marketplaces",style: TextStyle(fontSize: 13.sp),),
              SizedBox(height: 15.h,),


              Text("Notwithstanding the foregoing, if you purchase or subscribe, or purchase any other paid Service, through a third party marketplace (e.g., in-app purchases through the Apple App Store or purchases made through certain alternative payment services), the refund policy applicable to that third party marketplace will apply, unless otherwise explicitly stated by Olga. Except as otherwise explicitly stated by Olga, the third party marketplace will be solely responsible for making refunds under its refund policy, and Olga will have no refund obligations. Olga disclaims any responsibility or liability related to any third party marketplace's refund policy or the third party's compliance or noncompliance with such policy."),
              SizedBox(height: 15.h,),





               SizedBox(height: 15.sp),

            Text("Revisions", style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold)),



            //!======================================================================================================      
            // RichText(
            //   text: TextSpan(
            //     text: '• ',
            //     style: TextStyle(
            //         color: ColorResources.getBlackTextColor(context),
            //         fontSize: 18.sp),
            //     children: <TextSpan>[
            //       TextSpan(
            //         text: getTranslated("the_users_rights", context),
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
            //         text: getTranslated(
            //             "you_ownership_and_intellectual", context),
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
            //         text: getTranslated("liniting_liability", context),
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
            //         text: getTranslated("the_users_rights", context),
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
            //         text: getTranslated("consumer_law", context),
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
            //         text: getTranslated("delivery_of_goods", context),
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
            //         text: getTranslated("payment_details", context),
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
            //         text: getTranslated("privacy_disclaimer", context),
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
            //         text: getTranslated("disclosure_of_information", context),
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
            //         text: getTranslated("computer_and_restricted", context),
            //       ),
            //     ],
            //   ),
            // ),
          ]),
        ),
      ),
    );
  }
}