// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:developer';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:image_picker/image_picker.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/provider/goal_planning_provider.dart';
import 'package:olga/provider/visionboard_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:olga/global/constants/app_constants.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../global/widgets/custom_widgets.dart';
import '../../../localization/language_constrants.dart';

class EditMyGoal extends StatefulWidget {
  static const String id = "/editMyGoal";

  const EditMyGoal({Key? key}) : super(key: key);

  @override
  State<EditMyGoal> createState() => _EditMyGoalState();
}

class _EditMyGoalState extends State<EditMyGoal> {

 
  List<String>? _careerAffirmationSuggestions;
  List<String>? _careerGoalStepsSuggestions;


  List<String>? _emotionalAffirmationSuggestions;
  List<String>? _emotionalGoalStepsSuggestions;
  

  List<String>? _familyAffirmationSuggestions;
  List<String>? _familyGoalStepsSuggestions;
  


  List<String>? _financesAffirmationSuggestions;
  List<String>? _financesGoalStepsSuggestions;
  


  List<String>? _friendsAffirmationSuggestions;
  List<String>? _friendsGoalStepsSuggestions;


  List<String>? _hobbiesAffirmationSuggestions;
  List<String>? _hobbiesGoalStepsSuggestions;


  List<String>? _livingsAffirmationSuggestions;
   List<String>? _livingGoalStepsSuggestions;


  List<String>? _physicalHAffirmationSuggestions;
  List<String>? _physicalHGoalStepsSuggestions;
 

  List<String>? _romanceAffirmationSuggestions;
  List<String>? _romanceGoalStepsSuggestions; 
 

  List<String>? _spiritualityAffirmationSuggestions;
  List<String>? _spiritualityGoalStepsSuggestions;
 
  List<String>? _testingAffirmationSuggestions;
  List<String>? _testingGoalStepsSuggestions;




  var selectedStartDate = DateTime.now();
  var selectedEndDate = DateTime.now();
  var formatterDate = DateFormat('dd/MM/yy');
  var formatterTime = DateFormat('kk:mm');

  //
  final _mainGoalController = TextEditingController();
  final _firstStepController = TextEditingController();
  //
  final _mindsetController = TextEditingController();
  final _assuranceController = TextEditingController();
  final _secondStepController = TextEditingController();
  final _thirdStepController = TextEditingController();
  final _fourthStepController = TextEditingController();
  final _fifthStepController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  //
  final _benefitsController = TextEditingController();
  final _pricesController = TextEditingController();

  String? promiseToAciveGoal;
  String? goalCategoryID;

  ///*  */

  @override
  void initState() {
    StorageProvider _storeValues =
        Provider.of<StorageProvider>(context, listen: false);
    VisionboardProvider visionBoard = Provider.of<VisionboardProvider>(context, listen: false);
    //!#######################################
    goalCategoryID = visionBoard.goalData.data?.goals?[_storeValues.goalIndex].goalCategoryId;//!######
     if (goalCategoryID == "1"){
       _careerAffirmationSuggestions = [
        "There are an endless supply of jobs that matchmy ideal work/life",
        "I express my strenghts daily and become empowered  in all areas of life ",
        'My career is an expression of my deeper calling ',
        'I choose to be courageous and conquer my fears to be the best vesrsion of self ',
        'I expect a positive outcome and I naturally attract good results.',
        'I am open to receiving all the good life has to offer, and I am capable  of achieving my goals',
        'I am always open minded and eager to explore new avenues to success.',
        'I am open to exciting new possibilities and growing ',
        'The universe is filled with endless career opportunities for me ',
        'I honour my values daily in every thought and actiony to success ',
        'As i invest in my growth, I become more and more successful.',
        'I am open minded and eager to explore new avenues to grow as a person.',
        'The world  is filled with endless  career opportunities for me ',
        'I can accomplish anything I set my mind on I am capable of change to reach my potential',
        'I am proud of my job making a positive contribution to the world  '
      ];

      _careerGoalStepsSuggestions = [
        "Create a vsion board of your ideal life and career",
        "Create a personal interest and strenghts inventory and research links to relevant jobs ",
        'Complete a free online values and interest quiz, then  research relevant  jobs ',
        'Work with counsellor to build the emotional skills needed to successfully step into my desired career',
        'Write down your ideal career and speak to the relevant assocaition for career guidance ',
        'Write down my  short medium and long term career goals and create a vsion to stay on track ',
        'Engage a recruitment agency to support job applications ',
        'Speak to internal HR for support and guidance ',
        'Make an appointment with the relevant association and seek their support in exploring the different pathways and options available',
        'Create a career inventory that align with values ',
        'Complete accredited  courses to further my career',
        'Enrol in accredited  courses to  build professional development  points ',
        'Speak to my association and connect with a mentor  ',
        'Make an appointment with a local  career advisor and  explore educational goals and specific pathways ',
        'Identify organisations that have ethical products and work practices  '
      ];
     }
     
     else if (goalCategoryID == "2") {
       _emotionalAffirmationSuggestions = [
        "I'm good at making balanced decisions",
        "I let go of resistance and open myself to exciting new possibilities.",
        'I will stay motivated to pursue my innermost dreams and be my best and live my best life ',
        'I have the right to respectfully express my opinions ',
        'Every action I take leads me to being my best and living my best life ',
        'People ENGAGE with me the moment they feel heard.',
        'My thoughts and opinions are equally valuable as others ',
        'Diversity brings richness in my life  ',
        'Be the change I want in others ',
        'I attract loving people into my life',
        'I am a source of an endless supply of ideas that support my success ',
        'Every action I take is towards my success in mind body and spirit.',
        'I respect differences. Everyone is entitled to express their views.  ',
        'I will not squander my opportunities ',
        'Every new challenge Is an opportunity to grow. ',
        'I am a radiant being. I enjoy life to its fullest',
        'I see  the beauty in life',
        'I can accomplish anything I set my mind on',
        'I see the bright side in life',
        'I am responsible for all that happens to me '
      ];
      _emotionalGoalStepsSuggestions = [
        "Keep a journal to capture responses and self reflect on learning",
        "I listen to my inner expert when crafting holistic yet practical action steps ",
        'Design my daily schedule to set up routines that reflect all that is important to me',
        'Research and practice the skills of assertive communication ',
        'Set short medium and long term goals towards my ideal life ',
        'Practice being able to correctly reflect the feelings another appears to be expressing',
        'Speaking to 2 new people at social  gatherings',
        'Join an interest group or an online course and learn a new skill',
        'Ask clear, open questions that draw out my partners  view and feelings. I will not assume but ask for clarification.',
        'Count to 10 very slowly. Breathe. Steady my mind Reset action step',
        'Design my schedule to include all parts of my life',
        'I will practise putting forward my position without attacking the other and not taking it personally',
        'Identify cheerleaders who will make you accountable to your steps',
        'Keep a diary and journal my thoughts where insights and solutions can arise ',
        'Connect with like-minded individuals who enjoy the same interest that I do ',
        'Practise generate multiple solutions to any issue ',
        'Write goals.  Review progress. Reset steps ',
        'Practise daily describing life from a positive and strengths based lens',
        'Say your affirmation several times a day '
      ];
     } 
     
     else if (goalCategoryID == "3"){
      _familyAffirmationSuggestions = [
        'Successful people don\'t do it alone ',
        'My family of cheerleaders support my goals ',
        'My siblings are my cheerleaders ',
        'I see my in- lawsws through the eyes of love',
        'My parents love me despite our differences',
        'I accept my family members just as they are',
        'I am grateful for every member of my family',
        'Peace and harmony reign in my family life',
        'I ask for what I need. I honor my desires',
        'I am grateful for every member of my family',
        'I will act lovingly to myself.',
        'I am accept myself and siblings as they are  ',
        'I send a ray of loving energy to my family ',
        'i belong to a large network '
      ];
       _familyGoalStepsSuggestions = [
        'Praoctively set t date nights with family',
        'Identify the strengths of each family member and ask for relevant help ',
        'Proactively set date nights with individaully and collectively ',
        'Organise a regular dinner - monthly /bi- monthly  ',
        'Organise a regular fun outing with a parent(s)',
        'Practise deep listening and paraphrase what is being said without judgement ',
        'Send gratitude notes to each family member  ',
        'Build assertiveness skills by doing an online course ',
        'Schedule tasks and delegate to family members',
        'Set family meetings where every member discusses issues of concern and support needed ',
        'Set time with  outings with individual members  ',
        'Design a balanced schedule between self care and responsibilites ',
        'Organise a regular outing with sibling(s)',
        'Set chat nights/outings with  family members  ',
        'Do the family tree ',
      ];
     }
     
     else if (goalCategoryID == "4"){
      _financesAffirmationSuggestions = [
        'Money comes to me easily and effortlessly',
        'I honour my desires ',
        'I am open to financial abundance   ',
        'I live an abundant life',
        'I love the freedom  money provides for me',
        'Money is a tool that serves my life ',
        'Money serves my life ',
        'I will  create a successful financial future',
        'I control money, money does not control me',
        'I invest in creating  a prosperous life',
        'I am open to financial abundance in my life',
        'My mind is open to exciting new possibilities.',
        'I am open to receiving limitless abundance',
        'Live in the present and prepare for the future',
        'I will create a successful financial life'
        

      ];
      _financesGoalStepsSuggestions = [
        'Set a  1, 3, 5 years financial plan',
        'Update resume. Apply for better paying jobs ',
        'Employ a business coach to go to the next level ',
        'Keep a gratitude journal  ',
        'Micro invest a portion of my salary',
        'Create a budget to help me live within my means',
        'Be mindful of what emotions or situations trigger negative spending habits',
        'Keep organized records to refer to, to identify spending habits',
        'Develop a budget to manage day to day expenses ',
        'Commit to saving at least 10% of my income every week',
        'Engage a financial planner to guide investments',
        'Enrol in micro investment course to ',
        'Discuss with accountant investment ideas ',
        'Contribute additional 10% of income towards superannuation ',
        'Do contract work  that pays well on weekends'
      ];
     }
     
     else if (goalCategoryID == "5"){
       _friendsAffirmationSuggestions = [
        'I see and celebrate the goodness in me',
        'I see and celebrate the goodness in me',
        'I love and respect myself',
        'I accept myself am constantly growing  ',
        'My friendship network supports my growth ',
        'I trust my intuition to guide my decisions',
        'Growth occurs in the most difficult of times. ',
        'Real friends are the best possession ',
        'Successful people don\'t do it alone ',
        'True friends  celebrate your growth ',
        'My friends are my support network',
        'friends are the best possession',
        'True friends invest in their union  ',
        'I recharge my power  through self care',
        'I am my own unique person '
      ];
       _friendsGoalStepsSuggestions = [
        'High five yourself daily just for being you ',
        'Ask friends to identify what they like about you, adding to your strenghts inventory ',
        'Journal your daily achievements ',
        'Practise talking to yourself  kindly by naming what you have done well and reas you would a stranger Be on your own side',
        'Release negative poeple from your network ',
        'Meditate on issues before I make  major decisions ',
        'Suggest solutions or alternative behaviour of how the other coiuld have behaved ',
        'Assess the qualities your current friends have and decide to continue or depart from the connection ',
        'Reach out to  a friend that has a skill you are wanting to develop and ask them for support',
        'Do an online self help course with a friend ',
        'Create set routine. Organise regular catch up. ',
        'Invite to coffee another you are interested in knowing better',
        'Organise annual weekend away ',
        'Designa balanced schedule that protects self care, family and friendships  ',
        'Do a stocktake to decide which activities to continue or replace '
        
      ];
     }
     
     else if (goalCategoryID == "6"){
       _hobbiesAffirmationSuggestions = [
        'I nurutre the child within ',
        'I am constantly expanding as a person ',
        'I nurutre the child within ',
        'Friends have fun together ',
        'I protect my energy levels so i am my best',
        'i focus on being fulfilled and happy ',
        'I use my time wisely to achieve my goals and increase happiness',
        'I recharge my batteries so i am powerful  ',
        'I am grateful for the abundance in my life',
        'I create abundance in my life',
        'My interests invigorate my life force'
        
      ];
       _hobbiesGoalStepsSuggestions = [
        'Go to a theme park and enjoy the rides',
        'Go to a  pottery class /meditation group /painitng ',
        'Do a short  course in that which interests you ',
        'Collectively create your fun list and start taking action. towrards it',
        'Design a schedule that gets the balance right for all areas of life ',
        'Deaign a schedule that incorporates your hobbies ',
        'Join an interest group to grow self',
        'Create a schedule that nurutres your life goals so you dont squander your energy ',
        'Create a schedule that protects  energy levels and allows for rest time',
        'Do a day workshop on goal manifestation',
        'Earn additional income by building a small side business ',
        'Do a short course as a launching pad as part of a process for future business expansion',
        'Enrol into  a course and then apply for jobs',
        'Join an online interest group or in person ',
        'Join an interest group to grow self and increase happiness '
      ];

     }
     
     
     else if (goalCategoryID == "7"){
      _livingsAffirmationSuggestions = [
        'Order Increases my productivity and success   ',
        'Order increases my productivity and  success   ',
        'Order  in the kitchen saves me money ',
        'Orderly living  protects my time and energy ',
        'Orderly living protects my time and energy ',
        'My home recharges my energy levels ',
        'My bedroom restores my energy levels ',
        'I focus on making my desires  a reality  ',
        'Life is short and needs to be lived fully '
      ];
      _livingGoalStepsSuggestions = [
        'Schedule weekly regular time to clean study. Start. Throwing out excess paperwork',
        'Schedule weekly time to order e-folders and delete emails ',
        'Ask friends to share their best organising ideas ',
        'Declutter first. Then buy shelving for stacking  ',
        'Schedule weekly cleaning time to ensure hygiene  ',
        'Give to charity/friends excess furniture /things ',
        'Employ a local gardener to get you going ',
        'Bring more indoor plants. Have comfortable chair to chill and listen to music /read',
        'invest in soft sheets,  new pilllows and soft ligthing ',
        'Declutter excess furnitrure, ',
        'Consult with a real estate ',
        'Research  work opportunities',
        'Choose suburb and get support from real estate',
        'Discuss with  real estate',
        'Research house swap website in chosen country'
        
      ];

     }else if (goalCategoryID == "8"){
       _physicalHAffirmationSuggestions = [
        'I  have a healthy mind body connection',
        'I invest in my lifeforce ',
        'I nurutre my body as it is my lifeforce  ',
        'My body is precious and supports my life force  ',
        'My body is my temple that houses my soul',
        'Healthy choices keep illness away  ',
        'I am dedicated to improving my health',
        'Healthy choices protect my immune system',
        'Healthy choices protect my immune system',
        'I am strong and healthy',
        'Sleep rejuvenates me ',
        'Sleep builds my immune system  ',
        'Sleep protects  me against illness',
        'sleep restores our energy levels',
        'Sleep recalibrates my equilibrium',
        'The universe supports my dreams',
        'I love being  in the pursuit of learning.',
        'I speak with compassion, kindness, and love to myself and others.',
        'Exercise helps me to achieve optimum health',
        'I am surrounded by supportive people. '
      ];
      _physicalHGoalStepsSuggestions = [
        'Do a minimum of 10,000 steps daily ',
        'I nominate the following days ....and time ....to  excercise ',
        'I say my affirmation several  times a day ',
        'Design a workout schedule that is failproof ',
        'Schedule regular dental and medical appointments and excercise daily ',
        'Educate self about healthy substitutes for sugar ',
        'plan what the weekly menu will be. Organise weekly shopping list. Shop purposefully ',
        'Increase intake of whole foods - fruits, vegetables, lean proteins, whole grains and healthy fats',
        'Limit highly processed snack foods, sweets and other packaged foods.',
        'Significantly reduce your intake of take away food   ',
        'Eat early. Avoid, caffeine, and alcohol before bedtime',
        'Practice relaxation.Keep body temperatrue comfortable  ',
        'Go to sleep at the regualr time.Skip naps and get daily excercise',
        'Go to bed between 10 -11pm. Sleep 6- 8 hrs ',
        'Install block out blinds. Remove electronics from bedroom',
        'Practise morning and evening meditation',
        'Do a personal growth course and  ',
        'Practise daily postive self talk. Identify 3 positive actions  you took and high five yourself ',
        '3 weekly x 50 min aerobic and cardiovascular exercise. ',
        'Join a local /online community that come together to encourage, motivate and conquer goals together.',
      ];

     }else if (goalCategoryID == "9"){
      _romanceAffirmationSuggestions = [
        'I am a unique individsual ',
        'I treat others  respectfully as I would like to be treated  ',
        'I have the right to respectfully express my opinions ',
        'I am open minded  to explore new ideas.',
        'I am passionate about my work and that shows in everything I do',
        'I am a free person with a mind of my own ',
        'We are autonous while feeling we can depend on each other.',
        'I am my own unique person ',
        'Teamwork makes dreamwork ',
        'We nurture each others mind body and spirit',
        'Intimacy is to be seen and heard at every level',
        'We nurture each others mind body and spirit ',
        'I see every challenge as an opportunity to overcome ',
        'My  sexuality is my way of being ',
        'I activate fun and lightness within me '
      ];
      _romanceGoalStepsSuggestions = [
        'Do online short communication quiz o understand your and others communication style, ',
        'Give your undivided attention. Listen to what the other person is saying, instead of formulating your response. ',
        'Do not refer to what the other has to change but be  mindful and use the word I. I would like to suggest...I would appreciate it if... and be specific with the solution.',
        'Monitor my tone and body language to ensureI  present calm when sharing ',
        'Improve your slides and flow charts designs for presentations ',
        'Schedule time/activites  with friends and  partner ',
        'set weekly date nights where individual goals and joint goals are nurtured ',
        'Schedule tasks that have been agreed to and nominate clearly who will do what and when ',
        'Create a joint bank account to make payment  for common bills/mortage  and other agreed responsibilities and a personal accout to do as one wishes   ',
        'Articualte regularyly what needs/expections/space is required by each to ensure a healthy parntership  ',
        'Refurbish the bedroom so it has a relaxing and moody atmosphere for intimatacy   ',
        'Take turns in organise weekly romantic nights',
        'Visit GP for full physical assessment',
        'Organsie counselling to strenghten self acceptance ',
        'Buy a feather to tickle each other and laugh '
      ];
     }
     
     
     else if (goalCategoryID == "10"){
      _spiritualityAffirmationSuggestions = [
        'The meaning of life is to live a life of meaning ',
        'My power comes from the inside out ',
        'I listen to my inner voice for guidance ',
        'I am committed to achieving success in every area of my life.',
        'I radiate love  ',
        'I release all limiting beliefs.',
        'I invest in my happiness',
        'I am worthy of all the good life has to offer',
        'I offer my strenghts to the world',
        'As I succeed I can support others in theirs  ',
        'I listen to my souls whispers',
        'I honour my goals ',
        'I love and respect myself',
        'I trust my intuition to guide my decisions',
        'I nurure my soul which is my lifeforce '
      ];
      _spiritualityGoalStepsSuggestions = [
        'Write a  1/3/10 yrs plan to achieve my goals' ,
        'Enrol in a online personal development ',
        'Enrol in a micro credential qualification ',
        'Support another person implement their goal  ',
        'Listen to podcasts on topic of growth.',
        'Set short meduim and long term goals ',
        'Create a time line with action steps to achieving my goals  ',
        'Idenitfy the characterisitcis of your ideal career  ',
        'Link with friends to support each others goals',
        'Meditate 20 minutes morning and evening ',
        'Weekly goal review. Refine steps. Celebrate success',
        'Identify 5 positive daily actions you took ',
        'Go inwards. Name your feelings, Act in alignment ',
        'Listen daily to talks that support my growth '
      ];

     }

      else {
      _testingAffirmationSuggestions = [
        'Nothing found'
      ];
       _testingGoalStepsSuggestions = [
        "Nothing found"
      ];
    }


//!#######################################

    _mainGoalController.text =
        visionBoard.goalData.data?.goals?[_storeValues.goalIndex].goal ??
            _storeValues.mainGoal;
    _startDateController.text = visionBoard
            .goalData.data?.goals?[_storeValues.goalIndex].goalStartDate ??
        _storeValues.startDate;
    _endDateController.text =
        visionBoard.goalData.data?.goals?[_storeValues.goalIndex].goalEndDate ??
            _storeValues.endDate;

    _mindsetController.text = visionBoard
            .goalData.data?.goals?[_storeValues.goalIndex].dailyAffirmation ??
        "";
    _assuranceController.text = visionBoard.goalData.data
            ?.goals?[_storeValues.goalIndex].promiseToAchieveGoal ??
        "";

    ///* 5 steps of goals */
   
   // _firstStepController.text = visionBoard.goalData.data ?.goals?[_storeValues.goalIndex].firstStepToAchieveGoal ?? _storeValues.firstGoal;
    _firstStepController.text =visionBoard.goalData.data ?.goals?[_storeValues.goalIndex].firstStepToAchieveGoal=="null"? "": visionBoard.goalData.data ?.goals?[_storeValues.goalIndex].firstStepToAchieveGoal ?? _storeValues.firstGoal;

    //_secondStepController.text = visionBoard.goalData.data ?.goals?[_storeValues.goalIndex].secondStepToAchieveGoal ??  _storeValues.secondGoal;
    _secondStepController.text = visionBoard.goalData.data ?.goals?[_storeValues.goalIndex].secondStepToAchieveGoal == "null"? " " : visionBoard.goalData.data ?.goals?[_storeValues.goalIndex].secondStepToAchieveGoal ??  _storeValues.secondGoal;

   // _thirdStepController.text = visionBoard.goalData.data  ?.goals?[_storeValues.goalIndex].thirdStepToAchieveGoal ?? _storeValues.thirdGoal;
    _thirdStepController.text = visionBoard.goalData.data  ?.goals?[_storeValues.goalIndex].thirdStepToAchieveGoal =="null" ? " " : visionBoard.goalData.data  ?.goals?[_storeValues.goalIndex].thirdStepToAchieveGoal ?? _storeValues.thirdGoal;


    _fourthStepController.text =  visionBoard.goalData.data ?.goals?[_storeValues.goalIndex].fourthStepToAchieveGoal =="null"?" " : visionBoard.goalData.data ?.goals?[_storeValues.goalIndex].fourthStepToAchieveGoal ??  _storeValues.fourthGoal;

    _fifthStepController.text = visionBoard.goalData.data ?.goals?[_storeValues.goalIndex].fifthStepToAchieveGoal =="null"?" " : visionBoard.goalData.data ?.goals?[_storeValues.goalIndex].fifthStepToAchieveGoal ?? _storeValues.fifthGoal;
    //Happy life survey
    _benefitsController.text =
        visionBoard.goalData.data?.goals?[_storeValues.goalIndex].achieveGoal ??
            _storeValues.benefits;
    _pricesController.text = visionBoard.goalData.data?.goals?[_storeValues.goalIndex].priceUnachieveGoal ??
        _storeValues.price;

   
    super.initState();
    createStringToListSupport(context);
    createStringToListDevelop(context);

     //
     int firstIndex = int.parse("${visionBoard.storeGoalData.data?.goals?[_storeValues.goalIndex].howImportantIsGoal}");
      print("firstIndex == $firstIndex");
      setColorsinIndex(firstIndex, context);   

      int secondIndex = int.parse("${visionBoard.storeGoalData.data?.goals?[_storeValues.goalIndex].worthEffortToAchieve}");
      print("secondIndex == $secondIndex");
      secondColorsinIndex(secondIndex, context);

      int thirdIndex = int.parse("${visionBoard.storeGoalData.data?.goals?[_storeValues.goalIndex].canYouAchieveIt}");
      print("thirdIndex == $thirdIndex");
      thirdIndexColor(thirdIndex, context);   
    
  }

  @override
  void dispose() {
    _mainGoalController.dispose();
    //
    _firstStepController.dispose();
    _secondStepController.dispose();
    _thirdStepController.dispose();
    _fourthStepController.dispose();
    _fifthStepController.dispose();
    super.dispose();
  }

  //
  String selectedQualities = "Resilience";
  List<String> skillsAndQualities = [
    "Resilience",
    "Creativity",
    "Self-reliability",
    "Patience",
    "Courage",
    "Commitment",
    "Willpower",
    "Passion",
    "Planning",
    "Integrity",
    "Optimism",
    "Risk Taking",
    "Self confidence",
    "Empathy",
    "Flexibility",
    "Innovative",
    "Persistence",
    "Pro-active"
  ];

  //
  String selecDevelopSkills = "Resilience";
  List<String> needToDevelopQualities = [
    "Resilience",
    "Creativity",
    "Self-reliability",
    "Patience",
    "Courage",
    "Commitment",
    "Willpower",
    "Passion",
    "Planning",
    "Integrity",
    "Optimism",
    "Risk Taking",
    "Self confidence",
    "Empathy",
    "Flexibility",
    "Innovative",
    "Persistence",
    "Pro-active"
  ];

  final ImagePicker _picker = ImagePicker();
  XFile? image;

  void filePicker(ImageSource source) async {
    final XFile? selectedImage = await _picker.pickImage(source: source);
    //
    if(!mounted){}
     final storeValues = Provider.of<StorageProvider>(context, listen: false);
     final visionBoard = Provider.of<VisionboardProvider>(context, listen: false);
     final goalPlanningProvider = Provider.of<GoalPlanningProvider>(context, listen: false);
     //
     var goalId = visionBoard.goalData.data?.goals?[storeValues.goalIndex].id;
     log("goal id is $goalId");
   

    setState(() {
      image = selectedImage;
      print("selected image ===>>> $image");

      /* 
      * remove comment out if you want the image will be uploaded instantly once the user will choose a image 
      */
      
      // if (image?.path != null){
      //   log("image is selected");
      //   log("goal id is $goalId");
      //   goalPlanningProvider.uploadImageFromEditScreen(image: image!, goalId: goalId!, context: context);
      //   storeValues.changeGoalImage(image);                   
      // }

    });
  }

  clearimage() {
    setState(() {
      image = null;
    });
  }

  Future _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedStartDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime.now(),
        lastDate: DateTime(2030));
    if (picked != null) {
      setState(() {
        selectedStartDate = picked;
        _startDateController.text =
            DateFormat('dd/MM/yyyy').format(selectedStartDate);
      });
    }
  }

  Future _selectEndtDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedEndDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime.now(),
        lastDate: DateTime(2030));
    if (picked != null) {
      setState(() {
        selectedEndDate = picked;
        _endDateController.text = DateFormat('dd/MM/yyyy').format(selectedEndDate);
      });
    }
  }

  createStringToListSupport(BuildContext context) {
  final _storeValues = Provider.of<StorageProvider>(context, listen: false);
  final _visionBoard = Provider.of<VisionboardProvider>(context, listen: false);
    //_storeValues.skillsSupportWordList.clear();
    _storeValues.adderSkillsSupportWord = [...?_visionBoard.storeGoalData.data?.goals?[_storeValues.goalIndex].qualitiesToSupportGoal!.split(",")];
    print(" init: ${_storeValues.skillsSupportWordList}");
  }

  createStringToListDevelop(BuildContext context) {
  final _storeValues = Provider.of<StorageProvider>(context, listen: false);
  final _visionBoard = Provider.of<VisionboardProvider>(context, listen: false);
    _storeValues.skillsDeveloptWordList.clear();
    _storeValues.skillsDeveloptWordList.addAll(_visionBoard.storeGoalData.data?.goals?[_storeValues.goalIndex].qualitiesToDevelopToAchieveGoal!.split(",") ?? []);
    print(" develop: ${_storeValues.skillsDeveloptWordList}");
  }
@override
  void didChangeDependencies() {
    super.didChangeDependencies();
    createStringToListSupport(context);
    createStringToListDevelop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dashboardAppBar(context, getTranslated("review_goal", context)),
      body: SingleChildScrollView(
        child: Consumer<StorageProvider>(
          builder: (context, storeValues, child) {
            return Consumer<VisionboardProvider>(
              builder: (context, visionBoard, child) {        
                return Container(
                  padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                  child: Form(
                    key: AppConstants.globalFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /* Text(_visionBoard.goalData.data
                                ?.goals?[_storeValues.goalIndex].id
                                .toString() ??
                            "00"),
                        Text(_visionBoard
                                .goalData
                                .data
                                ?.goals?[_storeValues.goalIndex]
                                .happyLifeSurveyId
                                .toString() ??
                            "00"), */
                        SizedBox(height: 20),
                        Text(
                          getTranslated("update_goal", context),
                          style: TextStyles.boldTextStyle(context),
                        ),
                        SizedBox(height: 5.sp),
                        TextFormField(
                          controller: _mainGoalController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          onChanged: (value) {
                            setState(() {
                              print("typing new main goal ===>>> $value");
                            });
                          },
                        ),
                        SizedBox(height: 10.sp),
                        //

                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Start Time",
                                    style:
                                        TextStyles.smallBoldTextStyle(context),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.blueGrey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: Text(
                                                _startDateController.text,
                                                style: TextStyles
                                                    .smallBoldTextStyle(
                                                        context)),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _selectStartDate(context);
                                            });
                                          },
                                          icon:
                                              const Icon(Icons.calendar_month),
                                          color: Colors.blueGrey,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("End Time",
                                      style: TextStyles.smallBoldTextStyle(
                                          context)),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.blueGrey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0),
                                              child: Text(
                                                  _endDateController.text,
                                                  style: TextStyles
                                                      .smallBoldTextStyle(
                                                          context))),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _selectEndtDate(context);
                                            });
                                          },
                                          icon:
                                              const Icon(Icons.calendar_month),
                                          color: Colors.blueGrey,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.sp),

                        //
                        Row(
                          //!#################################################
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    getTranslated("image", context),
                                    style: TextStyles.boldTextStyle(context),
                                  ),
                                  if (image == null) ...[
                                    SizedBox(
                                      width: 150.w,
                                      height: 90.h,
                                      child:
                                      CachedNetworkImage(
                                    imageUrl: "${AppConstants.baseURL}${visionBoard.goalData.data?.goals?[storeValues.goalIndex].image}",fit: BoxFit.cover,
                                    progressIndicatorBuilder: (context, url, downloadProgress) => 
                                            Shimmer.fromColors(
                                            baseColor: Color.fromARGB(255, 196, 192, 192),
                                            highlightColor: Color.fromARGB(255, 236, 228, 228),child: Image.asset(Images.apoinShimmerBox,fit: BoxFit.cover)),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                                      //  FadeInImage.assetNetwork(
                                      //     fit: BoxFit.cover,
                                      //     placeholder: Images.uploadImage,
                                      //     image:
                                      //         "${AppConstants.baseURL}${visionBoard.goalData.data?.goals?[storeValues.goalIndex].image}"),
                                    )
                                  ] else ...[
                                    Image.file(
                                      File(image!.path),
                                      width: 150.w,
                                      height: 90.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(""),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DottedBorder(
                                      color: Colors.grey.shade800,
                                      strokeWidth: 1,
                                      child: InkWell(
                                        onTap: () {
                                          print("working..");
                                          setState(() {
                                            bottomSheet(context);
                                          });
                                        },
                                        child: SizedBox(
                                          width: 150.w,
                                          height: 90.h,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              if (image == null) ...[
                                                Image.asset(
                                                  "assets/images/upload_image_icon.png",
                                                ),
                                                const Text(
                                                  "Upload Image",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: "Poppins",
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )
                                              ] else ...[
                                                Text(
                                                  "Image Uploaded",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: "Poppins",
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )
                                              ]
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.sp),

                        //
                        SizedBox(height: 10.sp),

                        Text(
                          getTranslated("midset", context),
                          style: TextStyles.boldTextStyle(context),
                        ),
                        //Text(visionBoard.goalData.data?.goals?[storeValues.goalIndex].dailyAffirmation ??"null"),
                        goalCategoryID == "1"?
                         _buildTextFieldWithSuggessions(_careerAffirmationSuggestions!)

                            : goalCategoryID == "2"? 
                            _buildTextFieldWithSuggessions( _emotionalAffirmationSuggestions!)

                            :goalCategoryID == "3"? 
                                 _buildTextFieldWithSuggessions(_familyAffirmationSuggestions!)

                            :goalCategoryID == "4"? 
                             _buildTextFieldWithSuggessions(_financesAffirmationSuggestions!)

                            :goalCategoryID == "5"? 
                             _buildTextFieldWithSuggessions(_friendsAffirmationSuggestions!)

                            :goalCategoryID == "6"? 
                             _buildTextFieldWithSuggessions(_hobbiesAffirmationSuggestions!)

                            :goalCategoryID == "7"? 
                             _buildTextFieldWithSuggessions(_livingsAffirmationSuggestions!)

                            :goalCategoryID == "8"? 
                             _buildTextFieldWithSuggessions(_physicalHAffirmationSuggestions!)

                            :goalCategoryID == "9"? 
                             _buildTextFieldWithSuggessions(_romanceAffirmationSuggestions!)

                            :goalCategoryID == "10"? 
                             _buildTextFieldWithSuggessions(_spiritualityAffirmationSuggestions!)
                             :_buildTextFieldWithSuggessions(_testingAffirmationSuggestions!),
                             
                        SizedBox(height: 10.sp),

                        //
                        Text(
                          getTranslated("assurance", context),
                          style: TextStyles.boldTextStyle(context),
                        ),
                        //Text(visionBoard.goalData.data?.goals?[storeValues.goalIndex].promiseToAchieveGoal ??"null"),
                        TextFormField(
                          controller: _assuranceController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          onChanged: (value) {
                            setState(() {
                              print("typing new main goal ===>>> $value");
                            });
                          },
                        ),
                        SizedBox(height: 10.sp),

                        Text(
                          getTranslated("steps_will_take_achieve", context),
                          style: TextStyles.boldTextStyle(context),
                        ),
                         goalCategoryID == "1"
                            ? _buildTextFieldForSteps(_careerGoalStepsSuggestions!,_firstStepController)

                            : goalCategoryID == "2"? 
                            _buildTextFieldForSteps( _emotionalGoalStepsSuggestions!,_firstStepController)

                            :goalCategoryID == "3"? 
                                 _buildTextFieldForSteps(_familyGoalStepsSuggestions!,_firstStepController)

                            :goalCategoryID == "4"? 
                             _buildTextFieldForSteps(_financesGoalStepsSuggestions!,_firstStepController)

                            :goalCategoryID == "5"? 
                             _buildTextFieldForSteps(_friendsGoalStepsSuggestions!,_firstStepController)

                            :goalCategoryID == "6"? 
                             _buildTextFieldForSteps(_hobbiesGoalStepsSuggestions!,_firstStepController)

                            :goalCategoryID == "7"? 
                             _buildTextFieldForSteps(_livingGoalStepsSuggestions!,_firstStepController)

                            :goalCategoryID == "8"? 
                             _buildTextFieldForSteps(_physicalHGoalStepsSuggestions!,_firstStepController)

                            :goalCategoryID == "9"? 
                             _buildTextFieldForSteps(_romanceGoalStepsSuggestions!,_firstStepController)

                            :goalCategoryID == "10"? 
                             _buildTextFieldForSteps(_spiritualityGoalStepsSuggestions!,_firstStepController)
                             :_buildTextFieldForSteps(_testingGoalStepsSuggestions!,_firstStepController),

                        //!######################################################################
                        SizedBox(height: 10.sp),

                         goalCategoryID == "1"
                            ? _buildTextFieldForSteps(_careerGoalStepsSuggestions!,_secondStepController)

                            : goalCategoryID == "2"? 
                            _buildTextFieldForSteps( _emotionalGoalStepsSuggestions!,_secondStepController)

                            :goalCategoryID == "3"? 
                                 _buildTextFieldForSteps(_familyGoalStepsSuggestions!,_secondStepController)

                            :goalCategoryID == "4"? 
                             _buildTextFieldForSteps(_financesGoalStepsSuggestions!,_secondStepController)

                            :goalCategoryID == "5"? 
                             _buildTextFieldForSteps(_friendsGoalStepsSuggestions!,_secondStepController)

                            :goalCategoryID == "6"? 
                             _buildTextFieldForSteps(_hobbiesGoalStepsSuggestions!,_secondStepController)

                            :goalCategoryID == "7"? 
                             _buildTextFieldForSteps(_livingGoalStepsSuggestions!,_secondStepController)

                            :goalCategoryID == "8"? 
                             _buildTextFieldForSteps(_physicalHGoalStepsSuggestions!,_secondStepController)

                            :goalCategoryID == "9"? 
                             _buildTextFieldForSteps(_romanceGoalStepsSuggestions!,_secondStepController)

                            :goalCategoryID == "10"? 
                             _buildTextFieldForSteps(_spiritualityGoalStepsSuggestions!,_secondStepController)
                             :_buildTextFieldForSteps(_testingGoalStepsSuggestions!,_secondStepController),

                        //!######################################################################
                        SizedBox(height: 10.sp),

                         goalCategoryID == "1"
                            ? _buildTextFieldForSteps(_careerGoalStepsSuggestions!,_thirdStepController)

                            : goalCategoryID == "2"? 
                            _buildTextFieldForSteps( _emotionalGoalStepsSuggestions!,_thirdStepController)

                            :goalCategoryID == "3"? 
                                 _buildTextFieldForSteps(_familyGoalStepsSuggestions!,_thirdStepController)

                            :goalCategoryID == "4"? 
                             _buildTextFieldForSteps(_financesGoalStepsSuggestions!,_thirdStepController)

                            :goalCategoryID == "5"? 
                             _buildTextFieldForSteps(_friendsGoalStepsSuggestions!,_thirdStepController)

                            :goalCategoryID == "6"? 
                             _buildTextFieldForSteps(_hobbiesGoalStepsSuggestions!,_thirdStepController)

                            :goalCategoryID == "7"? 
                             _buildTextFieldForSteps(_livingGoalStepsSuggestions!,_thirdStepController)

                            :goalCategoryID == "8"? 
                             _buildTextFieldForSteps(_physicalHGoalStepsSuggestions!,_thirdStepController)

                            :goalCategoryID == "9"? 
                             _buildTextFieldForSteps(_romanceGoalStepsSuggestions!,_thirdStepController)

                            :goalCategoryID == "10"? 
                             _buildTextFieldForSteps(_spiritualityGoalStepsSuggestions!,_thirdStepController)
                             :_buildTextFieldForSteps(_testingGoalStepsSuggestions!,_thirdStepController),

                        //!######################################################################
                        SizedBox(height: 10.sp),

                         goalCategoryID == "1"
                            ? _buildTextFieldForSteps(_careerGoalStepsSuggestions!,_fourthStepController)

                            : goalCategoryID == "2"? 
                            _buildTextFieldForSteps( _emotionalGoalStepsSuggestions!,_fourthStepController)

                            :goalCategoryID == "3"? 
                                 _buildTextFieldForSteps(_familyGoalStepsSuggestions!,_fourthStepController)

                            :goalCategoryID == "4"? 
                             _buildTextFieldForSteps(_financesGoalStepsSuggestions!,_fourthStepController)

                            :goalCategoryID == "5"? 
                             _buildTextFieldForSteps(_friendsGoalStepsSuggestions!,_fourthStepController)

                            :goalCategoryID == "6"? 
                             _buildTextFieldForSteps(_hobbiesGoalStepsSuggestions!,_fourthStepController)

                            :goalCategoryID == "7"? 
                             _buildTextFieldForSteps(_livingGoalStepsSuggestions!,_fourthStepController)

                            :goalCategoryID == "8"? 
                             _buildTextFieldForSteps(_physicalHGoalStepsSuggestions!,_fourthStepController)

                            :goalCategoryID == "9"? 
                             _buildTextFieldForSteps(_romanceGoalStepsSuggestions!,_fourthStepController)

                            :goalCategoryID == "10"? 
                             _buildTextFieldForSteps(_spiritualityGoalStepsSuggestions!,_fourthStepController)
                             :_buildTextFieldForSteps(_testingGoalStepsSuggestions!,_fourthStepController),

                        //!######################################################################
                        SizedBox(height: 10.sp),

                         //!############################################################ 5th textfield
                         goalCategoryID == "1"
                            ? _buildTextFieldForSteps(_careerGoalStepsSuggestions!,_fifthStepController)


                            : goalCategoryID == "2"? 
                            _buildTextFieldForSteps( _emotionalGoalStepsSuggestions!,_fifthStepController)


                            :goalCategoryID == "3"? 
                                 _buildTextFieldForSteps(_familyGoalStepsSuggestions!,_fifthStepController)


                            :goalCategoryID == "4"? 
                             _buildTextFieldForSteps(_financesGoalStepsSuggestions!,_fifthStepController)

                            :goalCategoryID == "5"? 
                             _buildTextFieldForSteps(_friendsGoalStepsSuggestions!,_fifthStepController)

                            :goalCategoryID == "6"? 
                             _buildTextFieldForSteps(_hobbiesGoalStepsSuggestions!,_fifthStepController)

                            :goalCategoryID == "7"? 
                             _buildTextFieldForSteps(_livingGoalStepsSuggestions!,_fifthStepController)

                            :goalCategoryID == "8"? 
                             _buildTextFieldForSteps(_physicalHGoalStepsSuggestions!,_fifthStepController)

                            :goalCategoryID == "9"? 
                             _buildTextFieldForSteps(_romanceGoalStepsSuggestions!,_fifthStepController)

                            :goalCategoryID == "10"? 
                             _buildTextFieldForSteps(_spiritualityGoalStepsSuggestions!,_fifthStepController)
                             :_buildTextFieldForSteps(_testingGoalStepsSuggestions!,_fifthStepController),

                        //!######################################################################
                        SizedBox(height: 10.sp),
                        
                        /*  */
                        
                        //Text("${_visionBoard.storeGoalData.data?.goals?[_storeValues.goalIndex].howImportantIsGoal}"),  
                        //Text("${_visionBoard.storeGoalData.data?.goals?[_storeValues.goalIndex].worthEffortToAchieve}"), 
                        //Text("${_visionBoard.storeGoalData.data?.goals?[_storeValues.goalIndex].canYouAchieveIt}"),

                        Text(
                          getTranslated("how_important_goal", context),
                          style: TextStyles.boldTextStyle(context),
                        ),
                        SizedBox(height: 5.sp),
                        SizedBox(
                          height: 20,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    setColorsinIndex(index, context);
                                    storeValues.changeImportantYourGoal(index);
                                  });
                                },
                                child: Card(
                                  child: Container(
                                    color: colors[index],
                                    height: 20,
                                    width: 30,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20.sp),

                        Text(
                          getTranslated("now_ask_worth_effort", context),
                          style: TextStyles.boldTextStyle(context),
                        ),
                        SizedBox(height: 5.sp), //
                        SizedBox(
                          height: 20,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    secondColorsinIndex(index, context);
                                    storeValues.changeWorthYourEffort(index);
                                  });
                                },
                                child: Card(
                                  child: Container(
                                    color: secondColorsScal[index],
                                    height: 20,
                                    width: 30,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20.sp),

                        //
                        Text(
                          getTranslated("do_you_believe", context),
                          style: TextStyles.boldTextStyle(context),
                        ),
                        SizedBox(height: 5.sp), //
                        SizedBox(
                          height: 20,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    thirdIndexColor(index, context);
                                    storeValues.changeBelieveYouCan(index);
                                  });
                                },
                                child: Card(
                                  child: Container(
                                    color: thirtIndexColor[index],
                                    height: 20,
                                    width: 30,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20.sp),

                        //
                        Text(
                          getTranslated("what_will_the_benefits", context),
                          style: TextStyles.boldTextStyle(context),
                        ),
                        SizedBox(height: 10.sp),

                        TextFormField(
                          controller: _benefitsController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                        SizedBox(height: 20.sp),

                        //
                        Text(
                          getTranslated("what_will_the_price", context),
                          style: TextStyles.boldTextStyle(context),
                        ),
                        SizedBox(height: 10.sp),

                        TextFormField(
                          controller: _pricesController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                        SizedBox(height: 20.sp),

                        ///* Skills already have */
                        Text(
                          getTranslated(
                              "what_qualities_have_to_support", context),
                          style: TextStyles.boldTextStyle(context),
                        ),
                        SizedBox(height: 10.sp),
                        Text("${visionBoard.storeGoalData.data?.goals?[storeValues.goalIndex].qualitiesToSupportGoal}"),


                        Row(
                          children: [
                            Flexible(
                                child: //_storeValues.skillsQualities.isNotEmpty ? ca, casc, acs,
                                    ListView.builder(
                                        padding: const EdgeInsets.all(0),
                                        physics: const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: storeValues.skillsSupportWordList.length,
                                        itemBuilder: (BuildContext context, index) {                                       
                                          
                                          return ListTile(
                                            visualDensity: const VisualDensity( horizontal: 0, vertical: -4),
                                            dense: true,
                                            minVerticalPadding: 0,
                                            minLeadingWidth: 10,
                                            horizontalTitleGap: 0,
                                            contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                                            leading: Text(
                                              '• ',
                                            ),

                                            title: Text(storeValues.skillsSupportWordList[index]),
                                            trailing: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  storeValues.skillsSupportWordList.removeAt(index);
                                                  print(storeValues.skillsSupportWordList);

                                                  print("supports ===> deleted");
                                                });
                                              },
                                              icon: const Icon(Icons.delete,
                                                  color: Colors.red),
                                            ),
                                          );
                                        })
                                //: Text("no skill selected"),
                                ),
                            // 

                            /*  */
                            // Skill supports
                            Flexible(
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Select new skills"),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0xFFE10202),
                                        ),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      margin: EdgeInsets.only(top: 10),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: DropdownButton<String>(
                                          underline: Container(),
                                          icon: Icon(Icons.keyboard_arrow_down),
                                          iconSize: 24,
                                          isExpanded: true,
                                          onChanged: (value) { 
                                                  print(storeValues
                                                  .skillsDeveloptWordList);
                                            setState(() {
                                              selectedQualities = value!;
                                          storeValues.adderSkillsSupportWord = [...storeValues.skillsSupportWordList, value];
                                              print(value);
                                              /* 
                                          * add this index in storage 
                                          */
                                             
                                            });
                                          },
                                          value: selectedQualities,
                                          items: skillsAndQualities
                                              .map((state) => DropdownMenuItem(
                                                    value: state,
                                                    child: Text(
                                                      state,
                                                      maxLines: 2,
                                                    ),
                                                  ))
                                              .toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),

                        Text(
                          getTranslated("what_skill_need_develop", context),
                          style: TextStyles.boldTextStyle(context),
                        ),


                        SizedBox(height: 10.sp),

                        Text("${visionBoard.storeGoalData.data?.goals?[storeValues.goalIndex].qualitiesToDevelopToAchieveGoal}"),
                        //for (var i = 0; i < skillsQualitiesNeedDevelop.length; i++) Text("• ${skillsQualitiesNeedDevelop[i]}"),

                        //
                        Row(
                          children: [
                            Flexible(
                              child: ListView.builder(
                                padding: const EdgeInsets.all(0),
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:storeValues.skillsDeveloptWordList.length,
                                itemBuilder: (BuildContext context, index) {
                                  return ListTile(
                                    visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                                    dense: true,
                                    minVerticalPadding: 0,
                                    minLeadingWidth: 10,
                                    horizontalTitleGap: 0,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: 0.0),
                                    leading: Text(
                                      "• ",
                                    ),
                                    title: Text(storeValues.skillsDeveloptWordList[index]),
                                    trailing: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          storeValues.skillsDeveloptWordList
                                              .removeAt(index);
                                          print("===> deleted");
                                        });
                                      },
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                    ),
                                  );
                                },
                              ),
                            ),
                            /*  */
                            //  skill need to develop
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Select new skills"),
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xff8E8E8E),
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    margin: EdgeInsets.only(top: 10),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DropdownButton<String>(
                                        underline: Container(),
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        iconSize: 24,
                                        isExpanded: true,
                                        onChanged: (value) {
                                         print(storeValues
                                                  .skillsDeveloptWordList);
                                            setState(() {
                                              selectedQualities = value!;
                                          storeValues.skillsDeveloptWordList.add(value); //= [..._storeValues.skillsSupportWordList, value];
                                              print(value);
                                              /* 
                                          * add this index in storage 
                                          */
                                             
                                            });
                                        },
                                        value: selecDevelopSkills,
                                        items: needToDevelopQualities
                                            .map((state) => DropdownMenuItem(
                                                  value: state,
                                                  child: Text(
                                                    state,
                                                    maxLines: 2,
                                                  ),
                                                ))
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SubmitButton(
                          title: "SAVE CHANGES",
                          onPressed: () {
                            HapticFeedback.vibrate();
                           var goalId = visionBoard.goalData.data?.goals?[storeValues.goalIndex].id;

                          if (image?.path ==  null){ //EL laberinto del fauno pans labyrinth
                          setState(() {
                             
                              var happyLifeSurveyId = visionBoard.goalData.data?.goals?[storeValues.goalIndex].happyLifeSurveyId;
                              print(goalId);
                              print(happyLifeSurveyId);

                               print(" =================== ");
                                final skillsSupportSend = storeValues.skillsSupportWordList.reduce((value, element) => '$value,$element');
                                print(" =================== ");
                                print(skillsSupportSend);
                                print(" =================== ");
                                // this values will will pass to API 
                                storeValues.updateSkillsSupportSend(skillsSupportSend);

                               print("===================");
                                final skillsNeedDevelopSend = storeValues.skillsDeveloptWordList.reduce((value, element) => '$value,$element');
                                print(skillsNeedDevelopSend);  
                                storeValues.updateSkillsDevelopSend(skillsNeedDevelopSend);
                                print("===================");


                              //
                              String _startDate = DateFormat('MM/dd/yyyy').format(selectedStartDate);
                              String _endDate = DateFormat('MM/dd/yyyy').format(selectedEndDate);

                              final goalPlanningProvider = Provider.of<GoalPlanningProvider>(context,listen: false);

                              goalPlanningProvider.updateGoal( //
                                goalId: goalId!,
                                //happyLifeSurveyId: happyLifeSurveyId,
                                goal: _mainGoalController.text,
                                dailyAffirmation: _mindsetController.text,
                                promiseToAchieveGoal: _assuranceController.text,

                                firstStepToAchieveGoal: _firstStepController.text,
                                secondStepToAchieveGoal: _secondStepController.text,
                                thirdStepToAchieveGoal: _thirdStepController.text,
                                fourthStepToAchieveGoal: _fourthStepController.text,
                                fifthStepToAchieveGoal: _fifthStepController.text,

                                howImportantIsGoal: storeValues.importantYourGoal.toString(),
                                worthEffortToAchieve: storeValues.worthYourEffort.toString(),
                                canIachieveIt: storeValues.believeYouCan.toString(),
                                
                                skillsQualitiesHave: skillsSupportSend,
                                skillsQualitiesNeedToDevelop: skillsNeedDevelopSend,
                                goalStartDate: _startDate,
                                goalEndDate: _endDate,
                                context: context);
                            });

                          } else {
                              log("image is selected");
                              //
                              storeValues.changeGoalImage(image);
                              print("selected image ===>>> $image");
                              print("working with image");
                              final goalPlanningProvider = Provider.of<GoalPlanningProvider>(context, listen: false);
                              goalPlanningProvider.uploadImageFromEditScreen(image: image!, goalId: goalId!, context: context);
                              //


                                print(" =================== ");
                                final skillsSupportSend = storeValues.skillsSupportWordList.reduce((value, element) => '$value,$element');
                                print(" =================== ");
                                print(skillsSupportSend);
                                print(" =================== ");
                                // this values will will pass to API 
                                storeValues.updateSkillsSupportSend(skillsSupportSend);

                                print("===================");
                                final skillsNeedDevelopSend = storeValues.skillsDeveloptWordList.reduce((value, element) => '$value,$element');
                                print(skillsNeedDevelopSend);  
                                storeValues.updateSkillsDevelopSend(skillsNeedDevelopSend);
                                print("===================");


                              //
                              String startDate = DateFormat('MM/dd/yyyy').format(selectedStartDate);
                              String endDate = DateFormat('MM/dd/yyyy').format(selectedEndDate);

                              

                              goalPlanningProvider.updateGoal(
                                goalId: goalId,
                                //happyLifeSurveyId: happyLifeSurveyId,
                                goal: _mainGoalController.text,
                                dailyAffirmation: _mindsetController.text,
                                promiseToAchieveGoal: _assuranceController.text,

                                firstStepToAchieveGoal: _firstStepController.text,
                                secondStepToAchieveGoal: _secondStepController.text,
                                thirdStepToAchieveGoal: _thirdStepController.text,
                                fourthStepToAchieveGoal: _fourthStepController.text,
                                fifthStepToAchieveGoal: _fifthStepController.text,

                                howImportantIsGoal: storeValues.importantYourGoal.toString(),
                                worthEffortToAchieve: storeValues.worthYourEffort.toString(),
                                canIachieveIt: storeValues.believeYouCan.toString(),
                                
                                skillsQualitiesHave: skillsSupportSend,
                                skillsQualitiesNeedToDevelop: skillsNeedDevelopSend,
                                goalStartDate: startDate,
                                goalEndDate: endDate,
                                context: context);
                            }


                          
                            
                          },
                          buttonStyle: ButtonStyles.getCommonStyle(context),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
    
  }

//
  Future<dynamic> bottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 8, right: 8),
                child: Text(
                  "Please insert a picture to help you visualize your goal in your vision board.",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color:
                        const Color(0xffDEB988), // this is for your text colour
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14.0, left: 8, bottom: 0),
                child: Text(
                  "Insert Image From",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: Color(0xff2E2E2E), // this is for your text colour
                  ),
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(
                  left: 8,
                ),
                horizontalTitleGap: 6,
                leading: const Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.black,
                ),
                title: const Text('Camera'),
                onTap: () {
                  filePicker(ImageSource.camera);

                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 8),
                horizontalTitleGap: 6,
                leading: Image.asset(
                  "assets/images/upload_image_icon.png",
                  color: Colors.black,
                  height: 24,
                ),
                title: const Text('Gallery'),
                onTap: () {
                  filePicker(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 8),
                horizontalTitleGap: 6,
                leading: const Icon(
                  Icons.cloud_upload_rounded,
                  color: Colors.black,
                ),
                title: const Text('Cloud Links'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }


  List<Color> colors = [
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
  ];

  setColorsinIndex(firstScalindex, BuildContext context) {
    if (firstScalindex == 0) {
      setState(() {
        colors[0] = Color(0xFFF8F1E7);
        colors[1] = Colors.grey.shade400;
        colors[2] = Colors.grey.shade400;
        colors[3] = Colors.grey.shade400;
        colors[4] = Colors.grey.shade400;
        colors[5] = Colors.grey.shade400;
        colors[6] = Colors.grey.shade400;
        colors[7] = Colors.grey.shade400;
        colors[8] = Colors.grey.shade400;
        colors[9] = Colors.grey.shade400;
      });
    } else if (firstScalindex == 1) {
      setState(() {
        colors[0] = Color(0xFFF8F1E7);
        colors[1] = Color(0xFFF8F1E7);
        colors[2] = Colors.grey.shade400;
        colors[3] = Colors.grey.shade400;
        colors[4] = Colors.grey.shade400;
        colors[5] = Colors.grey.shade400;
        colors[6] = Colors.grey.shade400;
        colors[7] = Colors.grey.shade400;
        colors[8] = Colors.grey.shade400;
        colors[9] = Colors.grey.shade400;
      });
    } else if (firstScalindex == 2) {
      setState(() {
        colors[0] = Color(0xFFF8F1E7);
        colors[1] = Color(0xFFF8F1E7);
        colors[2] = Color(0xFFF2E3CF);
        colors[3] = Colors.grey.shade400;
        colors[4] = Colors.grey.shade400;
        colors[5] = Colors.grey.shade400;
        colors[6] = Colors.grey.shade400;
        colors[7] = Colors.grey.shade400;
        colors[8] = Colors.grey.shade400;
        colors[9] = Colors.grey.shade400;
      });
    } else if (firstScalindex == 3) {
      setState(() {
        colors[0] = Color(0xFFF8F1E7);
        colors[1] = Color(0xFFF8F1E7);
        colors[2] = Color(0xFFF2E3CF);
        colors[3] = Color(0xFFEFDCC4);
        colors[4] = Colors.grey.shade400;
        colors[5] = Colors.grey.shade400;
        colors[6] = Colors.grey.shade400;
        colors[7] = Colors.grey.shade400;
        colors[8] = Colors.grey.shade400;
        colors[9] = Colors.grey.shade400;
      });
    } else if (firstScalindex == 4) {
      setState(() {
        colors[0] = Color(0xFFF8F1E7);
        colors[1] = Color(0xFFF8F1E7);
        colors[2] = Color(0xFFF2E3CF);
        colors[3] = Color(0xFFEFDCC4);
        colors[4] = Color(0xFFEFDCC4);
        colors[5] = Colors.grey.shade400;
        colors[6] = Colors.grey.shade400;
        colors[7] = Colors.grey.shade400;
        colors[8] = Colors.grey.shade400;
        colors[9] = Colors.grey.shade400;
      });
    } else if (firstScalindex == 5) {
      setState(() {
        colors[0] = Color(0xFFF8F1E7);
        colors[1] = Color(0xFFF8F1E7);
        colors[2] = Color(0xFFF2E3CF);
        colors[3] = Color(0xFFEFDCC4);
        colors[4] = Color(0xFFEFDCC4);
        colors[5] = Color(0xFFEFDCC4);
        colors[6] = Colors.grey.shade400;
        colors[7] = Colors.grey.shade400;
        colors[8] = Colors.grey.shade400;
        colors[9] = Colors.grey.shade400;
      });
    } else if (firstScalindex == 6) {
      setState(() {
        colors[0] = Color(0xFFF8F1E7);
        colors[1] = Color(0xFFF8F1E7);
        colors[2] = Color(0xFFF2E3CF);
        colors[3] = Color(0xFFEFDCC4);
        colors[4] = Color(0xFFEFDCC4);
        colors[5] = Color(0xFFEFDCC4);
        colors[6] = Color(0xFFF0DAC0);
        colors[7] = Colors.grey.shade400;
        colors[8] = Colors.grey.shade400;
        colors[9] = Colors.grey.shade400;
      });
    } else if (firstScalindex == 7) {
      setState(() {
        colors[0] = Color(0xFFF8F1E7);
        colors[1] = Color(0xFFF8F1E7);
        colors[2] = Color(0xFFF2E3CF);
        colors[3] = Color(0xFFEFDCC4);
        colors[4] = Color(0xFFEFDCC4);
        colors[5] = Color(0xFFEFDCC4);
        colors[6] = Color(0xFFF0DAC0);
        colors[7] = Color(0xFFEED4B4);
        colors[8] = Colors.grey.shade400;
        colors[9] = Colors.grey.shade400;
      });
    } else if (firstScalindex == 8) {
      setState(() {
        colors[0] = Color(0xFFF8F1E7);
        colors[1] = Color(0xFFF8F1E7);
        colors[2] = Color(0xFFF2E3CF);
        colors[3] = Color(0xFFEFDCC4);
        colors[4] = Color(0xFFEFDCC4);
        colors[5] = Color(0xFFEFDCC4);
        colors[6] = Color(0xFFF0DAC0);
        colors[7] = Color(0xFFEED4B4);
        colors[8] = Color(0xFFF1D2AC);
        colors[9] = Colors.grey.shade400;
      });
    } else if (firstScalindex == 9) {
      setState(() {
        colors[0] = Color(0xFFF8F1E7);
        colors[1] = Color(0xFFF8F1E7);
        colors[2] = Color(0xFFF2E3CF);
        colors[3] = Color(0xFFEFDCC4);
        colors[4] = Color(0xFFEFDCC4);
        colors[5] = Color(0xFFEFDCC4);
        colors[6] = Color(0xFFF0DAC0);
        colors[7] = Color(0xFFEED4B4);
        colors[8] = Color(0xFFF1D2AC);
        colors[9] = Color(0xFFF1CC9D);
      });
    }

    //
  }

  //
  List<Color> secondColorsScal = [
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
  ];

  secondColorsinIndex(index, BuildContext context) {
    if (index == 0) {
      setState(() {
        secondColorsScal[0] = Color(0xFFF8F1E7);
        secondColorsScal[1] = Colors.grey.shade400;
        secondColorsScal[2] = Colors.grey.shade400;
        secondColorsScal[3] = Colors.grey.shade400;
        secondColorsScal[4] = Colors.grey.shade400;
        secondColorsScal[5] = Colors.grey.shade400;
        secondColorsScal[6] = Colors.grey.shade400;
        secondColorsScal[7] = Colors.grey.shade400;
        secondColorsScal[8] = Colors.grey.shade400;
        secondColorsScal[9] = Colors.grey.shade400;
      });
    } else if (index == 1) {
      setState(() {
        secondColorsScal[0] = Color(0xFFF8F1E7);
        secondColorsScal[1] = Color(0xFFF8F1E7);
        secondColorsScal[2] = Colors.grey.shade400;
        secondColorsScal[3] = Colors.grey.shade400;
        secondColorsScal[4] = Colors.grey.shade400;
        secondColorsScal[5] = Colors.grey.shade400;
        secondColorsScal[6] = Colors.grey.shade400;
        secondColorsScal[7] = Colors.grey.shade400;
        secondColorsScal[8] = Colors.grey.shade400;
        secondColorsScal[9] = Colors.grey.shade400;
      });
    } else if (index == 2) {
      setState(() {
        secondColorsScal[0] = Color(0xFFF8F1E7);
        secondColorsScal[1] = Color(0xFFF8F1E7);
        secondColorsScal[2] = Color(0xFFF2E3CF);
        secondColorsScal[3] = Colors.grey.shade400;
        secondColorsScal[4] = Colors.grey.shade400;
        secondColorsScal[5] = Colors.grey.shade400;
        secondColorsScal[6] = Colors.grey.shade400;
        secondColorsScal[7] = Colors.grey.shade400;
        secondColorsScal[8] = Colors.grey.shade400;
        secondColorsScal[9] = Colors.grey.shade400;
      });
    } else if (index == 3) {
      setState(() {
        secondColorsScal[0] = Color(0xFFF8F1E7);
        secondColorsScal[1] = Color(0xFFF8F1E7);
        secondColorsScal[2] = Color(0xFFF2E3CF);
        secondColorsScal[3] = Color(0xFFEFDCC4);
        secondColorsScal[4] = Colors.grey.shade400;
        secondColorsScal[5] = Colors.grey.shade400;
        secondColorsScal[6] = Colors.grey.shade400;
        secondColorsScal[7] = Colors.grey.shade400;
        secondColorsScal[8] = Colors.grey.shade400;
        secondColorsScal[9] = Colors.grey.shade400;
      });
    } else if (index == 4) {
      setState(() {
        secondColorsScal[0] = Color(0xFFF8F1E7);
        secondColorsScal[1] = Color(0xFFF8F1E7);
        secondColorsScal[2] = Color(0xFFF2E3CF);
        secondColorsScal[3] = Color(0xFFEFDCC4);
        secondColorsScal[4] = Color(0xFFEFDCC4);
        secondColorsScal[5] = Colors.grey.shade400;
        secondColorsScal[6] = Colors.grey.shade400;
        secondColorsScal[7] = Colors.grey.shade400;
        secondColorsScal[8] = Colors.grey.shade400;
        secondColorsScal[9] = Colors.grey.shade400;
      });
    } else if (index == 5) {
      setState(() {
        secondColorsScal[0] = Color(0xFFF8F1E7);
        secondColorsScal[1] = Color(0xFFF8F1E7);
        secondColorsScal[2] = Color(0xFFF2E3CF);
        secondColorsScal[3] = Color(0xFFEFDCC4);
        secondColorsScal[4] = Color(0xFFEFDCC4);
        secondColorsScal[5] = Color(0xFFEFDCC4);
        secondColorsScal[6] = Colors.grey.shade400;
        secondColorsScal[7] = Colors.grey.shade400;
        secondColorsScal[8] = Colors.grey.shade400;
        secondColorsScal[9] = Colors.grey.shade400;
      });
    } else if (index == 6) {
      setState(() {
        secondColorsScal[0] = Color(0xFFF8F1E7);
        secondColorsScal[1] = Color(0xFFF8F1E7);
        secondColorsScal[2] = Color(0xFFF2E3CF);
        secondColorsScal[3] = Color(0xFFEFDCC4);
        secondColorsScal[4] = Color(0xFFEFDCC4);
        secondColorsScal[5] = Color(0xFFEFDCC4);
        secondColorsScal[6] = Color(0xFFF0DAC0);
        secondColorsScal[7] = Colors.grey.shade400;
        secondColorsScal[8] = Colors.grey.shade400;
        secondColorsScal[9] = Colors.grey.shade400;
      });
    } else if (index == 7) {
      setState(() {
        secondColorsScal[0] = Color(0xFFF8F1E7);
        secondColorsScal[1] = Color(0xFFF8F1E7);
        secondColorsScal[2] = Color(0xFFF2E3CF);
        secondColorsScal[3] = Color(0xFFEFDCC4);
        secondColorsScal[4] = Color(0xFFEFDCC4);
        secondColorsScal[5] = Color(0xFFEFDCC4);
        secondColorsScal[6] = Color(0xFFF0DAC0);
        secondColorsScal[7] = Color(0xFFEED4B4);
        secondColorsScal[8] = Colors.grey.shade400;
        secondColorsScal[9] = Colors.grey.shade400;
      });
    } else if (index == 8) {
      setState(() {
        secondColorsScal[0] = Color(0xFFF8F1E7);
        secondColorsScal[1] = Color(0xFFF8F1E7);
        secondColorsScal[2] = Color(0xFFF2E3CF);
        secondColorsScal[3] = Color(0xFFEFDCC4);
        secondColorsScal[4] = Color(0xFFEFDCC4);
        secondColorsScal[5] = Color(0xFFEFDCC4);
        secondColorsScal[6] = Color(0xFFF0DAC0);
        secondColorsScal[7] = Color(0xFFEED4B4);
        secondColorsScal[8] = Color(0xFFF1D2AC);
        secondColorsScal[9] = Colors.grey.shade400;
      });
    } else if (index == 9) {
      setState(() {
        secondColorsScal[0] = Color(0xFFF8F1E7);
        secondColorsScal[1] = Color(0xFFF8F1E7);
        secondColorsScal[2] = Color(0xFFF2E3CF);
        secondColorsScal[3] = Color(0xFFEFDCC4);
        secondColorsScal[4] = Color(0xFFEFDCC4);
        secondColorsScal[5] = Color(0xFFEFDCC4);
        secondColorsScal[6] = Color(0xFFF0DAC0);
        secondColorsScal[7] = Color(0xFFEED4B4);
        secondColorsScal[8] = Color(0xFFF1D2AC);
        secondColorsScal[9] = Color(0xFFF1CC9D);
      });
    }
  }

  //

  //
  List<Color> thirtIndexColor = [
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
  ];

  thirdIndexColor(index, BuildContext context) {
    if (index == 0) {
      setState(() {
        thirtIndexColor[0] = Color(0xFFF8F1E7);
        thirtIndexColor[1] = Colors.grey.shade400;
        thirtIndexColor[2] = Colors.grey.shade400;
        thirtIndexColor[3] = Colors.grey.shade400;
        thirtIndexColor[4] = Colors.grey.shade400;
        thirtIndexColor[5] = Colors.grey.shade400;
        thirtIndexColor[6] = Colors.grey.shade400;
        thirtIndexColor[7] = Colors.grey.shade400;
        thirtIndexColor[8] = Colors.grey.shade400;
        thirtIndexColor[9] = Colors.grey.shade400;
      });
    } else if (index == 1) {
      setState(() {
        thirtIndexColor[0] = Color(0xFFF8F1E7);
        thirtIndexColor[1] = Color(0xFFF8F1E7);
        thirtIndexColor[2] = Colors.grey.shade400;
        thirtIndexColor[3] = Colors.grey.shade400;
        thirtIndexColor[4] = Colors.grey.shade400;
        thirtIndexColor[5] = Colors.grey.shade400;
        thirtIndexColor[6] = Colors.grey.shade400;
        thirtIndexColor[7] = Colors.grey.shade400;
        thirtIndexColor[8] = Colors.grey.shade400;
        thirtIndexColor[9] = Colors.grey.shade400;
      });
    } else if (index == 2) {
      setState(() {
        thirtIndexColor[0] = Color(0xFFF8F1E7);
        thirtIndexColor[1] = Color(0xFFF8F1E7);
        thirtIndexColor[2] = Color(0xFFF2E3CF);
        thirtIndexColor[3] = Colors.grey.shade400;
        thirtIndexColor[4] = Colors.grey.shade400;
        thirtIndexColor[5] = Colors.grey.shade400;
        thirtIndexColor[6] = Colors.grey.shade400;
        thirtIndexColor[7] = Colors.grey.shade400;
        thirtIndexColor[8] = Colors.grey.shade400;
        thirtIndexColor[9] = Colors.grey.shade400;
      });
    } else if (index == 3) {
      setState(() {
        thirtIndexColor[0] = Color(0xFFF8F1E7);
        thirtIndexColor[1] = Color(0xFFF8F1E7);
        thirtIndexColor[2] = Color(0xFFF2E3CF);
        thirtIndexColor[3] = Color(0xFFEFDCC4);
        thirtIndexColor[4] = Colors.grey.shade400;
        thirtIndexColor[5] = Colors.grey.shade400;
        thirtIndexColor[6] = Colors.grey.shade400;
        thirtIndexColor[7] = Colors.grey.shade400;
        thirtIndexColor[8] = Colors.grey.shade400;
        thirtIndexColor[9] = Colors.grey.shade400;
      });
    } else if (index == 4) {
      setState(() {
        thirtIndexColor[0] = Color(0xFFF8F1E7);
        thirtIndexColor[1] = Color(0xFFF8F1E7);
        thirtIndexColor[2] = Color(0xFFF2E3CF);
        thirtIndexColor[3] = Color(0xFFEFDCC4);
        thirtIndexColor[4] = Color(0xFFEFDCC4);
        thirtIndexColor[5] = Colors.grey.shade400;
        thirtIndexColor[6] = Colors.grey.shade400;
        thirtIndexColor[7] = Colors.grey.shade400;
        thirtIndexColor[8] = Colors.grey.shade400;
        thirtIndexColor[9] = Colors.grey.shade400;
      });
    } else if (index == 5) {
      setState(() {
        thirtIndexColor[0] = Color(0xFFF8F1E7);
        thirtIndexColor[1] = Color(0xFFF8F1E7);
        thirtIndexColor[2] = Color(0xFFF2E3CF);
        thirtIndexColor[3] = Color(0xFFEFDCC4);
        thirtIndexColor[4] = Color(0xFFEFDCC4);
        thirtIndexColor[5] = Color(0xFFEFDCC4);
        thirtIndexColor[6] = Colors.grey.shade400;
        thirtIndexColor[7] = Colors.grey.shade400;
        thirtIndexColor[8] = Colors.grey.shade400;
        thirtIndexColor[9] = Colors.grey.shade400;
      });
    } else if (index == 6) {
      setState(() {
        thirtIndexColor[0] = Color(0xFFF8F1E7);
        thirtIndexColor[1] = Color(0xFFF8F1E7);
        thirtIndexColor[2] = Color(0xFFF2E3CF);
        thirtIndexColor[3] = Color(0xFFEFDCC4);
        thirtIndexColor[4] = Color(0xFFEFDCC4);
        thirtIndexColor[5] = Color(0xFFEFDCC4);
        thirtIndexColor[6] = Color(0xFFF0DAC0);
        thirtIndexColor[7] = Colors.grey.shade400;
        thirtIndexColor[8] = Colors.grey.shade400;
        thirtIndexColor[9] = Colors.grey.shade400;
      });
    } else if (index == 7) {
      setState(() {
        thirtIndexColor[0] = Color(0xFFF8F1E7);
        thirtIndexColor[1] = Color(0xFFF8F1E7);
        thirtIndexColor[2] = Color(0xFFF2E3CF);
        thirtIndexColor[3] = Color(0xFFEFDCC4);
        thirtIndexColor[4] = Color(0xFFEFDCC4);
        thirtIndexColor[5] = Color(0xFFEFDCC4);
        thirtIndexColor[6] = Color(0xFFF0DAC0);
        thirtIndexColor[7] = Color(0xFFEED4B4);
        thirtIndexColor[8] = Colors.grey.shade400;
        thirtIndexColor[9] = Colors.grey.shade400;
      });
    } else if (index == 8) {
      setState(() {
        thirtIndexColor[0] = Color(0xFFF8F1E7);
        thirtIndexColor[1] = Color(0xFFF8F1E7);
        thirtIndexColor[2] = Color(0xFFF2E3CF);
        thirtIndexColor[3] = Color(0xFFEFDCC4);
        thirtIndexColor[4] = Color(0xFFEFDCC4);
        thirtIndexColor[5] = Color(0xFFEFDCC4);
        thirtIndexColor[6] = Color(0xFFF0DAC0);
        thirtIndexColor[7] = Color(0xFFEED4B4);
        thirtIndexColor[8] = Color(0xFFF1D2AC);
        thirtIndexColor[9] = Colors.grey.shade400;
      });
    } else if (index == 9) {
      setState(() {
        thirtIndexColor[0] = Color(0xFFF8F1E7);
        thirtIndexColor[1] = Color(0xFFF8F1E7);
        thirtIndexColor[2] = Color(0xFFF2E3CF);
        thirtIndexColor[3] = Color(0xFFEFDCC4);
        thirtIndexColor[4] = Color(0xFFEFDCC4);
        thirtIndexColor[5] = Color(0xFFEFDCC4);
        thirtIndexColor[6] = Color(0xFFF0DAC0);
        thirtIndexColor[7] = Color(0xFFEED4B4);
        thirtIndexColor[8] = Color(0xFFF1D2AC);
        thirtIndexColor[9] = Color(0xFFF1CC9D);
      });
    }
  }
  //


   Widget _buildTextFieldWithSuggessions(List<String> textList) {
    return TypeAheadFormField(
      suggestionsBoxVerticalOffset: 1,
      suggestionsBoxDecoration: SuggestionsBoxDecoration(
        // color: Colors.amber,
        constraints: BoxConstraints(maxHeight: 350.h),
      ),
        direction: AxisDirection.up,
        suggestionsCallback: (pattern) => textList.where((item) => item
      .toString()
      .toLowerCase()
      .contains(pattern.toString().toLowerCase())),
        itemBuilder: (_, String item) => ListTile(
    title: Text(item),
        ),
        onSuggestionSelected: (String val) {
    _mindsetController.text = val;
        },
        getImmediateSuggestions: true,
        hideSuggestionsOnKeyboardHide: true,
        hideOnEmpty: true,
       
        textFieldConfiguration: TextFieldConfiguration(
    style: const TextStyle(color: Colors.black),
    decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
   
    controller: _mindsetController,
        ),
      );
  }

  //!########################################################
   Widget _buildTextFieldForSteps(List<String> textList,stepsController) {
    return TypeAheadFormField(
      suggestionsBoxVerticalOffset: 1,
      suggestionsBoxDecoration: SuggestionsBoxDecoration(
        // color: Colors.amber,
        constraints: BoxConstraints(maxHeight: 350.h),
      ),
        direction: AxisDirection.up,
        suggestionsCallback: (pattern) => textList.where((item) => item
      .toString()
      .toLowerCase()
      .contains(pattern.toString().toLowerCase())),
        itemBuilder: (_, String item) => ListTile(
    title: Text(item),
        ),
        onSuggestionSelected: (String val) {
    stepsController.text = val;
        },
        getImmediateSuggestions: true,
        hideSuggestionsOnKeyboardHide: true,
        hideOnEmpty: true,
        
        textFieldConfiguration: TextFieldConfiguration(
    style: const TextStyle(color: Colors.black),
    decoration: InputDecoration(
                           labelText:  stepsController.text==" "?"Add step towards my goal": "",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
   
    controller: stepsController,
        ),
      );
  }
}