import 'package:a_m_social_app/data_base/shared_data.dart';
import 'package:a_m_social_app/design_start/social_home.dart';
import 'package:a_m_social_app/design_start/social_login.dart';
import 'package:a_m_social_app/networking/social_cubit.dart';
import 'package:a_m_social_app/networking/social_states.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedData.sharedDefinition();
  String savedUser = SharedData.getData('uID');
  var token = await FirebaseMessaging.instance.getToken();
  print('token is $token aaa');
// foreground fcm
  FirebaseMessaging.onMessage.listen((event) {
    print('on message');
    print(event.data.toString());
  });

  // when click on notification to open app
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print('on message opened app');
    print(event.data.toString());
  });

  // background fcm
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  runApp(MyApp(savedUser));
}

class MyApp extends StatelessWidget {
  String whichWidget;
  MyApp(this.whichWidget);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        if (whichWidget != null) {
          return SocialCubit()
            ..cubitGetPosts()
            ..cubitGetAllUsers()
            //..cubitGetAllLikes()
            // ..cubitGetLikedPosts()
            ..cubitGetData();
        } else
          return SocialCubit();
      },
      child: BlocConsumer<SocialCubit, SocialStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          return MaterialApp(
            home: whichWidget != null ? ScreenHome() : ScreenLogin(),
          );
        },
      ),
    );
  }
}
