import 'package:flutter/material.dart';
import 'package:olga/screens/auth/signin_screen.dart';
import 'package:olga/screens/coach/coach.dart';
import 'package:olga/screens/coach/coach_video_calling/appointments_screen.dart';
import 'package:olga/screens/coach/coach_video_calling/feedback_screen.dart';
import 'package:olga/screens/company/company.dart';
import 'package:olga/screens/registration/deepeer/life_wheel.dart';
import 'package:olga/screens/registration/gender_email_next.dart';
import 'package:olga/screens/registration/imcomplete_profile.dart';
import 'package:olga/screens/registration/one_area/career_work/Work_life_balance.dart';
import 'package:olga/screens/registration/one_area/career_work/career_growth.dart';
import 'package:olga/screens/registration/one_area/career_work/cv_resume.dart';
import 'package:olga/screens/registration/one_area/career_work/different_areas.dart';
import 'package:olga/screens/registration/one_area/career_work/happy_with_career.dart';
import 'package:olga/screens/registration/one_area/career_work/happy_with_skills.dart';
import 'package:olga/screens/registration/one_area/career_work/remuneration.dart';
import 'package:olga/screens/registration/one_area/career_work/skills_qualifications.dart';
import 'package:olga/screens/registration/one_area/career_work/social_responsibility.dart';
import 'package:olga/screens/registration/one_area/career_work/vision_screen.dart';
import 'package:olga/screens/registration/one_area/emotional_health/Mood.dart';
import 'package:olga/screens/registration/one_area/emotional_health/emotional_health.dart';
import 'package:olga/screens/registration/one_area/emotional_health/self-control_emotional.dart';
import 'package:olga/screens/registration/one_area/emotional_health/self_management_emotional.dart';
import 'package:olga/screens/registration/one_area/emotional_health/self_regard.dart';
import 'package:olga/screens/registration/one_area/emotional_health/social_skills.dart';
import 'package:olga/screens/registration/one_area/family/acceptance.dart';
import 'package:olga/screens/registration/one_area/family/boundaries.dart';
import 'package:olga/screens/registration/one_area/family/communication_forFamily.dart';
import 'package:olga/screens/registration/one_area/family/extended_family.dart';
import 'package:olga/screens/registration/one_area/family/family.dart';
import 'package:olga/screens/registration/one_area/family/life_family_balance.dart';
import 'package:olga/screens/registration/one_area/family/respect.dart';
import 'package:olga/screens/registration/one_area/family/time_management.dart';
import 'package:olga/screens/registration/one_area/finances/assistance_screen.dart';
import 'package:olga/screens/registration/one_area/finances/budgeting_screen.dart';
import 'package:olga/screens/registration/one_area/finances/credit_screen.dart';
import 'package:olga/screens/registration/one_area/finances/debt_screen.dart';
import 'package:olga/screens/registration/one_area/finances/finance.dart';
import 'package:olga/screens/registration/one_area/finances/financial_health.dart';
import 'package:olga/screens/registration/one_area/finances/financial_planning.dart';
import 'package:olga/screens/registration/one_area/finances/retirement_screen.dart';
import 'package:olga/screens/registration/one_area/friends/acceptance.dart';
import 'package:olga/screens/registration/one_area/friends/assertiveness.dart';
import 'package:olga/screens/registration/one_area/friends/balance.dart';
import 'package:olga/screens/registration/one_area/friends/communication.dart';
import 'package:olga/screens/registration/one_area/friends/growth.dart';
import 'package:olga/screens/registration/one_area/friends/happy_with_support.dart';
import 'package:olga/screens/registration/one_area/friends/respect.dart';
import 'package:olga/screens/registration/one_area/friends/support.dart';
import 'package:olga/screens/registration/one_area/hobbies_fun/adventure_hobby.dart';
import 'package:olga/screens/registration/one_area/hobbies_fun/growth_hobby.dart';
import 'package:olga/screens/registration/one_area/hobbies_fun/hobbies_fun.dart';
import 'package:olga/screens/registration/one_area/hobbies_fun/recreation_hobby.dart';
import 'package:olga/screens/registration/one_area/hobbies_fun/routine_hobby.dart';
import 'package:olga/screens/registration/one_area/hobbies_fun/self_care_hooby.dart';
import 'package:olga/screens/registration/one_area/hobbies_fun/skills_hobby.dart';
import 'package:olga/screens/registration/one_area/hobbies_fun/stress_management.dart';
import 'package:olga/screens/registration/one_area/living_env/Accommodation.dart';
import 'package:olga/screens/registration/one_area/living_env/Lifestyle.dart';
import 'package:olga/screens/registration/one_area/living_env/NatureForLiving.dart';
import 'package:olga/screens/registration/one_area/living_env/Personal_Space.dart';
import 'package:olga/screens/registration/one_area/living_env/Safety.dart';
import 'package:olga/screens/registration/one_area/living_env/Technology.dart';
import 'package:olga/screens/registration/one_area/living_env/Wellbeing.dart';
import 'package:olga/screens/registration/one_area/living_env/living_env.dart';
import 'package:olga/screens/registration/one_area/physicalhealth_care/emotional_health.dart';
import 'package:olga/screens/registration/one_area/physicalhealth_care/mindfulness.dart';
import 'package:olga/screens/registration/one_area/physicalhealth_care/sleep5.dart';
import 'package:olga/screens/registration/one_area/physicalhealth_care/time_management.dart';
import 'package:olga/screens/registration/one_area/romance/boundaries.dart';
import 'package:olga/screens/registration/one_area/romance/conflict_management.dart';
import 'package:olga/screens/registration/one_area/romance/growth.dart';
import 'package:olga/screens/registration/one_area/romance/intimacy.dart';
import 'package:olga/screens/registration/one_area/romance/life_balance.dart';
import 'package:olga/screens/registration/one_area/romance/personal_rights.dart';
import 'package:olga/screens/registration/one_area/romance/relationship_goals.dart';
import 'package:olga/screens/registration/one_area/romance/romance_intimacy.dart';
import 'package:olga/screens/registration/one_area/spirituality/BeliefsForSpiri.dart';
import 'package:olga/screens/registration/one_area/spirituality/Service_toOthers.dart';
import 'package:olga/screens/registration/one_area/spirituality/Spiritual_Intelligence.dart';
import 'package:olga/screens/registration/one_area/spirituality/growth_for_spiritual.dart';
import 'package:olga/screens/registration/one_area/spirituality/respect_rights_forSpiri.dart';
import 'package:olga/screens/registration/one_area/spirituality/social_resp.dart';
import 'package:olga/screens/registration/one_area/spirituality/spirituality.dart';
import 'package:olga/screens/visionboard/common_screens/successful.dart';
import 'package:olga/screens/visionboard/drawer/password/forgot_password_opt.dart';
import 'package:olga/screens/visionboard/drawer/payment/add_card.dart';
import 'package:olga/screens/visionboard/drawer/password/change_password.dart';
import 'package:olga/screens/visionboard/drawer/password/forgot_password.dart';
import 'package:olga/screens/visionboard/drawer/password/new_passwordd.dart';
import 'package:olga/screens/languages/choose_language.dart';
import 'package:olga/screens/registration/choose_word.dart';
import 'package:olga/screens/registration/explain_selected_picture.dart';
import 'package:olga/screens/registration/one_area/physicalhealth_care/health_care_report.dart';
import 'package:olga/screens/registration/one_area/physicalhealth_care/health_screen.dart';
import 'package:olga/screens/registration/one_area/one_area.dart';
import 'package:olga/screens/registration/one_area/one_area_video.dart';
import 'package:olga/screens/registration/one_area/physicalhealth_care/weight_screen.dart';
import 'package:olga/screens/registration/one_word_result.dart';
import 'package:olga/screens/registration/select_one_word.dart';
import 'package:olga/screens/registration/quiz_result.dart';
import 'package:olga/screens/registration/how_feel_today.dart';
import 'package:olga/screens/registration/introductory_video.dart';
import 'package:olga/screens/registration/life_scale.dart';
import 'package:olga/screens/registration/life_scale_result.dart';
import 'package:olga/screens/registration/signup_welcome_screen.dart';
import 'package:olga/screens/registration/enter_name.dart';
import 'package:olga/screens/registration/gender_email.dart';
import 'package:olga/screens/start/starting_screen.dart';
import 'package:olga/screens/visionboard/drawer/payment/purchase_history.dart';
import 'package:olga/screens/visionboard/drawer/privacy_settings/contact.dart';
import 'package:olga/screens/visionboard/drawer/profile/profile_details.dart';
import 'package:olga/screens/visionboard/visionboard.dart';
import 'package:olga/screens/visionboard/drawer/privacy_settings/about_contract_legal.dart';
import 'package:olga/screens/visionboard/drawer/privacy_settings/faq.dart';
import 'package:olga/screens/visionboard/drawer/app_settings/change_language.dart';
import 'package:olga/screens/visionboard/widgets/learn.dart';
import 'package:olga/settings/main_settings.dart';
import '../../screens/registration/one_area/career_work/career_work.dart';
import '../../screens/registration/one_area/deep/goal_deep_care.dart';
import '../../screens/registration/one_area/deep/important_ofgoal.dart';
import '../../screens/registration/one_area/deep/skill_develop.dart';
import '../../screens/registration/one_area/deep/skills_qualities.dart';
import '../../screens/registration/one_area/emotional_health/emotional_different_areas.dart';
import '../../screens/registration/one_area/emotional_health/happy_with_joy.dart';
import '../../screens/registration/one_area/emotional_health/happy_with_relationship.dart';
import '../../screens/registration/one_area/emotional_health/happy_with_stress.dart';
import '../../screens/registration/one_area/family/family_different_areas.dart';
import '../../screens/registration/one_area/family/happy_with_communicate.dart';
import '../../screens/registration/one_area/family/happy_with_spending.dart';
import '../../screens/registration/one_area/finances/finance_different_areas.dart';
import '../../screens/registration/one_area/finances/happy_with_investment.dart';
import '../../screens/registration/one_area/finances/happy_with_savings.dart';
import '../../screens/registration/one_area/friends/friends.dart';
import '../../screens/registration/one_area/friends/friends_different_areas.dart';
import '../../screens/registration/one_area/friends/happy_with_activity.dart';
import '../../screens/registration/one_area/goal/goal_steps.dart';
import '../../screens/registration/one_area/goal/track_goal.dart';
import '../../screens/registration/one_area/goal/upload_photo.dart';
import '../../screens/registration/one_area/hobbies_fun/happy_with_enough_time.dart';
import '../../screens/registration/one_area/hobbies_fun/happy_with_interest.dart';
import '../../screens/registration/one_area/hobbies_fun/hobbies_different_areas.dart';
import '../../screens/registration/one_area/living_env/happy_where_live.dart';
import '../../screens/registration/one_area/living_env/happy_with_relaxing.dart';
import '../../screens/registration/one_area/living_env/living_different_areas.dart';
import '../../screens/registration/one_area/physicalhealth_care/level_of_selfCare.dart';
import '../../screens/registration/one_area/physicalhealth_care/weight_wheel_screen.dart';
import '../../screens/registration/one_area/physicalhealth_care/wellbeing.dart';
import '../../screens/registration/one_area/romance/different_areas_r.dart';
import '../../screens/registration/one_area/romance/happy_with_freedom.dart';
import '../../screens/registration/one_area/romance/happy_with_sex_life.dart';
import '../../screens/registration/one_area/spirituality/philanthropy.dart';
import '../../screens/registration/one_area/spirituality/spiritual_different_areas.dart';
import '../../screens/registration/one_area/spirituality/happy_spiritual_expression.dart';
import '../../screens/registration/one_area/spirituality/meaing_of_life.dart';
import '../../screens/video_calling/adding_card_details.dart';
import '../../screens/video_calling/appoinment_done.dart';
import '../../screens/video_calling/calling_feature.dart';
import '../../screens/video_calling/confirm_slots_details.dart';
import '../../screens/video_calling/join_room.dart';
import '../../screens/video_calling/show_card_screen.dart';
import '../../screens/video_calling/slot_booking.dart';
import '../../screens/video_calling/video_call/video_call.dart';
import '../../screens/video_calling/video_call/video_call2.dart';
import '../../screens/visionboard/drawer/app_settings/offline_usage.dart';
import '../../screens/visionboard/drawer/app_settings/sync_calendar.dart';
import '../../screens/visionboard/drawer/notification/easy_alerts.dart';
import '../../screens/visionboard/drawer/profile/personal_settings.dart';
import '../../screens/registration/completed_screen.dart';
import '../../screens/registration/one_area/physicalhealth_care/fitness_screen.dart';
import '../../screens/visionboard/widgets/vision_home.dart';

//
var routes = <String, WidgetBuilder>{
  StartingScreen.id: (_) => const StartingScreen(),
  ChooseLanguage.id: (_) => const ChooseLanguage(),
  SignupWelcomeScreen.id: (_) => const SignupWelcomeScreen(),
  EnterName.id: (_) => const EnterName(),
  GenderEmail.id: (_) => const GenderEmail(),
  GenderEmailNext.id: (_) => const GenderEmailNext(),
  MainSettingScreen.id: (_) => const MainSettingScreen(),
  IntroductoryVideo.id: (_) => const IntroductoryVideo(),
  LifeScale.id: (_) => const LifeScale(),
  LifeScaleResult.id: (_) => const LifeScaleResult(),
  QuizResult.id: (_) => const QuizResult(),
  HowFeelToday.id: (_) => const HowFeelToday(),
  ChooseWord.id: (_) => const ChooseWord(),
  ExplainSelectedPicture.id: (_) => const ExplainSelectedPicture(),
  SelectOneWord.id: (_) => const SelectOneWord(),
  OneWordResult.id: (_) => const OneWordResult(),
  LifeWheel.id: (_) => const LifeWheel(),

  //
  OneArea.id: (_) => const OneArea(),
  OneAreaVideo.id: (_) => const OneAreaVideo(),
  HealthScreen.id: (_) => const HealthScreen(),
  FitnessScreen.id: (_) => const FitnessScreen(),
  HealthCareReport.id: (_) => const HealthCareReport(),
  GoalDeepCare.id: (_) => const GoalDeepCare(),
  ImportantOfGoal.id: (_) => const ImportantOfGoal(),
  SkillQualities.id: (_) => const SkillQualities(),
  SkillsToDevelop.id: (_) => const SkillsToDevelop(),

  //
  GoalSteps.id: (_) => const GoalSteps(),
  TrackYourGoal.id: (_) => const TrackYourGoal(),
  UploadPhoto.id: (_) => const UploadPhoto(),

  //
  RomanceIntimacyGoal.id: (_) => const RomanceIntimacyGoal(),
  Friends.id: (_) => const Friends(),
  Family.id: (_) => const Family(),
  WeightScreen.id: (_) => const WeightScreen(),
  HobbiesFun.id: (_) => const HobbiesFun(),
  Finances.id: (_) => const Finances(),
  EmotionalHealth.id: (_) => const EmotionalHealth(),
  Spirituality.id: (_) => const Spirituality(),
  LivingEnv.id: (_) => const LivingEnv(),

  //
  Completed.id: (_) => const Completed(),
  VisionBoard.id: (_) => const VisionBoard(),

  //
  PersonalSettings.id: (_) => const PersonalSettings(),
  AddNewCard.id: (_) => AddNewCard(title: ""),
  ChangePassword.id: (_) => const ChangePassword(),
  ForgotPassword.id: (_) => const ForgotPassword(),
  ForgotPasswordOtp.id: (_) => const ForgotPasswordOtp(),
  NewPassword.id: (_) => const NewPassword(),
  Successful.id: (_) => const Successful(),
  AboutContractLegal.id: (_) => const AboutContractLegal(),
  PurchaseHistory.id: (_) => const PurchaseHistory(),
  FAQ.id: (_) => const FAQ(),
  Contact.id: (_) => const Contact(),
  //
  SigninScreen.id: (_) => const SigninScreen(),

  //
  ChangeLanguage.id: (_) => const ChangeLanguage(),

  //
  CoachScreen.id: (_) => const CoachScreen(),
  CompanyScreen.id: (_) => const CompanyScreen(),
  Learn.id: (_) => const Learn(),

  //
  OfflineUsage.id: (_) => const OfflineUsage(),
  SyncToMyCalendar.id: (_) => const SyncToMyCalendar(),

  EasyAlerts.id: (_) => const EasyAlerts(),
  ProfileDetails.id: (_) => const ProfileDetails(),

  //
  CareerWork.id: (_) => const CareerWork(),
  DifferentAreas.id: (_) => const DifferentAreas(),
  DifferentAreasForRomance.id: (_) => const DifferentAreasForRomance(),
  DifferentAreasForEmotionalHealth.id: (_) =>
      const DifferentAreasForEmotionalHealth(),
  HappayWithCareer.id: (_) => const HappayWithCareer(),
  HappyWithSkills.id: (_) => const HappyWithSkills(),

  HappyWithFreedom.id: (_) => const HappyWithFreedom(),
  HappyWIthSexLife.id: (_) => const HappyWIthSexLife(),

//spiritulity
  MeaningOfLife.id: (_) => const MeaningOfLife(),
  HappyWithSpiritualExpression.id: (_) => const HappyWithSpiritualExpression(),
  SpiritualDifferentAreas.id: (_) => const SpiritualDifferentAreas(),

  // emotional
  HappyWithRelationship.id: (_) => const HappyWithRelationship(),
  HappayWithStress.id: (_) => const HappayWithStress(),
  HappyWithJoy.id: (_) => const HappyWithJoy(),

  //family
  HappyWithCommunicate.id: (_) => const HappyWithCommunicate(),
  HappyWithSpending.id: (_) => const HappyWithSpending(),
  FamilyDifferentAreas.id: (_) => const FamilyDifferentAreas(),

  //finace
  HappyWithSavings.id: (_) => const HappyWithSavings(),
  HappayWithInvestment.id: (_) => const HappayWithInvestment(),
  FinanceDifferentAreas.id: (_) => const FinanceDifferentAreas(),

  //friends
  AskingSupport.id: (_) => const AskingSupport(),
  HappyWithActivityShare.id: (_) => const HappyWithActivityShare(),
  FriendsDifferentAreas.id: (_) =>
      const FriendsDifferentAreas(), // + storageValue.oneSelectedArea

  //hobbies/fun
  HappyWithEnoughTime.id: (_) => const HappyWithEnoughTime(),
  HappayWithIterest.id: (_) => const HappayWithIterest(),
  HobbiesDifferentAreas.id: (_) => const HobbiesDifferentAreas(),

  // Living Env
  HappyWithRelaxing.id: (_) => const HappyWithRelaxing(),
  HappayWhereLive.id: (_) => const HappayWhereLive(),
  LivingDifferentAreas.id: (_) => const LivingDifferentAreas(),

  //
  CallingFeature.id: (context) => const CallingFeature(),
  JoinRoom.id: (context) => const JoinRoom(),
  SlotsBooking.id: (context) => const SlotsBooking(),
  ShowCradScreen.id: (context) => const ShowCradScreen(),
  FeedBackScreen.id: (context) => const FeedBackScreen(),
  ConfirmSlotsBooking.id: (context) => const ConfirmSlotsBooking(),
  AddCardDetails.id: (context) => const AddCardDetails(),
  AppoinmentDone.id: (context) => const AppoinmentDone(),
  VideoCall.id: (context) => VideoCall(),
  VideoCallPage2.id: (context) => const VideoCallPage2(),

  //
  AppointmentsScreen.id: (context) => const AppointmentsScreen(),
  IncompleteProfileScreen.id: (context) => const IncompleteProfileScreen(),


  LevelSelfCare.id: (context) => const LevelSelfCare(),
  SleepWheel.id: (context) => const SleepWheel(),
  WellBeingWheel.id: (context) => const WellBeingWheel(),
  WeightWheel.id: (context) => const WeightWheel(),
  EmotionalWheel.id: (context) => const EmotionalWheel(),
  TimeManagementWheel.id: (context) => const TimeManagementWheel(),
  MindfulnessWheel.id: (context) => const MindfulnessWheel(),
  DebtScreen.id: (context) => const DebtScreen(),
  FinancialHealthScreen.id: (context) => const FinancialHealthScreen(),
  BudgetingScreen.id: (context) => const BudgetingScreen(),
  FinancialPlanningScreen.id: (context) => const FinancialPlanningScreen(),
  RetirementScreen.id: (context) => const RetirementScreen(),
  CreditScreen.id: (context) => const CreditScreen(),
  AssistanceScreen.id: (context) => const AssistanceScreen(),
  VisionScreen.id: (context) => const VisionScreen(),
  SocialResponsibilityScreen.id: (context) => const SocialResponsibilityScreen(),
  WorkLifeBalanceScreen.id: (context) => const WorkLifeBalanceScreen(),
  RemunerationScreen.id: (context) => const RemunerationScreen(),
  CVResumeScreen.id: (context) => const CVResumeScreen(),
  CareerGrowthScreen.id: (context) => const CareerGrowthScreen(),
  SkillsQualificationsScreen.id: (context) => const SkillsQualificationsScreen(),
  PersonalRights.id: (context) => const PersonalRights(),
  BoundariesScreen.id: (context) => const BoundariesScreen(),
  GrowthScreen.id: (context) => const GrowthScreen(),
  RelationshipGoalsScreen.id: (context) => const RelationshipGoalsScreen(),
  LifeBalanceScreen.id: (context) => const LifeBalanceScreen(),
  IntimacyScreen.id: (context) => const IntimacyScreen(),
  ConflictManagementScreen.id: (context) => const ConflictManagementScreen(),
  AcceptanceScreen.id: (context) => const AcceptanceScreen(),
  BalanceScreen.id: (context) => const BalanceScreen(),
  CommunicationScreen.id: (context) => const CommunicationScreen(),
  AssertivenessScreen.id: (context) => const AssertivenessScreen(),
  SupportScreen.id: (context) => const SupportScreen(),
  RespectScreen.id: (context) => const RespectScreen(),
  GrowthScreenForFriend.id: (context) => const GrowthScreenForFriend(),
  TimeManagementScreen.id: (context) => const TimeManagementScreen(),
  ExtendedFamilyScreen.id: (context) => const ExtendedFamilyScreen(),
  AcceptanceScreenForFamily.id: (context) => const AcceptanceScreenForFamily(),
  RespectScreenForFamily.id: (context) => const RespectScreenForFamily(),
  BoundariesScreenForFamily.id: (context) => const BoundariesScreenForFamily(),
  CommunicationScreenForFamily.id: (context) => const CommunicationScreenForFamily(),
  FamilyBalanceScreenForFamily.id: (context) => const FamilyBalanceScreenForFamily(),

  //
  RecreationHobby.id: (context) => const RecreationHobby(),
  SelfCareHobby.id: (context) => const SelfCareHobby(),
  GrowthHobby.id: (context) => const GrowthHobby(),
  StressManagement.id: (context) => const StressManagement(),
  Adventure.id: (context) => const Adventure(),
  SkillsHobby.id: (context) => const SkillsHobby(),
  RoutineHobby.id: (context) => const RoutineHobby(),
  SelfControl.id: (context) => const SelfControl(),
  SelfManagement.id: (context) => const SelfManagement(),
  SelfRegard.id: (context) => const SelfRegard(),
  SocialSkills.id: (context) => const SocialSkills(),
  Mood.id: (context) => const Mood(),
  GrowthForSpiritual.id: (context) => const GrowthForSpiritual(),
  ServicetoOthers.id: (context) => const ServicetoOthers(),
  SocialRes.id: (context) => const SocialRes(),
  Philanthropy.id: (context) => const Philanthropy(),
  SpiritualIntelligence.id: (context) => const SpiritualIntelligence(),
  RespectOrRights.id: (context) => const RespectOrRights(),
  BeliefsForSpiri.id: (context) => const BeliefsForSpiri(),
  PersonalSpace.id: (context) => const PersonalSpace(),
  Technology.id: (context) => const Technology(),
  NatureForLiving.id: (context) => const NatureForLiving(),
  Accommodation.id: (context) => const Accommodation(),
  Lifestyle.id: (context) => const Lifestyle(),
  Safety.id: (context) => const Safety(),
  Wellbeing.id: (context) => const Wellbeing(),
  //

};
