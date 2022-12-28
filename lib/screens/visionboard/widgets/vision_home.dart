// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/provider/profile_provider.dart';
import 'package:olga/provider/visionboard_provider.dart';
import 'package:olga/screens/visionboard/my_goal/my_goal_deatils.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/text_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../../global/constants/app_constants.dart';
import '../../../provider/slot_boking_provider.dart';
import '../../registration/one_area/one_area.dart';
import '../../video_calling/calling_feature.dart';

class VisionHome extends StatefulWidget {
  static const String id = "/visionHome";
  const VisionHome({Key? key}) : super(key: key);

  @override
  State<VisionHome> createState() => _VisionHomeState();
}

class _VisionHomeState extends State<VisionHome> {
  @override
  void initState() {
    super.initState();
    VisionboardProvider visionBoard =
        Provider.of<VisionboardProvider>(context, listen: false);
    ProfileProvider profileData =
        Provider.of<ProfileProvider>(context, listen: false);
    visionBoard.viewGoalDetails();
    visionBoard.viewDailyAffirmations();
    //* user profile initial called *//
    profileData.viewUserProfileDetails();
    Provider.of<SlotBookingProvider>(context, listen: false)
        .getUserBookedSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (context, profileData, child) {
      return Consumer<VisionboardProvider>(
          builder: (context, visionBoard, child) {
        return Consumer<StorageProvider>(
            builder: (context, storeValues, child) {
          return RefreshIndicator(
            onRefresh: () async {
              await visionBoard.viewGoalDetails();
              await visionBoard.viewDailyAffirmations();
              await profileData.viewUserProfileDetails();
              if (mounted) {
                await Provider.of<SlotBookingProvider>(context, listen: false)
                    .getUserBookedSlot();
              }
            },
            child: Padding(
              padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: SizedBox(height: 20.sp)),
                  SliverToBoxAdapter(
                    child: Container(
                      //height: 120.h,
                      // width: 340.w,
                      // height: mediaQuery.height * 0.2,
                      decoration: BoxDecoration(
                        // color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('assets/images/Frame22.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(),
                          ),
                          Flexible(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                              //color: Colors.amber,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Meet OLGA',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp),
                                  ),
                                  Text(
                                    'Hi, I am OLGA and I will help',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    'you to achieve your goals.',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      goPage(context, CallingFeature());
                                      Provider.of<SlotBookingProvider>(context,
                                              listen: false)
                                          .getUserBookedSlot();
                                    },
                                    child: Text(
                                      'Meet Now',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 20.sp)),
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getTranslated("my_goal", context),
                          style: TextStyles.boldTextStyle(context),
                        ),
                        TextBtn(
                          title: getTranslated("add_goal", context),
                          onPressed: () {
                            goPageAndRemove(context, OneArea.id);
                          },
                        ),
                      ],
                    ),
                  ),
                  //

                  //
                  SliverToBoxAdapter(child: SizedBox(height: 10.sp)),

                  (visionBoard.goalData.data?.goals != null &&
                  visionBoard.goalData.data!.goals!.isNotEmpty)
                      ? SliverList(delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Card(
                            child: Container(
                              //color: Colors.red,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color(0xFFDEB988),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 150.h,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: GestureDetector(
                                  onTap: () {
                                    StorageProvider storeProvider =
                                        Provider.of<StorageProvider>(
                                            context,
                                            listen: false);

                                    print("=========");
                                    print(index);
                                    print("=========");

                                    storeProvider.updateGoalIndex(index);

                                    goPage(context, MyGoalDetails());
                                    print("======");
                                    print(
                                        "${visionBoard.goalData.data?.goals?[index].id}"
                                            .toString());
                                  },
                                  child: Stack(
                                    //fit: StackFit.passthrough,
                                    fit: StackFit.expand,
                                    //overflow: Overflow.visible,
                                    clipBehavior: Clip.hardEdge,
                                    children: [
                                      visionBoard.goalData.data
                                                  ?.goals?[index].image ==
                                              null
                                          ? 
                                          
                                          
                                          // FadeInImage.assetNetwork(
                                          //     fit: BoxFit.cover,
                                          //     placeholder:
                                          //         Images.uploadImage,
                                          //     image: Images.networkPlaceHolder,
                                          //   )


                                           CachedNetworkImage(
                                              imageUrl: Images.uploadImage,fit: BoxFit.cover,
                                              progressIndicatorBuilder: (context, url, downloadProgress) => 
                                                      Shimmer.fromColors(
                                                      baseColor: Color.fromARGB(255, 196, 192, 192),
                                                      highlightColor: Color.fromARGB(255, 236, 228, 228),child: Image.asset(Images.apoinShimmerBox,fit: BoxFit.cover)),
                                              errorWidget: (context, url, error) => Icon(Icons.error),
                                          )




                                          : 
                                          
                                          
                                          // FadeInImage.assetNetwork(
                                          //     fit: BoxFit.cover,
                                          //     placeholder:
                                          //         Images.uploadImage,
                                          //     image:
                                          //         "${AppConstants.baseURL}${visionBoard.goalData.data?.goals?[index].image}"),


                                           CachedNetworkImage(
                                              imageUrl: "${AppConstants.baseURL}${visionBoard.goalData.data?.goals?[index].image}",fit: BoxFit.cover,
                                              progressIndicatorBuilder: (context, url, downloadProgress) => 
                                                      Shimmer.fromColors(
                                                      baseColor: Color.fromARGB(255, 224, 220, 220),
                                                      highlightColor: Colors.white,child: Image.asset(Images.apoinShimmerBox,fit: BoxFit.cover)),
                                              errorWidget: (context, url, error) => Icon(Icons.error),
                                          ),


                                      Positioned(
                                        top: 100.h,
                                        //left: 3,
                                        child: Container(
                                            height: 50.h,
                                            width: 327.w,
                                           
                                            padding:
                                                const EdgeInsets.only(
                                                    left: 8, right: 8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      0),
                                              gradient: LinearGradient(
                                                begin: Alignment
                                                    .bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: [
                                                  // Color(0x9E616161),
                                                  // Color(0xFF616161),
                                                  Color(0xFF040404),
                                                  Colors.transparent,
                                                ],
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        Alignment.center,
                                                    child: Text(
                                                      "${visionBoard.goalData.data?.goals?[index].goal}",                                                  
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow
                                                              .ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 13.sp,
                                                          color: Colors
                                                              .white),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                      ),
                                    ], //<Widget>[]
                                  ),
                                ),
                              ), //Center
                            ),
                          );
                        },
                      childCount: visionBoard.goalData.data?.goals?.length,
                      ),)
                       
                      : SliverToBoxAdapter(
                        child: Card(
                            child: SizedBox(
                              height: 200.h,
                              child: Center(
                                child: Text("No goals found"),
                              ),
                            ),
                          ),
                      ),

                  // ========= |>>> Hide Daily Affirmations
                  /* SizedBox(height: 10.sp),
                  Text(
                    getTranslated("my_affirmations", context),
                    style: TextStyles.boldTextStyle(context),
                  ),
                  SizedBox(height: 10.sp),
                  //  Daily Affirmations
                   
                  (visionBoard.dailyAffirmations.data != null && visionBoard.dailyAffirmations.data!.isNotEmpty)
                   ? SizedBox(
                    height: 150.h,
                    child: ListView.builder(
                        itemCount: visionBoard.dailyAffirmations.data?.length,
                        scrollDirection: Axis.horizontal,
                        //physics: NeverScrollableScrollPhysics(),

                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color(0xFFDEB988),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 150.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                //fit: StackFit.passthrough,
                                fit: StackFit.expand,
                                //overflow: Overflow.visible,
                                clipBehavior: Clip.hardEdge,
                                children: [
                                  Image(
                                      image: AssetImage(Images.appBarBG),
                                      fit: BoxFit.cover),
                                  Positioned(
                                    top: 100.h,
                                    //left: 3,
                                    child: Container(
                                        height: 50.h,
                                        width: 327.w,
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: [
                                              Color.fromARGB(255, 4, 4, 4),
                                              Colors.transparent,
                                            ],
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Flexible(
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  visionBoard
                                                          .dailyAffirmations
                                                          .data?[index]
                                                          .affirmation ??
                                                      'loading...',
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                ], //<Widget>[]
                              ),
                            ), //Center
                          );
                        }),
                  ) : Card(
                          child: SizedBox(
                            height: 150.h,
                            child: Center(
                              child: Text("No affirmations found"),
                            ),
                          ),
                        ), */
                  SliverToBoxAdapter(child: SizedBox(height: 30.sp)),
                ],
              ),
            ),
          );
        },
        );
      },
      );
    },
    );
  }
}
