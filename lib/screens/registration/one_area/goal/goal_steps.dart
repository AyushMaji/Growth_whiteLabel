// ignore_for_file: avoid_print
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/rectangle_box.dart';
import 'package:olga/global/widgets/richtext.dart';
import 'package:olga/models/data_model/affirmation_model.dart';
import 'package:olga/provider/auth_provider.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'track_goal.dart';

class GoalSteps extends StatefulWidget {
  static const String id = "/goalSteps";
  const GoalSteps({Key? key}) : super(key: key);
  @override
  State<GoalSteps> createState() => _PhysicalSelfcareState();
}

class _PhysicalSelfcareState extends State<GoalSteps> {
  String goalCategotyName = "";
  String goalCategotyId = "";
  List<String>? _careerSpecifySuggestions;
  List<String>? _careerAffirmationSuggestions;
  List<String>? _careerGoalStepsSuggestions;
  List<String>? _emotionalSpecifySuggestions;
  List<String>? _emotionalAffirmationSuggestions;
  List<String>? _emotionalGoalStepsSuggestions;
  List<String>? _familySpecifySuggestions;
  List<String>? _familyAffirmationSuggestions;
  List<String>? _familyGoalStepsSuggestions;
  List<String>? _financesSpecifySuggestions;
  List<String>? _financesAffirmationSuggestions;
  List<String>? _financesGoalStepsSuggestions;
  List<String>? _friendsSpecifySuggestions;
  List<String>? _friendsAffirmationSuggestions;
  List<String>? _friendsGoalStepsSuggestions;
  List<String>? _hobbiesSpecifySuggestions;
  List<String>? _hobbiesAffirmationSuggestions;
  List<String>? _hobbiesGoalStepsSuggestions;
  List<String>? _livingSpecifySuggestions;
  List<String>? _livingsAffirmationSuggestions;
  List<String>? _livingGoalStepsSuggestions;
  List<String>? _physicalHSpecifySuggestions;
  List<String>? _physicalHAffirmationSuggestions;
  List<String>? _physicalHGoalStepsSuggestions;
  List<String>? _romanceSpecifySuggestions;
  List<String>? _romanceAffirmationSuggestions;
  List<String>? _romanceGoalStepsSuggestions;
  List<String>? _spiritualitySpecifySuggestions;
  List<String>? _spiritualityAffirmationSuggestions;
  List<String>? _spiritualityGoalStepsSuggestions;
  List<String>? _testingSpecifySuggestions;
  List<String>? _testingAffirmationSuggestions;
  List<String>? _testingGoalStepsSuggestions;
  TextEditingController commonGoalControler = TextEditingController();
  String myMainGoal = "";
  String mindSet = "";
  String assurance = "";
  String real = "";
  String firstGoal = "";
  String secondGoal = "";
  String thirdGoal = "";
  String fourthGoal = "";
  String fifthGoal = "";
  bool isvisible = true;
  _loadSharedData() {
    final storeValues = Provider.of<StorageProvider>(context, listen: false);
    SharedPreferences? prefs =  Provider.of<AuthProvider>(context, listen: false).prefs;
    goalCategotyName =
        prefs!.getString("oneSelectedArea") ?? storeValues.oneSelectedArea;
    goalCategotyId =
        prefs.getString("oneSelectedAreaId") ?? storeValues.oneSelectedAreaId;
    print("category name ==> $goalCategotyName");
    print("category ID ==> $goalCategotyId");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadSharedData();
  }

  @override
  void initState() {
    super.initState();
    _loadSharedData();
    final storeValues = Provider.of<StorageProvider>(context, listen: false);
    storeValues.registrationSafetyNet(route: GoalSteps.id);
    print("Goal Category area ==> ${storeValues.oneSelectedArea}");
    print("Goal Category ID ==> ${storeValues.oneSelectedAreaId}");
    //if (goalCategotyId == "1") { //! ============================= NULL error page
     if (storeValues.oneSelectedAreaId == "1") { //! ========================== Working
      _careerSpecifySuggestions = [
        "dentify a career that supports my ideal life",
        "Identify jobs that harness my natural strenghts ",
        'Identify career fields that match my core values and interests ',
        'Overcome the fears that hold me back from making change and being my best',
        'Identify the organisations I would like to work with that I feel I must have in my job/career to make me happy',
        'Set a  1/3/5 years career plan',
        'Apply for roles in other organisations',
        'Apply for roles in my  organisation',
        'Transition to another industry',
        'Choose careers that express my core values',
        'Upgrade my qualifications to further my career pathway',
        'mprove my resume and career portfolio to strengthen my propspects',
        'Identify the different fields that I can work in',
        'I will upgrade my qualifications to increase my career choices',
        'Work in socially and ethically responsible organisations'
      ];
      _careerAffirmationSuggestions = [
        "There are an endless supply of jobs that matchmy ideal work/life",
        "I express my strenghts daily and become empowered  in all areas of life ",
        'My career is an expression of my deeper calling ',
        'I choose to be courageous and conquer my fears to be the best vesrsion of myself',
        'I expect a positive outcome and I naturally attract good results.',
        'I am open to receiving all the good life has to offer, and I am capable  of achieving my goals',
        'I am always open minded and eager to explore new avenues to success.',
        'I am open to exciting new possibilities and growing ',
        'The universe is filled with endless career opportunities for me ',
        'I honour my values daily in every thought and action to help me achieve my success',
        'As i invest in my growth, I become more and more successful.',
        'I am open minded and eager to explore new avenues to grow as a person.',
        'The world  is filled with endless  career opportunities for me ',
        'I can accomplish anything I set my mind on. I am capable of change to reach my potential',
        'I am proud of my job making a positive contribution to the world  '
      ];
      _careerGoalStepsSuggestions = [
        "Create a vsion board of your ideal life and career",
        "Create a personal interest and strenghts inventory and research links to relevant jobs ",
        'Complete a free online values and interest quiz, then  research relevant  jobs ',
        'Work with a counsellor to build the emotional skills needed to successfully step into my desired career',
        'Write down my ideal career and speak to the relevant assocaition for career guidance ',
        'Write down my  short medium and long term career goals and create a vision to stay on track',
        'Engage a recruitment agency to support job applications ',
        'Speak to internal HR for support and guidance ',
        'Make an appointment with the relevant association and seek their support in exploring the different pathways and options available',
        'Create a career inventory that align with my values',
        'Complete accredited  courses to further my career',
        'Enrol in accredited  courses to  build professional development  points ',
        'Speak to my association and connect with a mentor  ',
        'Make an appointment with a local  career advisor and  explore educational goals and specific pathways ',
        'Identify organisations that have ethical products and work practices  '
      ];
    } else if (storeValues.oneSelectedAreaId == "2") {
      _emotionalSpecifySuggestions = [
        'I am self aware and understand my triggers',
        'I combine my heart and head to guide my decisions',
        'I align my daily actions in body, mind, and spirit for succcess',
        'I confidently express my ideas and opinions.',
        'Design my life vision',
        'To listen deeply while holding my own reactions in check',
        'To confidently communicate with others in social settings  ',
        'Connect with a diverse range of people ',
        'Communicate calmly with my partner when we have opposing views',
        'To have more friendships',
        'Respond to life\'s demands with calmness clarity and optimism',
        'Proactively manage my daily responsibilities with ease ',
        'Manange emotional responses when others disagree with me',
        'I will not  procrastinate  ',
        'Learn to adjust emotions, thoughts, & behaviour to changing situations',
        'Proactively increases positive associations ',
        'Remain optimistic despite difficulties. ',
        'Set goals in every area of life',
        'Be positive, use positive language   ',
        'Accept total responsibility for the choices and decisions I make'
      ];
      _emotionalAffirmationSuggestions = [
        "I'm good at making balanced decisions",
        "I let go of resistance and open myself to exciting new possibilities.",
        'I will stay motivated to pursue my innermost dreams and be my best and live my best life ',
        'I have the right to respectfully express my opinions ',
        'Every action I take leads me to being my best and living my best life',
        'People ENGAGE with me the moment they feel heard.',
        'My thoughts and opinions are equally as valuable as others',
        'Diversity brings richness in my life  ',
        'Be the change I want in others ',
        'I attract loving people into my life',
        'I am a source of an endless supply of ideas that support my success ',
        'Every action I take is towards my success in mind body and spirit.',
        'I respect differences. Everyone is entitled to express their views.  ',
        'I will not squander my opportunities',
        'Every new challenge is an opportunity to grow.',
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
        'Practice being able to correctly reflect the feelings another individual appears to be expressing',
        'Speaking to 2 new people at social  gatherings',
        'Join an interest group or an online course and learn a new skill',
        'Ask clear, open questions that draw out my partners view and feelings. I will not assume but ask for clarification.',
        'Not assume I know what people mean but ask for clarification instead.',
        'Count to 10 very slowly. Breathe. Steady my mind Reset and action this process.',
        'Design my schedule to include all parts of my life',
        'I will practise putting forward my position without attacking others and taking it personally',
        'Identify cheerleaders who will make me accountable to your steps',
        'Keep a diary and journal on my thoughts where insights and solutions can arise ',
        'Connect with like-minded individuals who enjoy the same interests that I do',
        'Practise generating multiple solutions to any issue',
        'Write goals.  Review progress. Reset steps ',
        'Practise daily describing life from a positive and strengths based lens',
        'Saying my affirmation out loud several times a day'
      ];
    } else if (storeValues.oneSelectedAreaId == "3") {
      _familySpecifySuggestions = [
        'Real and deeper chats with family',
        'Connect with family members in their area of expertise',
        'Build a stronger connection with siblings',
        'Build a positive  connection with in laws',
        'Connect with  parents',
        'Communicate my views calmly despite opposing views  ',
        'Communicate my love and gratitude ',
        'Work on my ability to communicate my feelings honestly',
        'Negotiate my boundaries with family members',
        'Have family meetings ',
        'Strengthen my connection  ',
        'Reduce time with family ',
        'Increase time with siblings ',
        'Have deeper conversations with my family',
        'Get to know my extended family'
      ];
      _familyAffirmationSuggestions = [
        'Successful people don\'t do it alone ',
        'My family of cheerleaders support my goals ',
        'My siblings are my cheerleaders ',
        'I see my in- laws through the eyes of love',
        'My parents love me despite our differences',
        'I accept my family members just as they are',
        'I am grateful for every member of my family',
        'Peace and harmony reign in my family life',
        'I ask for what I need. I honor my desires',
        'I am grateful for every member of my family',
        'I will act lovingly to myself.',
        'I am accept myself and siblings as they are  ',
        'I send a ray of loving energy to my family ',
        'I belong to a large family network'
      ];
      _familyGoalStepsSuggestions = [
        'Praoctively set date nights with family',
        'Identify the strengths of each family member and ask for relevant help ',
        'Proactively set date nights for me individually and with my partner collectively ',
        'Organize a regular dinner - monthly/bi- monthly ',
        'Organize a regular fun outing with my parent(s)',
        'Practise deep listening and paraphrase what is being said without judgement ',
        'Send gratitude notes to each family member  ',
        'Build assertiveness skills by doing an online course ',
        'Schedule tasks and delegate to family members',
        'Set family meetings where every member discusses issues of concern and support needed ',
        'Set time for outings with individual family members ',
        'Design a balanced schedule between self care and responsibilites ',
        'Organise a regular outing with sibling(s)',
        'Set chat nights/outings with  family members  ',
        'Do the family tree ',
      ];
    } else if (storeValues.oneSelectedAreaId == "4") {
      _financesSpecifySuggestions = [
        'Design my financial  security',
        'Increase my income',
        'Grow my career/business',
        'Live within my means',
        'Generate passive income',
        'Save to buy a home',
        'Save for a holiday',
        'Save to buy a car',
        'Save for retirement',
        'Save for a rainy day',
        'Create  an investment potfolio',
        'Explore micro investments',
        'Increase investment knowledge ',
        'Increase future superannuation income ',
        'Generate a second income ',
      ];
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
        'Set a  1/3/5 years financial plan',
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
        'Enrol in a micro investment course',
        'Discuss with accountant investment ideas ',
        'Contribute additional 10% of income towards superannuation ',
        'Do contract work that pays well on weekends'
      ];
    } else if (storeValues.oneSelectedAreaId == "5") {
      _friendsSpecifySuggestions = [
        'I respect my uniquness',
        'My friends accept me as I am ',
        'I accept myself as I am ',
        'I love and accept myself unashamedly',
        'Connect with friends who support my self growth ',
        'Communicate my needs with ease',
        'Learn to express when I am upset constructively',
        'Define what makes a  good friendship for me',
        'Reach out and ask for support ',
        'Buddy up with friends for self growth  ',
        'Nuruture existing friendships  ',
        'Nurture new relationships  ',
        'Nuruture regualr connection with friends ',
        'Get the balance right between self care and social life ',
        'Review my interest in exisitng activities'
      ];
      _friendsAffirmationSuggestions = [
        'I see and celebrate the goodness in me',
        'I see and celebrate the goodness in me',
        'I love and respect myself',
        'I accept myself am I am constantly growing',
        'My friendship network supports my growth',
        'I trust my intuition to guide my decisions',
        'Growth occurs in the most difficult of times. ',
        'Real friends are the best possession ',
        'Successful people don\'t do it alone ',
        'True friends  celebrate your growth ',
        'My friends are my support network',
        'Friends are the best possession',
        'True friends invest in their union  ',
        'I recharge my power through self care',
        'I am my own unique person '
      ];
      _friendsGoalStepsSuggestions = [
        'High-five myself daily just for being me',
        'Ask friends to identify what they like about me, and add these assets to my strenghts inventory',
        'Journal my daily achievements',
        'Practise talking to myself kindly by naming what I have done well.',
        'Release negative poeple from my network',
        'Meditate on issues before I make major decisions',
        'Suggest solutions or alternative behavior of how the other person could have behaved ',
        'Assess the qualities my current friends have and decide to continue or depart from the connection ',
        'Reach out to  a friend that has a skill you are wanting to develop and ask them for support',
        'Do an online self help course with a friend ',
        'Create a set routine. Organise regular catch ups.',
        'Invite to coffee another person I are interested in knowing better',
        'Organise annual weekend away ',
        'Design a balanced schedule that protects self care, family and friendships ',
        'Do a stocktake to decide which activities to continue or replace '
      ];
    } else if (storeValues.oneSelectedAreaId == "6") {
      _hobbiesSpecifySuggestions = [
        'Identify one off fun activities',
        'Identify new interests to explore ',
        'Be open to new expereinces ',
        'Brainstorm with friends how to have fun together  ',
        'Do not burn the candle at both ends ',
        'Make time for my hobbies ',
        'Explore my interests ',
        'Focus on my goals ',
        'Allocate time  for self care ',
        'Allocate time  for personal growth ',
        'Turn my interest into a business',
        'Identify my interests ',
        'Convert my interest into a job',
        'Allocate time towards my interest',
        'Dedicate time to develop skills '
      ];
      _hobbiesAffirmationSuggestions = [
        'I nurture the child within',
        'I am constantly expanding as a person',
        'I nurture the child within',
        'Friends have fun together ',
        'I protect my energy levels so I am my best',
        'I focus on being fulfilled and happy',
        'I use my time wisely to achieve my goals and increase happiness',
        'I recharge my batteries so I am powerful  ',
        'I am grateful for the abundance in my life',
        'I create abundance in my life',
        'My interests invigorate my life force'
      ];
      _hobbiesGoalStepsSuggestions = [
        'Go to a theme park and enjoy the rides',
        'Go to a pottery class/meditation group /painitng',
        'Do a short course in that which interests me',
        'Collectively create my fun list and start taking action towrards it',
        'Design a schedule that gets the balance right for all areas of life ',
        'Design a schedule that incorporates my hobbies',
        'Join an interest group to grow self',
        'Create a schedule that nurutres my life goals so I dont squander my energy',
        'Create a schedule that protects  energy levels and allows for rest time',
        'Do a day workshop on goal manifestation',
        'Earn additional income by building a small side business ',
        'Do a short course as a launching pad as part of a process for future business expansion',
        'Enrol into  a course and then apply for jobs',
        'Join an interest group online or in person ',
        'Join an interest group to grow self and increase happiness '
      ];
    } else if (storeValues.oneSelectedAreaId == "7") {
      _livingSpecifySuggestions = [
        'Organise my study/office',
        'Organise my computer ',
        'Organise the kitchen ',
        'Organise the garage ',
        'Organsie the bathroom',
        'Declutter the house',
        'Improve the garden',
        'Create special space to relax',
        'Create a relaxing bedroom ',
        'Organise the living area',
        'Move closer to the inner city  ',
        'Move to the country  ',
        'Move close  to the beach ',
        'Downsize/Upsize accommodation ',
        'Live in another country '
      ];
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
        'Schedule weekly regular time to clean study. Start by throwing out excess paperwork',
        'Schedule weekly time to order e-folders and delete emails ',
        'Ask friends to share their best organising ideas ',
        'Declutter first. Then buy shelving for stacking  ',
        'Schedule weekly cleaning time to ensure hygiene  ',
        'Give to charity/friends excess furniture /things ',
        'Employ a local gardener to get me going ',
        'Have more indoor plants. Have comfortable chair to chill and listen to music/read',
        'Invest in soft sheets, new pilllows and soft ligthing ',
        'Declutter excess furniture ',
        'Consult with a real estate ',
        'Research  work opportunities',
        'Choose suburb and get support from real estate',
        'Discuss with  real estate',
        'Research house swap website in chosen country'
      ];
    } else if (storeValues.oneSelectedAreaId == "8") {
      _physicalHSpecifySuggestions = [
        'Build up my energy levels ',
        'Excercise consistently to achieve optimum health',
        'I love my body with its strengths and flaws ',
        'Achieve and maintain ideal weight ',
        'I am fit energetic and full of life ',
        'Eliminate sugar from my diet ',
        'Have a healthy relationship with food',
        'Have a clean diet ',
        'Make healthy food choices ',
        'Choose food that fuels my body',
        'Sleep easily and naturally  ',
        'Work on a sleep routine ',
        'Build habits that improve sleep ',
        'Design a "couple" sleep routine  ',
        'Protect my sleep hygiene',
        'Nurture my spiritual life',
        'Nurture my intellectual life  ',
        'Nurture my emotional life ',
        'Nurture my physcial self ',
        'Nurture my social life'
      ];
      _physicalHAffirmationSuggestions = [
        'I  have a healthy mind body connection',
        'I invest in my lifeforce ',
        'I nurture my body as it is my lifeforce ',
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
        'Sleep restores our energy levels',
        'Sleep recalibrates my equilibrium',
        'The universe supports my dreams',
        'I love being  in the pursuit of learning.',
        'I speak with compassion, kindness, and love to myself and others.',
        'Exercise helps me to achieve optimum health',
        'I am surrounded by supportive people.'
      ];
      _physicalHGoalStepsSuggestions = [
        'Do a minimum of 10,000 steps daily ',
        'I nominate the following days ....and time ....to  excercise ',
        'I say my affirmation several  times a day ',
        'Design a workout schedule that is failproof ',
        'Schedule regular dental and medical appointments and excercise daily ',
        'Educate self about healthy substitutes for sugar ',
        'Plan what the weekly menu will be. Organise weekly shopping list. Shop purposefully',
        'Increase intake of whole foods - fruits, vegetables, lean proteins, whole grains and healthy fats',
        'Limit highly processed snack foods, sweets and other packaged foods.',
        'Significantly reduce intake of take away food',
        'Eat early. Avoid caffeine and alcohol before bedtime',
        'Practice relaxation. Keep body temperatrue comfortable',
        'Go to sleep at a regualr time. Skip naps where possible and get daily excercise',
        'Go to bed between 10 -11pm. Sleep 6- 8 hrs ',
        'Install block out blinds. Remove electronics from bedroom',
        'Practise morning and evening meditation',
        'Do a personal growth course',
        'Practise daily postive self talk. Identify 3 positive actions I took and high five myself ',
        'Commit to a weekly aerobic and cardiovascular exercise.',
        'Join a local/online community that come together to encourage, motivate and conquer goals together.',
      ];
    } else if (storeValues.oneSelectedAreaId == "9") {
      _romanceSpecifySuggestions = [
        'Understand my communciation style ',
        'Learn to listen without interrupting ',
        'Give clear concise feedback ',
        'Address differences respectfully ',
        'Simply communicate my ideas at work ',
        'Strenghten my identity and be my own person ',
        'Further grow together with my partner but also to grow independently as people.',
        'Communicate to your partner clearly about what you will and won’t do',
        'Find the right balance of independent and joint financial goals  ',
        'Find the right balance of personal freedom and commitment.',
        'Have an active and romantic life ',
        'As a couple define a healthy sex life ',
        'Improve low sex drive ',
        'Explore my sexuality ',
        'Explore playfulness  in the bedroom '
      ];
      _romanceAffirmationSuggestions = [
        'I am a unique individual',
        'I treat others respectfully as I would like to be treated',
        'I have the right to respectfully express my opinions ',
        'I am open minded  to explore new ideas.',
        'I am passionate about my work and that shows in everything I do',
        'I am a free person with a mind of my own ',
        'We are autonomous while feeling we can depend on each other.',
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
        'Do online short communication quiz o understand mine and others communication styles',
        'Give my undivided attention. Listen to what the other person is saying, instead of formulating my response.',
        'Do not refer to what the other person has to change but be  mindful and use the words: I would like to suggest...I would appreciate it if... and be specific with the solution.',
        'Monitor my tone and body language to ensure I present calm when sharing',
        'Improve my slides and flow chart designs for presentations',
        'Schedule time/activites with friends and  partner',
        'Set weekly date nights where individual goals and joint goals are nurtured',
        'Schedule tasks that have been agreed to and nominate clearly who will do what and when ',
        'Create a joint bank account to make payment for common bills/mortage and other agreed responsibilities and a personal accout to do as one wishes   ',
        'Articulate regularly what needs/expections/space is required by each to ensure a healthy parntership ',
        'Refurbish the bedroom so it has a relaxing and moody atmosphere for intimatacy   ',
        'Take turns in organise weekly romantic nights',
        'Visit GP for full physical assessment',
        'Organsie counselling to strenghten self acceptance ',
        'Buy a feather to tickle each other and laugh '
      ];
    } else if (storeValues.oneSelectedAreaId == "10") {
      _spiritualitySpecifySuggestions = [
        'Identify my meaningful life ',
        'Live in alignment with  my values',
        'Invest in my personal growth ',
        'Invest  in my career growth',
        'Be a change agent for others ',
        'Focus on personal areas of growth',
        'Design my ideal life   ',
        'Identify 5 must do goals for the year ',
        'Be in a job that I truly enjoy',
        'Be a change agent for self/others',
        'Support my souls journey',
        'Do as I say I will ',
        'Learn to speak lovingly to self',
        'Tune in to my real feelings ',
        'Make spirituality part of my daily existence'
      ];
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
        'As I succeed I can support others in their pursuits',
        'I listen to my souls whispers',
        'I honor my goals',
        'I love and respect myself',
        'I trust my intuition to guide my decisions',
        'I nurture my soul which is my lifeforce'
      ];
      _spiritualityGoalStepsSuggestions = [
        'Write a  1/3/10 yrs plan to achieve my goals ',
        'Create a list of what my values are',
        'Enrol in an online personal development course',
        'Support another person to implement their goal ',
        'Listen to podcasts on topic of growth.',
        'Assess my short, medium and long term goals',
        'Create a time line with action steps to achieving my goals  ',
        'Idenitfy the characteristics of my ideal career',
        'Link with friends to support each others goals',
        'Meditate 20 minutes morning and evening ',
        'Weekly goal review. Refine steps. Celebrate success',
        'Identify 5 positive daily actions you took ',
        'Go inwards. Name my feelings. Act in alignment',
        'Listen daily to talks that support my growth '
      ];
    } else {
      _testingSpecifySuggestions = ['Nothing found'];
      _testingAffirmationSuggestions = ["Nothing found"];
      _testingGoalStepsSuggestions = ["Nothing found"];
    }
  }
  bool AffirmationToSupportMindset= false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print("screen height  ===>>> $height");
    print("screen width  ===>>> $width");
    //
    _loadSharedData();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff344765),
        body: Builder(
          builder: (context) {
            return Consumer<StorageProvider>(
                builder: (context, storeValues, child) {
                    List<String> skillsQualitiesNeedDevelop = storeValues.skillsDeveloptWordList;
                  
                  //
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // for (var i = 0; i < skillsQualitiesNeedDevelop.length; i++) Text("• ${skillsQualitiesNeedDevelop[i]}"),
                    Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 90.h,
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 17.0, right: 18, top: 10.h, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      fit: FlexFit.loose,
                                      child: Text(
                                          "Active your $goalCategotyName goal",
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          overflow: TextOverflow.fade,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20.sp,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Image.asset(
                                "assets/images/MouCrop.png", // full image
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        //!========================================================>>> My goal=============================================
                        Positioned(
                          top: height < 365
                              ? 250.h // android 4.7 - 5.0
                                : height < 600
                                  ? 200.h // 5.0
                              : height < 670
                                  ? 210.h // iphone 6s
                                  : height < 685
                                      ? 220.h // 5.5
                                      
                                      : height < 825
                                          ? 175.h // poco M3
    
                                          : height < 490
                                              ? 180.h
                                              : height < 1110 //moto g 52
                                                  ? 190.h
                                                  : 240.h,
                          right: 60.w,
  
                           child:   Text(
                                "My Goal",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.sp,
                                ),
                              ),
                        ),
                              Positioned(
                                top: height < 365
                                    ? 245.h // android 4.7 - 5.0
                                     : height < 600
                                      ? 200.h // 5.0
    
                                    : height < 670 // iphone 6s 4.7
    
                                        ? 230.h
                                        : height < 685
                                            ? 240.h
                                            : height < 825 // poco m3
                                                ? 190.h
                                                : 250.h,
                                left: width < 810 ? 180.w : 250.w,
                                child: SizedBox(
                                  // color: Colors.green,
                                  height: 60.h,
                                  width: 105.w,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          // "82KG", 
                                          myMainGoal,
                                          textAlign: TextAlign.end,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 7.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
    
                        
                        //!========================================================>>>5th goal house=============================================
    
                        // ===>>> 5th goal house
                        if (fifthGoal.isEmpty)
                          Visibility(
                            visible: isvisible,
                            //===>> 5th rectangular
                            child: Positioned(
                              top: height < 365
                                  ? 360.h // screen 4.7
                                  : height < 600
                                      ? 320.h // 5.0
                                  : height < 670 //
                                      ? 330.h
                                      : height < 825 // poco m3
                                          ? 270.h // iphone 6s 4.7
    
                                          : height < 485
                                              ? 270.h
                                              : height < 1110
                                                  ? 285.h
                                                  : 340.h,
                              left: 295.w,
                              child: const RectAngleBox(),
                            ),
                          ),
                        Positioned(
                          top: height < 365
                              ? 360.h // screen 4.7
                              : height < 600
                                      ? 320.h // 5.0
                              : height < 670 // iphone 6s 4.7
                                  ? 330.h
                                  : height < 825
                                      ? 270.h // POCO M3
                                      : height < 485 // 480 <485
                                          ? 290.h // newscrenn height
    
                                          : height < 1110
                                              ? 285.h
                                              : 260.h, // by defulat
    
                          left: 285.w,
                          child: SizedBox(
                            height: 60.h,
                            width: 270.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                     //"5th",
                                    fifthGoal,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
    
    //!========================================================>>>  4th goal house=============================================
                        //===>>> 4th goal house
                        if (fourthGoal.isEmpty)
                          Visibility(
                            visible: isvisible,
                            //===>> 2nd rectangular
                            child: Positioned(
                              top: height < 365
                                  ? 440.h // screen 4.7
                                  : height < 600
                                      ? 400.h // 5.0
                                  : height < 670 // iphone 6s 4.7
                                      ? 405.h
                                      : height < 825
                                          ? 335.h // poco m3
    
                                          : height < 490
                                              ? 330.h
                                              : height < 1110
                                                  ? 345.h
                                                  : 400.h,
                              left: 228.w,
                              child: const RectAngleBox(),
                            ),
                          ),
                        Positioned(
                          top: height < 365
                              ? 440.h // screen 4.7
                              : height < 600
                                      ? 400.h // 5.0
                              : height < 670 // iphone 6s 4.7
                                  ? 405.h
                                  : height < 825
                                      ? 335.h // poco m3
    
                                      : height < 490
                                          ? 360.h
                                          : height < 1110
                                              ? 345.h
                                              : 400.h,
                          left: 228.w,
                          child: SizedBox(
                            height: 60.h,
                            width: 120.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    // "4th" +
                                    fourthGoal,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 7.sp),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
    
                        //!========================================================>>> 3rd gola house=============================================
                        // ===>>> 3rd gola house
                        if (thirdGoal.isEmpty)
                          Visibility(
                            visible: isvisible,
                            child: Positioned(
                              top: height < 365
                                  ? 515.h // screen 4.7
                                  : height < 670 // iphone 6s 4.7
                                      ? 475.h
                                      : height < 825
                                          ? 390.h // poco m3
    
                                          : height < 490
                                              ? 387.h
                                              : height < 1110
                                                  ? 400.h
                                                  : 460.h,
                              left: 160.w,
                              child: const RectAngleBox(),
                            ),
                          ),
                        Positioned(
                          top: height < 365
                              ? 515.h // screen 4.7 - 5.0
                              : height < 670 // ihone 6s 4.7
                                  ? 475.h
                                  : height < 825
                                      ? 390.h // POCO M3
                                      : height < 490
                                          ? 410.h
                                          : height < 490
                                              ? 410.h
                                              : height < 1110
                                                  ? 400.h
                                                  : 460.h,
                          left: 160.w,
                          child: SizedBox(
                            height: 60.h,
                            width: 170.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    //"3rd" +
                                    thirdGoal,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 7.sp),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
    
                        //!========================================================>>> 2nd goal house=============================================
                        //===>>> 2nd goal house
                        if (secondGoal.isEmpty)
                          Visibility(
                            visible: isvisible,
                            child: Positioned(
                              top: height < 365
                                  ? 590.h // screen 4.7
                                  : height < 670 // ihone 6s 4.7
                                      ? 540.h
                                      : height < 825
                                          ? 445.h // poco m3
    
                                          : height < 490
                                              ? 439.h
                                              : height < 1110
                                                  ? 455.h
                                                  : 530.h,
                              left: 105.w,
                              child: const RectAngleBox(),
                            ),
                          ),
                        Positioned(
                          top: height < 365
                              ? 590.h // screen 4.7
                              : height < 670 // iphone 6s 4.7
                                  ? 540.h
                                  : height < 825
                                      ? 445.h // poco m3
    
                                      : height < 490
                                          ? 469.h
                                          : height < 1110
                                              ? 455.h
                                              : 530.h,
                          left: 105.w,
                          child: SizedBox(
                            height: 60.h,
                            width: 170.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    //"2nd" +
                                    secondGoal,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 7.sp),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
    
                        //  background
                        //!========================================================>>> 1st goal house=============================================
                        //===>>>  1st goal house
                        if (firstGoal.isEmpty)
                          Visibility(
                            visible: isvisible,
                            child: Positioned(
                              top: height < 365
                                  ? 660.h // screen 4.7
                                  : height < 600
                                      ? 610.h // 5.0
                                  : height < 670 // iphone 6s 4.7
                                      ? 600.h
                                      : height < 810
                                          ? 520.h // poco m3
    
                                          : height < 490
                                              ? 525.h
                                              : height < 1110
                                                  ? 500.h
                                                  : 680.h,
                              left: 30.w,
                              child: Text(
                                "start",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10.sp),
                              ),
                            ),
                          ),
                        Positioned(
                          top: height < 365
                              ? 660.h // screen 4.7
                              : height < 670 // iphone 6s 4.7
                                  ? 600.h
                                  : height < 810
                                      ? 520.h // poco m3
    
                                      : height < 490
                                          ? 525.h
                                          : height < 1110
                                              ? 505.h
                                              : 680.h,
                          left: 30.w,
                          child: SizedBox(
                            //color: Colors.green,
                            height: 70.h,
                            width: 320.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Text(
                                   // "1st",
                                    firstGoal,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 7.sp),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //
                      ],
                    ),
                    //===>>> Different text if Main goal is  empty
                    if (myMainGoal.isEmpty)
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CustomRichText(
                              titleText: 'Specify ',
                              description: 'in great detail what your goal is...',
                            ),
                          ),
                        
                          storeValues.oneSelectedAreaId == "1"
                              ? _buildTextFieldWithSuggessions(
                                  _careerSpecifySuggestions??[''])
                              : storeValues.oneSelectedAreaId == "2"
                                  ? _buildTextFieldWithSuggessions(
                                      _emotionalSpecifySuggestions!)
                                  : storeValues.oneSelectedAreaId == "3"
                                      ? _buildTextFieldWithSuggessions(
                                          _familySpecifySuggestions!)
                                      : storeValues.oneSelectedAreaId == "4"
                                          ? _buildTextFieldWithSuggessions(
                                              _financesSpecifySuggestions!)
                                          : storeValues.oneSelectedAreaId == "5"
                                              ? _buildTextFieldWithSuggessions(
                                                  _friendsSpecifySuggestions!)
                                              : storeValues.oneSelectedAreaId ==
                                                      "6"
                                                  ? _buildTextFieldWithSuggessions(
                                                      _hobbiesSpecifySuggestions!)
                                                  : storeValues
                                                              .oneSelectedAreaId ==
                                                          "7"
                                                      ? _buildTextFieldWithSuggessions(
                                                          _livingSpecifySuggestions!)
                                                      : storeValues
                                                                  .oneSelectedAreaId ==
                                                              "8"
                                                          ? _buildTextFieldWithSuggessions(
                                                              _physicalHSpecifySuggestions!)
                                                          : storeValues
                                                                      .oneSelectedAreaId ==
                                                                  "9"
                                                              ? _buildTextFieldWithSuggessions(
                                                                  _romanceSpecifySuggestions!)
                                                              : storeValues
                                                                          .oneSelectedAreaId ==
                                                                      "10"
                                                                  ? _buildTextFieldWithSuggessions(
                                                                      _spiritualitySpecifySuggestions!)
                                                                  : _buildTextFieldWithSuggessions(
                                                                      _testingSpecifySuggestions!)
                        ],
                      ),
                    
                    //!====
                        if (skillsQualitiesNeedDevelop.isNotEmpty && myMainGoal.isNotEmpty)
                          Visibility(
                            visible: !AffirmationToSupportMindset,
                            child: Column(
                              children: [
                                 Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CustomRichText(
                                    titleText: 'Mindset : ',
                                    description:
                                        'I will develop the following skills for my $goalCategotyName', // "Active your $goalCategotyName goal",
                                  ),
                                ),
                              
                                Container(
                              height: 40.h,
                              width: double.infinity,
                                    decoration: BoxDecoration(
                                      // border: Border.all(
                                      //   color: Colors.white,
                                      // ), // ===>>> input text
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    margin: EdgeInsets.all(13.sp),
                                    child:
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(children: [
                                         for (var i = 0; i < skillsQualitiesNeedDevelop.length; i++) Container(
                                           decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("${skillsQualitiesNeedDevelop[i]}"),
                                          )),
                                      ],),
                                    )
                              ),
                          
                          
                             Padding(
                               padding: const EdgeInsets.symmetric(horizontal:8.0),
                               child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                 children: [
                                   TextButton(
                                    onPressed: (){
                                      setState(() {
                                        AffirmationToSupportMindset =true;
                                      });
                                    },
                                                      style: TextButton.styleFrom(
                                                        minimumSize: Size.zero,
                                                        padding: EdgeInsets.only(right: 17.w, bottom: 17.h),
                                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                      ), child: Text( "Continue",
                                  style: TextStyles.smallWhiteBoldTextStyle(context),),
                                      ),
                                 ],
                               ),
                             )
                              ],
                            ),
                          ),

//!====
                    
                    //===>>> Different text if Main goal is  empty
                    if (mindSet.isEmpty && myMainGoal.isNotEmpty )
                      Visibility(
                        visible: AffirmationToSupportMindset,
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CustomRichText(
                                titleText: 'Mindset ',
                                description:
                                    'A daily affirmation to protect the goal to help you stay on track.',
                              ),
                            ),
                            // storeValues.oneSelectedAreaId == "1"
                            //     ? _buildTextFieldWithSuggessions(
                            //         _careerAffirmationSuggestions!)
                            //     : _storeValues.oneSelectedAreaId == "2"
                            //         ? _buildTextFieldWithSuggessions(
                            //             _emotionalAffirmationSuggestions!)
                            //         : _buildTextFieldWithSuggessions(
                            //             _testingAffirmationSuggestions!),
                            storeValues.oneSelectedAreaId == "1"
                                ? _buildTextFieldWithSuggessions(
                                    _careerAffirmationSuggestions!)
                                : storeValues.oneSelectedAreaId == "2"
                                    ? _buildTextFieldWithSuggessions(
                                        _emotionalAffirmationSuggestions!)
                                    : storeValues.oneSelectedAreaId == "3"
                                        ? _buildTextFieldWithSuggessions(
                                            _familyAffirmationSuggestions!)
                                        : storeValues.oneSelectedAreaId == "4"
                                            ? _buildTextFieldWithSuggessions(
                                                _financesAffirmationSuggestions!)
                                            : storeValues.oneSelectedAreaId == "5"
                                                ? _buildTextFieldWithSuggessions(
                                                    _friendsAffirmationSuggestions!)
                                                : storeValues.oneSelectedAreaId ==
                                                        "6"
                                                    ? _buildTextFieldWithSuggessions(
                                                        _hobbiesAffirmationSuggestions!)
                                                    : storeValues
                                                                .oneSelectedAreaId ==
                                                            "7"
                                                        ? _buildTextFieldWithSuggessions(
                                                            _livingsAffirmationSuggestions!)
                                                        : storeValues
                                                                    .oneSelectedAreaId ==
                                                                "8"
                                                            ? _buildTextFieldWithSuggessions(
                                                                _physicalHAffirmationSuggestions!)
                                                            : storeValues
                                                                        .oneSelectedAreaId ==
                                                                    "9"
                                                                ? _buildTextFieldWithSuggessions(
                                                                    _romanceAffirmationSuggestions!)
                                                                : storeValues
                                                                            .oneSelectedAreaId ==
                                                                        "10"
                                                                    ? _buildTextFieldWithSuggessions(
                                                                        _spiritualityAffirmationSuggestions!)
                                                                    : _buildTextFieldWithSuggessions(
                                                                        _testingAffirmationSuggestions!)
                          ],
                        ),
                      ),
                    //===>>> Different text if Main goal is  empty
                    if (assurance.isEmpty && mindSet.isNotEmpty)
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CustomRichText(
                              titleText: 'Assurance ',
                              description:
                                  'This is the promise I will make to myself to achieve my goal.',
                            ),
                          ),
                          _buildEmptyTextField(), //!no suggestion text box
                        ],
                      ),
                    if (firstGoal.isEmpty && assurance.isNotEmpty)
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CustomRichText(
                              titleText: 'Realistic ',
                              description:
                                  'What is the first step you will adopt to achieve your goal.',
                            ),
                          ),
                          // _storeValues.oneSelectedAreaId == "1"
                          //     ? _buildTextFieldWithSuggessions(
                          //         _careerGoalStepsSuggestions!)
                          //     : _storeValues.oneSelectedAreaId == "2"
                          //         ? _buildTextFieldWithSuggessions(
                          //             _emotionalGoalStepsSuggestions!)
                          //         : _buildTextFieldWithSuggessions(
                          //             _testingGoalStepsSuggestions!),
                          storeValues.oneSelectedAreaId == "1"
                              ? _buildTextFieldWithSuggessions(
                                  _careerGoalStepsSuggestions!)
                              : storeValues.oneSelectedAreaId == "2"
                                  ? _buildTextFieldWithSuggessions(
                                      _emotionalGoalStepsSuggestions!)
                                  : storeValues.oneSelectedAreaId == "3"
                                      ? _buildTextFieldWithSuggessions(
                                          _familyGoalStepsSuggestions!)
                                      : storeValues.oneSelectedAreaId == "4"
                                          ? _buildTextFieldWithSuggessions(
                                              _financesGoalStepsSuggestions!)
                                          : storeValues.oneSelectedAreaId == "5"
                                              ? _buildTextFieldWithSuggessions(
                                                  _friendsGoalStepsSuggestions!)
                                              : storeValues.oneSelectedAreaId ==
                                                      "6"
                                                  ? _buildTextFieldWithSuggessions(
                                                      _hobbiesGoalStepsSuggestions!)
                                                  : storeValues
                                                              .oneSelectedAreaId ==
                                                          "7"
                                                      ? _buildTextFieldWithSuggessions(
                                                          _livingGoalStepsSuggestions!)
                                                      : storeValues
                                                                  .oneSelectedAreaId ==
                                                              "8"
                                                          ? _buildTextFieldWithSuggessions(
                                                              _physicalHGoalStepsSuggestions!)
                                                          : storeValues
                                                                      .oneSelectedAreaId ==
                                                                  "9"
                                                              ? _buildTextFieldWithSuggessions(
                                                                  _romanceGoalStepsSuggestions!)
                                                              : storeValues
                                                                          .oneSelectedAreaId ==
                                                                      "10"
                                                                  ? _buildTextFieldWithSuggessions(
                                                                      _spiritualityGoalStepsSuggestions!)
                                                                  : _buildTextFieldWithSuggessions(
                                                                      _testingGoalStepsSuggestions!)
                        ],
                      ),
                    if (secondGoal.isEmpty && firstGoal.isNotEmpty)
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CustomRichText(
                              titleText: 'Realistic ',
                              description:
                                  'What is the next step you will adopt to achieve your goal.',
                            ),
                          ),
                          // _storeValues.oneSelectedAreaId == "1"
                          //     ? _buildTextFieldWithSuggessions(
                          //         _careerGoalStepsSuggestions!)
                          //     : _storeValues.oneSelectedAreaId == "2"
                          //         ? _buildTextFieldWithSuggessions(
                          //             _emotionalGoalStepsSuggestions!)
                          //         : _buildTextFieldWithSuggessions(
                          //             _testingGoalStepsSuggestions!),
                          storeValues.oneSelectedAreaId == "1"
                              ? _buildTextFieldWithSuggessions(
                                  _careerGoalStepsSuggestions!)
                              : storeValues.oneSelectedAreaId == "2"
                                  ? _buildTextFieldWithSuggessions(
                                      _emotionalGoalStepsSuggestions!)
                                  : storeValues.oneSelectedAreaId == "3"
                                      ? _buildTextFieldWithSuggessions(
                                          _familyGoalStepsSuggestions!)
                                      : storeValues.oneSelectedAreaId == "4"
                                          ? _buildTextFieldWithSuggessions(
                                              _financesGoalStepsSuggestions!)
                                          : storeValues.oneSelectedAreaId == "5"
                                              ? _buildTextFieldWithSuggessions(
                                                  _friendsGoalStepsSuggestions!)
                                              : storeValues.oneSelectedAreaId ==
                                                      "6"
                                                  ? _buildTextFieldWithSuggessions(
                                                      _hobbiesGoalStepsSuggestions!)
                                                  : storeValues
                                                              .oneSelectedAreaId ==
                                                          "7"
                                                      ? _buildTextFieldWithSuggessions(
                                                          _livingGoalStepsSuggestions!)
                                                      : storeValues
                                                                  .oneSelectedAreaId ==
                                                              "8"
                                                          ? _buildTextFieldWithSuggessions(
                                                              _physicalHGoalStepsSuggestions!)
                                                          : storeValues
                                                                      .oneSelectedAreaId ==
                                                                  "9"
                                                              ? _buildTextFieldWithSuggessions(
                                                                  _romanceGoalStepsSuggestions!)
                                                              : storeValues
                                                                          .oneSelectedAreaId ==
                                                                      "10"
                                                                  ? _buildTextFieldWithSuggessions(
                                                                      _spiritualityGoalStepsSuggestions!)
                                                                  : _buildTextFieldWithSuggessions(
                                                                      _testingGoalStepsSuggestions!)
                        ],
                      ),
                    //============================= Text_Form_Field container
                    if (thirdGoal.isEmpty && secondGoal.isNotEmpty)
                      storeValues.oneSelectedAreaId == "1"
                          ? _buildTextFieldWithSuggessions(
                              _careerGoalStepsSuggestions!)
                          : storeValues.oneSelectedAreaId == "2"
                              ? _buildTextFieldWithSuggessions(
                                  _emotionalGoalStepsSuggestions!)
                              : storeValues.oneSelectedAreaId == "3"
                                  ? _buildTextFieldWithSuggessions(
                                      _familyGoalStepsSuggestions!)
                                  : storeValues.oneSelectedAreaId == "4"
                                      ? _buildTextFieldWithSuggessions(
                                          _financesGoalStepsSuggestions!)
                                      : storeValues.oneSelectedAreaId == "5"
                                          ? _buildTextFieldWithSuggessions(
                                              _friendsGoalStepsSuggestions!)
                                          : storeValues.oneSelectedAreaId == "6"
                                              ? _buildTextFieldWithSuggessions(
                                                  _hobbiesGoalStepsSuggestions!)
                                              : storeValues.oneSelectedAreaId ==
                                                      "7"
                                                  ? _buildTextFieldWithSuggessions(
                                                      _livingGoalStepsSuggestions!)
                                                  : storeValues
                                                              .oneSelectedAreaId ==
                                                          "8"
                                                      ? _buildTextFieldWithSuggessions(
                                                          _physicalHGoalStepsSuggestions!)
                                                      : storeValues
                                                                  .oneSelectedAreaId ==
                                                              "9"
                                                          ? _buildTextFieldWithSuggessions(
                                                              _romanceGoalStepsSuggestions!)
                                                          : storeValues
                                                                      .oneSelectedAreaId ==
                                                                  "10"
                                                              ? _buildTextFieldWithSuggessions(
                                                                  _spiritualityGoalStepsSuggestions!)
                                                              : _buildTextFieldWithSuggessions(
                                                                  _testingGoalStepsSuggestions!),
                    if (fourthGoal.isEmpty && thirdGoal.isNotEmpty)
                      storeValues.oneSelectedAreaId == "1"
                          ? _buildTextFieldWithSuggessions(
                              _careerGoalStepsSuggestions!)
                          : storeValues.oneSelectedAreaId == "2"
                              ? _buildTextFieldWithSuggessions(
                                  _emotionalGoalStepsSuggestions!)
                              : storeValues.oneSelectedAreaId == "3"
                                  ? _buildTextFieldWithSuggessions(
                                      _familyGoalStepsSuggestions!)
                                  : storeValues.oneSelectedAreaId == "4"
                                      ? _buildTextFieldWithSuggessions(
                                          _financesGoalStepsSuggestions!)
                                      : storeValues.oneSelectedAreaId == "5"
                                          ? _buildTextFieldWithSuggessions(
                                              _friendsGoalStepsSuggestions!)
                                          : storeValues.oneSelectedAreaId == "6"
                                              ? _buildTextFieldWithSuggessions(
                                                  _hobbiesGoalStepsSuggestions!)
                                              : storeValues.oneSelectedAreaId ==
                                                      "7"
                                                  ? _buildTextFieldWithSuggessions(
                                                      _livingGoalStepsSuggestions!)
                                                  : storeValues
                                                              .oneSelectedAreaId ==
                                                          "8"
                                                      ? _buildTextFieldWithSuggessions(
                                                          _physicalHGoalStepsSuggestions!)
                                                      : storeValues
                                                                  .oneSelectedAreaId ==
                                                              "9"
                                                          ? _buildTextFieldWithSuggessions(
                                                              _romanceGoalStepsSuggestions!)
                                                          : storeValues
                                                                      .oneSelectedAreaId ==
                                                                  "10"
                                                              ? _buildTextFieldWithSuggessions(
                                                                  _spiritualityGoalStepsSuggestions!)
                                                              : _buildTextFieldWithSuggessions(
                                                                  _testingGoalStepsSuggestions!),
                    if (fifthGoal.isEmpty && fourthGoal.isNotEmpty)
                      storeValues.oneSelectedAreaId == "1"
                          ? _buildTextFieldWithSuggessions(
                              _careerGoalStepsSuggestions!)
                          : storeValues.oneSelectedAreaId == "2"
                              ? _buildTextFieldWithSuggessions(
                                  _emotionalGoalStepsSuggestions!)
                              : storeValues.oneSelectedAreaId == "3"
                                  ? _buildTextFieldWithSuggessions(
                                      _familyGoalStepsSuggestions!)
                                  : storeValues.oneSelectedAreaId == "4"
                                      ? _buildTextFieldWithSuggessions(
                                          _financesGoalStepsSuggestions!)
                                      : storeValues.oneSelectedAreaId == "5"
                                          ? _buildTextFieldWithSuggessions(
                                              _friendsGoalStepsSuggestions!)
                                          : storeValues.oneSelectedAreaId == "6"
                                              ? _buildTextFieldWithSuggessions(
                                                  _hobbiesGoalStepsSuggestions!)
                                              : storeValues.oneSelectedAreaId ==
                                                      "7"
                                                  ? _buildTextFieldWithSuggessions(
                                                      _livingGoalStepsSuggestions!)
                                                  : storeValues
                                                              .oneSelectedAreaId ==
                                                          "8"
                                                      ? _buildTextFieldWithSuggessions(
                                                          _physicalHGoalStepsSuggestions!)
                                                      : storeValues
                                                                  .oneSelectedAreaId ==
                                                              "9"
                                                          ? _buildTextFieldWithSuggessions(
                                                              _romanceGoalStepsSuggestions!)
                                                          : storeValues
                                                                      .oneSelectedAreaId ==
                                                                  "10"
                                                              ? _buildTextFieldWithSuggessions(
                                                                  _spiritualityGoalStepsSuggestions!)
                                                              : _buildTextFieldWithSuggessions(
                                                                  _testingGoalStepsSuggestions!),
                     Visibility(
                        visible: myMainGoal.isEmpty?true: AffirmationToSupportMindset,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.only(right: 17.w, bottom: 17.h),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          setState(() {
                            if (myMainGoal.isEmpty) {
                              myMainGoal = commonGoalControler.text;
                              storeValues.changeMainGoal(myMainGoal);
                            } else if (mindSet.isEmpty && myMainGoal.isNotEmpty) {
                              mindSet = commonGoalControler.text;
                              storeValues.changeMindsetl(mindSet);
                            } else if (assurance.isEmpty && mindSet.isNotEmpty) {
                              assurance = commonGoalControler.text;
                              storeValues.changeAssurance(assurance);
                            } else if (firstGoal.isEmpty && assurance.isNotEmpty) {
                              firstGoal = commonGoalControler.text;
                              storeValues.changeFirstGoal(firstGoal);
                            } else if (secondGoal.isEmpty && firstGoal.isNotEmpty) {
                              secondGoal = commonGoalControler.text;
                              storeValues.changeSecondGoal(secondGoal);
                            } else if (thirdGoal.isEmpty && secondGoal.isNotEmpty) {
                              thirdGoal = commonGoalControler.text;
                              storeValues.changeThirdGoal(thirdGoal);
                            } else if (fourthGoal.isEmpty && thirdGoal.isNotEmpty) {
                              fourthGoal = commonGoalControler.text;
                              storeValues.changeFourthGoal(fourthGoal);
                            } else if (fifthGoal.isEmpty && fourthGoal.isNotEmpty) {
                              setState(() {
                                fifthGoal = commonGoalControler.text;
                                storeValues.changeFifthGoal(fifthGoal);
                                goPageWithName(context, TrackYourGoal.id);
                                print("button ready to work");
                              });
                            }
                            commonGoalControler.clear();
                          });
                        },
                        child: SizedBox(
                          height: 40.h,
                          child: Column(
                            children: [
                              if (myMainGoal.isEmpty)
                                Text(
                                  "Continue",
                                  style: TextStyles.smallWhiteBoldTextStyle(context),
                                ),
                              if (mindSet.isEmpty && myMainGoal.isNotEmpty)
                                Text(
                                  "Continue",
                                  style: TextStyles.smallWhiteBoldTextStyle(context),
                                ),
                              if (assurance.isEmpty && mindSet.isNotEmpty)
                                Text(
                                  "Continue",
                                  style: TextStyles.smallWhiteBoldTextStyle(context),
                                ),
                              if (firstGoal.isEmpty && assurance.isNotEmpty)
                                Text(
                                  "Add New Step",
                                  style: TextStyles.smallWhiteBoldTextStyle(context),
                                ),
                              if (secondGoal.isEmpty && firstGoal.isNotEmpty)
                                Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Add New Step",
                                      style: TextStyles.smallWhiteBoldTextStyle(context),
                                    ),
                                    SizedBox(width: 10.h),
                                    InkWell(
                                      onTap: (){
                                        goPage(context, const TrackYourGoal());
                                      },
                                      child: Text(
                                        "Submit",
                                        style: TextStyles.smallWhiteBoldTextStyle(context),
                                      ),
                                    ),
                                  ],
                                ),
                              if (thirdGoal.isEmpty && secondGoal.isNotEmpty)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [                           
                                    Text(
                                      "Add New Step",
                                      style: TextStyles.smallWhiteBoldTextStyle(context),
                                    ),
                                    SizedBox(width: 10.h),
                                    InkWell(
                                    onTap: (){
                                     goPage(context, const TrackYourGoal());
                                    },
                                      child: Text(
                                        "Submit",
                                        style: TextStyles.smallWhiteBoldTextStyle(context),
                                      ),
                                    ),
                                  ],
                                ),
                              if (fourthGoal.isEmpty && thirdGoal.isNotEmpty)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [                              
                                    Text(
                                      "Add New Step",
                                      style: TextStyles.smallWhiteBoldTextStyle(
                                          context),
                                    ),
                                    const SizedBox(width: 10),
                                     InkWell(
                                      onTap: () {
                                        setState(() {
                                          goPage(context, const TrackYourGoal());
                                        });
                                      },
                                      child: Text(
                                        "Submit",
                                        style: TextStyles.smallGoldBoldTextStyle(
                                            context),
                                      ),
                                    ),
                                  ],
                                ),
                              if (fifthGoal.isEmpty && fourthGoal.isNotEmpty)
                                Text(
                                  "Submit",
                                  style: TextStyles.smallGoldBoldTextStyle(context),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
          },
        ),
      ),
    );
  }

  Widget _buildTextFieldWithSuggessions(List<String> textList) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ), // ===>>> input text
        borderRadius: BorderRadius.circular(4),
      ),
      margin: EdgeInsets.all(13.sp),
      child:

        //!######################
        TypeAheadFormField(
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
          commonGoalControler.text = val;
        },
        getImmediateSuggestions: true,
        hideSuggestionsOnKeyboardHide: true,
        hideOnEmpty: true,
        textFieldConfiguration: TextFieldConfiguration(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            suffixIcon: commonGoalControler.text.isEmpty 
            ? IconButton(
                icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                //onPressed: () => commonGoalControler.clear()
                onPressed: (){
                  //
                },
                ) 
            : IconButton(
                icon: const Icon( Icons.close, color: Colors.white),
                onPressed: () => commonGoalControler.clear()
                ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.h, vertical: 15.w),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: 'Choose a option or write your own',
            hintStyle: const TextStyle(color: Colors.grey),
          ),
          controller: commonGoalControler,
        ),
      ),
      //! ####################
    );
  }

  //! empty text box
  Widget _buildEmptyTextField() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ), // ===>>> input text
        borderRadius: BorderRadius.circular(4),
      ),
      margin: EdgeInsets.all(13.sp),
      child: TextFormField(
        controller: commonGoalControler,
        style: const TextStyle(color: Colors.white),
        keyboardType: TextInputType.multiline,
        maxLines: 2,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.h, vertical: 15.w),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: 'Write your own',
          hintStyle: const TextStyle(color: Colors.grey),
          // hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
          // prefixIcon: Icon(Icons.home, height: 13.0),
          // suffix: const Icon(
          //   Icons.keyboard_control,
          //   color: Colors.white,
          // ),
        ),
      ),
      //!############################################################
    );
  }
}
