import 'package:a_m_social_app/networking/social_cubit.dart';
import 'package:a_m_social_app/networking/social_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// a_m_social_app
//a_m_social_app

TextEditingController addPostController = TextEditingController();

class ScreenPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        SocialCubit socialCubit = SocialCubit.getShopCubit(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage:
                          NetworkImage(socialCubit.socialModel2.image),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: Text(
                        socialCubit.socialModel2.name,
                        style: TextStyle(
                            height: 2,
                            letterSpacing: 1,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 19, top: 15),
                      child: OutlineButton(
                        textColor: Colors.green,
                        onPressed: () {
                          DateTime timeNow = DateTime.now();
                          if (socialCubit.postFile == null) {
                            socialCubit.cubitAddNewPost(
                                postText: addPostController.text,
                                postDate: timeNow.toString());
                          } else {
                            socialCubit.cubitUploadPostImage(
                                postText: addPostController.text,
                                postDate: timeNow.toString());
                          }
                        },
                        child: Text('Post',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: TextFormField(
                    controller: addPostController,
                    decoration: InputDecoration(
                      hintText: 'what is on your mind',
                      border: InputBorder.none,
                    ),
                    onTap: () {},
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      socialCubit.postFile != null
                          ? Container(
                              height: 100,
                              width: 300,
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: <Widget>[
                                  Image(
                                    fit: BoxFit.fill,
                                    height: 150,
                                    width: double.infinity,
                                    image: FileImage(socialCubit.postFile),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      socialCubit.cubitCloseSelectedPostImage();
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 20,
                                      child: Icon(Icons.close),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Container(
                              width: 0,
                              height: 0,
                            ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: FlatButton(
                              color: Colors.green,
                              onPressed: () {
                                socialCubit.cubitImagePostPicker();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.photo,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    'add photo',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: FlatButton(
                              color: Colors.green,
                              onPressed: () {},
                              child: Text('#tags',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
