import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/constants/app_constants.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/models/data_model/profile_model.dart';
import 'package:olga/provider/profile_provider.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class ProfileDetails extends StatefulWidget {
  static const String id = "ProfileDetails";
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  XFile? image;
  ProfileModel profileModel = ProfileModel();

  @override
  void initState() {
    super.initState();
    ProfileProvider profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    profileProvider.viewUserProfileDetails();
  }

  @override
  Widget build(BuildContext context) {
    StorageProvider storeValues =
        Provider.of<StorageProvider>(context, listen: false);
    ProfileProvider profileProvider =
        Provider.of<ProfileProvider>(context, listen: false); 

    //
    return Scaffold(
     appBar: dashboardAppBar(context, getTranslated("profile_details", context)),
      body: RefreshIndicator(
      onRefresh: () async {
      
        await profileProvider.viewUserProfileDetails();
        },

        child: Container(
        padding: EdgeInsets.all(15.h),
          child: Column(
            children: [
              Consumer<ProfileProvider>(
                builder: (context, profileData, child) {
                  return Column(
                     crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                     Align(
                     alignment: Alignment.center,
                       child: CircularProfileAvatar('https://raw.githubusercontent.com/muktabd/public-images/main/profile-placeholder.jpeg' ,
                                radius: 75.sp,
                                borderWidth: 3,
                                borderColor: Colors.red,
                          child: FadeInImage.assetNetwork(
                            placeholder: Images.uploadImage,
                            image: profileData.profileModel.data?.userDetails?.image == null ? 'https://raw.githubusercontent.com/muktabd/public-images/main/profile-placeholder.jpeg'
                          : "${AppConstants.baseURL}${profileData.profileModel.data?.userDetails?.image}"),
                        ),
                     ),

                  
                      SizedBox(height: 10),
                      Text("Name : ", style: TextStyles.redNormalStyle(context)),
                      Text( "${profileData.profileModel.data?.userDetails?.firstName} ${profileData.profileModel.data?.userDetails?.lastName}",
                            style: TextStyles.smallBoldTextStyle(context),
                          ),

                      /* SizedBox(height: 10),
                      Text(profileData.profileModel.data?.userDetails?.lastName ?? 'null'), */

                      SizedBox(height: 10),
                      Text("Gender : ", style: TextStyles.redNormalStyle(context)),
                      Text( profileData.profileModel.data?.userDetails?.gender ??  'null',
                           // style: TextStyles.smallBoldTextStyle(context),
                          ),

                      SizedBox(height: 10),
                      Text("Date of birth : ", style: TextStyles.redNormalStyle(context)),
                      Text(profileData.profileModel.data?.userDetails?.dateOfBirth ?? storeValues.email),

                      SizedBox(height: 10),
                      Text("Country of residence : ", style: TextStyles.redNormalStyle(context)),
                      Text( profileData.profileModel.data?.userDetails?.countryOfResidence ??  'null',
                           // style: TextStyles.smallBoldTextStyle(context),
                          ),

                      SizedBox(height: 10),
                      Text("Preffered language : ", style: TextStyles.redNormalStyle(context)),
                      Text(profileData.profileModel.data?.userDetails?.prefferedLanguage ?? storeValues.email),

                      SizedBox(height: 10),
                      Text("Phone number : ", style: TextStyles.redNormalStyle(context)),
                      Text( profileData.profileModel.data?.userDetails?.phoneNumber ??  'null',
                           // style: TextStyles.smallBoldTextStyle(context),
                          ),

                      SizedBox(height: 10),
                      


                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


