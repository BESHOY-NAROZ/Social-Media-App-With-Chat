import 'dart:io';

import 'package:a_m_social_app/data_base/shared_data.dart';
import 'package:a_m_social_app/design_end/screen_chats.dart';
import 'package:a_m_social_app/design_end/screen_feeds.dart';
import 'package:a_m_social_app/design_end/screen_posts.dart';
import 'package:a_m_social_app/design_end/screen_settings.dart';
import 'package:a_m_social_app/design_end/screen_users.dart';
import 'package:a_m_social_app/models/like_comment_model.dart';
import 'package:a_m_social_app/models/messages_model.dart';
import 'package:a_m_social_app/models/post_model.dart';
import 'package:a_m_social_app/models/social_model.dart';
import 'package:a_m_social_app/networking/social_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit getShopCubit(context) => BlocProvider.of(context);

  SocialModel socialModel;
  SocialModel socialModel2;
  cubitLogin({
    String email,
    String name,
    String phone,
    String password,
    String bio,
    String image,
    String cover,
  }) {
    // el method dy bt login by username and password
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      SharedData.putData('uID', value.user.uid).then((value) {
        cubitGetData();
      });
      emit(SocialCompleteLoginState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialErrorLoginState(error));
    });
  }

  cubitGetData() async {
    String userID = SharedData.getData('uID');
    /* el method dy bt access FireStore tgeb mnha el data
       y3ny btd5ol gowa el collection b3d kda el doc (elly ehna bn3mlo b el userID)*/
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();
    socialModel2 = SocialModel.fromJson(snapshot.data());
    print('snapshot data is ${snapshot.data()}');
    emit(SocialCompleteGetDataState());
  }

  cubitRegister({
    String email,
    String name,
    String phone,
    String password,
    String bio,
    String image,
    String cover,
  }) {
    // el method dy bt3ml create b el userName and Password f el FirebaseAuth
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      socialModel = SocialModel(
          email: email,
          name: name,
          phone: phone,
          image:
              'https://image.freepik.com/free-photo/full-shot-happy-family-outside_23-2149049169.jpg',
          bio: 'beshoo bio',
          cover:
              'https://img.freepik.com/free-photo/house-isolated-field_1303-23773.jpg?size=626&ext=jpg',
          uID: value.user.uid);
      // el method dy bt3ml create ll byanat (name w phone e email...) f el FireStore
      FirebaseFirestore.instance
          .collection('users')
          .doc(value.user.uid)
          .set(socialModel.toMap())
          .then((value) {
        emit(SocialCompleteInstanceState());
      }).catchError((error) {
        emit(SocialErrorRegisterState(error));
      });
      emit(SocialCompleteRegisterState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialErrorRegisterState(error));
    });
  }

  cubitUploadImage() {
    // ro7 ll FirebaseStorage create storage w sgl feh el path bta3 el sora (a5r gz2 f link el sora)
    FirebaseStorage.instance
        .ref()
        .child('data/${Uri.file(imageFile.path).pathSegments.last}')
        .putFile(imageFile)
        .then((value) {
      emit(SocialCompleteUploadImagesState());
      value.ref.getDownloadURL().then((value) {
        //value de el hya el path bta3 el sora f el FirebaseStorage
        print(value);
        cubitUpdateUserData({'image': value});
      }).catchError((error) {
        print(error.toString());
        emit(SocialErrorUploadImagesState());
      });
    });
  }

  cubitUploadCover() {
    // ro7 ll FirebaseStorage create storage w sgl feh el path bta3 el sora (a5r gz2 f link el sora)
    FirebaseStorage.instance
        .ref()
        .child('data/${Uri.file(coverFile.path).pathSegments.last}')
        .putFile(coverFile)
        .then((value) {
      emit(SocialCompleteUploadCoversState());
      value.ref.getDownloadURL().then((value) {
        //value de el hya el path bta3 el sora f el FirebaseStorage
        print(value);
        cubitUpdateUserData({'cover': value});
      }).catchError((error) {
        print(error.toString());
        emit(SocialErrorUploadCoverState());
      });
    });
  }

  cubitUpdateBasicData({
    String name,
    String bio,
    String phone,
  }) {
    cubitUpdateUserData({
      'name': name,
      'bio': bio,
      'phone': phone,
    });
  }

  cubitUpdateUserData(Map<String, dynamic> map) {
    String userID = SharedData.getData('uID');
    // el method dy bt3dl el data f el  FireStore
    FirebaseFirestore.instance.collection('users').doc(userID).update(map);
    cubitGetData();
  }

// ersal mail Verification
  cubitMailVerification() {
    FirebaseAuth.instance.currentUser.sendEmailVerification().then((value) {
      print('mail sent');
      emit(SocialCompleteCreateMailState());
    }).catchError((error) {
      print('mail sent');
      emit(SocialErrorMailState(error));
    });
  }

  PickedFile pickedFile;
  File imageFile;
  cubitImagePicker() async {
    ImagePicker picker = ImagePicker();
    // Pick an image from gallery
    pickedFile = await picker.getImage(source: ImageSource.gallery);
    imageFile = File(pickedFile.path);
    emit(SocialImagePickerState());
  }

  File coverFile;
  cubitCoverPicker() async {
    ImagePicker picker = ImagePicker();
    // Pick an image from gallery
    pickedFile = await picker.getImage(source: ImageSource.gallery);
    coverFile = File(pickedFile.path);
    emit(SocialImagePickerState());
  }

  int currentIndex = 0;
  List<Widget> screens = [
    ScreenFeeds(),
    ScreenChats(),
    ScreenPosts(),
    ScreenUsers(),
    ScreenSettings(),
  ];

  List<String> titles = [
    'Home',
    'Chats',
    'Post',
    'Users',
    'Settings',
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(SocialChangeBottomNavState());
  }

  IconData suffixIcon = Icons.visibility;
  bool isPassword = true;

  changePasswordVisibility() {
    isPassword = !isPassword;
    suffixIcon = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(ShopPasswordVisibilityState());
  }

  /////////////////////////////////////////////POST POST POST POST POST POST POST POST POST ///////////////////////////

  PickedFile pickedPostFile;
  File postFile;
  cubitImagePostPicker() async {
    ImagePicker picker = ImagePicker();
    // Pick an image from gallery
    pickedPostFile = await picker.getImage(source: ImageSource.gallery);
    postFile = File(pickedPostFile.path);
    emit(SocialImagePickerPostState());
  }

  cubitCloseSelectedPostImage() {
    postFile = null;
    emit(SocialCloseSelectedPostImageState());
  }

  cubitUploadPostImage({
    String postText,
    String postDate,
  }) {
    FirebaseStorage.instance
        .ref()
        .child('post/${Uri.file(postFile.path).pathSegments.last}')
        .putFile(postFile)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //value de el hya el path bta3 el sora f el FirebaseStorage
        print(value);
        cubitAddNewPost(
            postDate: postDate, postText: postText, postImage: value);
      }).catchError((error) {
        print(error.toString());
        emit(SocialErrorUploadPostImagesState());
      });
    });
  }

  PostModel postModel;
  cubitAddNewPost({
    String postText,
    String postImage,
    String postDate,
  }) {
    postModel = PostModel(
      name: socialModel2.name,
      image: socialModel2.image,
      postText: postText ?? '',
      postImage: postImage ?? '',
      postDate: postDate ?? '',
    );
    FirebaseFirestore.instance
        .collection('post')
        .add(postModel.toMap())
        .then((value) {
      cubitGetPosts();
      emit(SocialCompleteCreatePostState());
      print('new post added successfully');
    }).catchError((error) {
      emit(SocialErrorCreatePostState());
    });
  }

  List<PostModel> posts = [];
  List<String> elements = [];

  cubitGetPosts() {
    // hna bngeb el data mn FireStore
    FirebaseFirestore.instance
        .collection('post')
        .get() // hna bygeb kol el docs f el collection('post')
        .then((value) {
      value.docs.forEach((element) {
        cubitGetAllLikes(elementID: element.id);
        cubitGetLikedPosts(element.id);

        elements.add(element.id);

        // hna bnfss kol doc bna5od el map(el hyaa el element) el gowaha
        // y3ny kol element b map kamla(name w postText w postDate ...)
        posts.add(PostModel.fromJson(element.data()));
        // print('all elements IDs ${element.id}');
        emit(SocialCompleteGetPostElementState());
      });
      emit(SocialCompleteGetPostState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialErrorGetPostState());
    });
  }

  FirebaseFirestore fireStores = FirebaseFirestore.instance;

  cubitPutLikeORComment({bool isLiked, String elementID, int likedColor}) {
    String uID = SharedData.getData('uID');
    LikeORCommentModel likeORCommentModel = LikeORCommentModel(
        isLiked: isLiked ?? false,
        elementID: elementID ?? '',
        likedColor: likedColor ?? 0);
    FirebaseFirestore.instance
        .collection('post')
        .doc(elementID)
        .collection('like')
        .doc(uID)
        .set(likeORCommentModel.toMap())
        .then((value) {
      print('doneeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      emit(SocialCompleteLikedState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialErrorLikedState());
    });
  }

  // cubitCheckIfLiked(int index) async {
  //   if (allLikes[index] != 1 || allLikes[index] != 0) {
  //     await cubitPutLikeORComment(elementID: elements[index]);
  //   }
  // }

  List<int> allLikes = [];
  cubitGetAllLikes({String elementID}) {
    FirebaseFirestore.instance
        .collection('post')
        .doc(elementID)
        .collection('like')
        .get()
        .then((value) {
      allLikes.add(value.docs.length);
      emit(SocialCompleteGetPostLikesState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialErrorGetPostLikesState());
    });
  }

  List<int> isLikedList = [];
  LikeORCommentModel likeORCommentModel;
  cubitGetLikedPosts(String elementID) async {
    String uID = SharedData.getData('uID');
    FirebaseFirestore.instance
        .collection('post')
        .doc(elementID)
        .collection('like')
        .doc(uID)
        .get()
        .then((value) {
      likeORCommentModel = LikeORCommentModel.fromJson(value.data());
      isLikedList.add(likeORCommentModel.likedColor);
      print(likeORCommentModel.likedColor);
      emit(SocialCompleteGetLikedState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialErrorGetLikedState());
    });
  }

  List<SocialModel> allUsers = [];
  cubitGetAllUsers() {
    String uID = SharedData.getData('uID');
    FirebaseFirestore.instance
        .collection('users')
        .get() // hna bygeb kol el docs f el collection('post')
        .then((value) {
      value.docs.forEach((element) {
        // hna bnfss kol doc bna5od el map(el hyaa el element) el gowaha
        // y3ny kol element b map kamla(name w postText w postDate ...)
        if (element.data()['uID'] != uID)
          allUsers.add(SocialModel.fromJson(element.data()));
        // print('all elements IDs ${element.id}');
        emit(SocialCompleteGetAllUsersState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(SocialErrorGetAllUsersState());
    });
  }

  cubitsSendMessages({
    String messageText,
    String dateTime,
    String receiverID,
  }) {
    String uID = SharedData.getData('uID');
    MessagesModel messagesModel = MessagesModel(
        messageText: messageText,
        dateTime: dateTime,
        receiverID: receiverID,
        senderID: uID);
    FirebaseFirestore.instance
        .collection('users')
        .doc(uID)
        .collection('chats')
        .doc(receiverID)
        .collection('messages')
        .add(messagesModel.toMap());

    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverID)
        .collection('chats')
        .doc(uID)
        .collection('messages')
        .add(messagesModel.toMap());
    print('UID == $uID');
    print('receiverID == $receiverID');
  }

  List<MessagesModel> messagesList = [];
  cubitGetMessages({
    String receiverID,
  }) {
    String uID = SharedData.getData('uID');
    FirebaseFirestore.instance
        .collection('users')
        .doc(uID)
        .collection('chats')
        .doc(receiverID)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messagesList = [];
      event.docs.forEach(
        (element) {
          messagesList.add(
            MessagesModel.fromJson(
              element.data(),
            ),
          );
        },
      );
      emit(SocialCompleteGetMessagesState());
    });
  }
}

// cubitGetLikedPosts(String elementID) async {
// // hna bngeb el data mn FireStore
// FirebaseFirestore.instance
//     .collection('post')
// .doc(elementID)
// .collection('like')
// .doc(uID)
// .get()
//     .then((value) {
// // print('valueeeeeeeeeeeee ${value.data()}');
// likeORCommentModel = LikeORCommentModel.fromJson(
// value.data(),
// );
// // print('likeORCommentModellllllllll ${likeORCommentModel.isLiked}');
// emit(SocialCompleteGetLikedState());
// isLiked = likeORCommentModel.isLiked;
// return isLiked;
// });
// print('isLikeddddddddddddd  $isLiked');
// hna bygeb kol el docs f el collection('post')

//   .then((value) {
// value.docs.forEach((element) {
//   // hna bnfss kol doc bna5od el map(el hyaa el element) el gowaha
//   // y3ny kol element b map kamla(name w postText w postDate ...)
//   likedPosts.add(
//     LikeORCommentModel.fromJson(
//       element.data(),
//     ),
//   );
//   likeORCommentModel = LikeORCommentModel.fromJson(element.data());
//   likedElement = likeORCommentModel.isLiked;
// }
// );

// print(error.toString());
// emit(SocialErrorGetLikedState());
// }
