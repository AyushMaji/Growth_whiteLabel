
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get_it/get_it.dart';
import 'package:olga/models/api_model/api_model.dart';
import 'package:olga/screens/notification/notification_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'global/constants/app_constants.dart';

final getIt = GetIt.instance;

Future<void> init(SharedPreferences prefs) async {
  
  Stripe.publishableKey = "pk_test_51IcQKWDwwlfx8vZDDYDvon6kLMHr73WDNy7scAOdog8OkuImjcR2c5Nt0JaRnsgagTqqP6H2Z7QaknvjwWz6CzgF00J6Q8MifR";
  Stripe.instance.applySettings();

  ApiModel.updateHeader(pref: prefs);

  // ===============|>>> NOTIFICATION SETTINGS <<<|=============== //
  NotificationController(prefs: prefs);

 

  // External
  getIt.registerLazySingleton(() => prefs);

  if (prefs.containsKey(AppConstants.token)){

  

  }

  

}

