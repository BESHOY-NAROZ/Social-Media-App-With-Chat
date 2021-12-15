import 'dart:ui';

import 'package:a_m_social_app/networking/social_cubit.dart';
import 'package:a_m_social_app/networking/social_states.dart';
import 'package:a_m_social_app/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextEditingController nameEditController = TextEditingController();
TextEditingController bioEditController = TextEditingController();
TextEditingController phoneEditController = TextEditingController();

class ScreenEditing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (BuildContext context, SocialStates state) {},
      builder: (BuildContext context, SocialStates state) {
        SocialCubit socialCubit = SocialCubit.getShopCubit(context);
        nameEditController.text = socialCubit.socialModel2.name;
        bioEditController.text = socialCubit.socialModel2.bio;
        phoneEditController.text = socialCubit.socialModel2.phone;
        return Scaffold(
          appBar: AppBar(
            title: Text('Edit Profile'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(3.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 190,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: <Widget>[
                                Image(
                                  fit: BoxFit.fill,
                                  height: 150,
                                  width: double.infinity,
                                  image: socialCubit.coverFile == null
                                      ? NetworkImage(
                                          socialCubit.socialModel2.cover)
                                      : FileImage(socialCubit.coverFile),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.lightBlue,
                                    child: IconButton(
                                      color: Colors.white,
                                      icon: Icon(Icons.camera_alt),
                                      onPressed: () {
                                        socialCubit.cubitCoverPicker();
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 160,
                          height: 160,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              CircleAvatar(
                                radius: 53,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundImage: socialCubit.imageFile == null
                                      ? NetworkImage(
                                          socialCubit.socialModel2.image)
                                      : FileImage(socialCubit.imageFile),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.lightBlue,
                                    child: IconButton(
                                      color: Colors.white,
                                      icon: Icon(Icons.camera_alt),
                                      onPressed: () {
                                        socialCubit.cubitImagePicker();
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    validate: (String value) {
                      if (value.isEmpty) {
                        return ('email must not be empty');
                      }
                      return null;
                    },
                    type: TextInputType.emailAddress,
                    controller: nameEditController,
                    prefix: Icons.edit,
                    label: 'Name',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    validate: (String value) {
                      if (value.isEmpty) {
                        return ('email must not be empty');
                      }
                      return null;
                    },
                    type: TextInputType.emailAddress,
                    controller: bioEditController,
                    prefix: Icons.edit,
                    label: 'Bio',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    validate: (String value) {
                      if (value.isEmpty) {
                        return ('email must not be empty');
                      }
                      return null;
                    },
                    type: TextInputType.phone,
                    controller: phoneEditController,
                    prefix: Icons.edit,
                    label: 'Phone',
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 300,
                    child: OutlineButton(
                        onPressed: () {
                          try {
                            socialCubit.cubitUploadImage();
                            socialCubit.cubitUploadCover();
                          } catch (error) {
                            print(error.toString());
                          }
                          socialCubit.cubitUpdateBasicData(
                            name: nameEditController.text,
                            bio: bioEditController.text,
                            phone: phoneEditController.text,
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.edit,
                              color: Colors.lightBlue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Save',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.lightBlue,
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
