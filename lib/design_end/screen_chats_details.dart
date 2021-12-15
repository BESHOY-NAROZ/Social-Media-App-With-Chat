import 'package:a_m_social_app/models/social_model.dart';
import 'package:a_m_social_app/networking/social_cubit.dart';
import 'package:a_m_social_app/networking/social_states.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextEditingController messageController = TextEditingController();

class ScreenChatsDetails extends StatelessWidget {
  SocialModel socialModel;

  ScreenChatsDetails({this.socialModel});
  // 4781483
  //
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        SocialCubit.getShopCubit(context)
            .cubitGetMessages(receiverID: socialModel.uID);
        return BlocConsumer<SocialCubit, SocialStates>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, state) {
              SocialCubit socialCubit = SocialCubit.getShopCubit(context);

              return Scaffold(
                  appBar: AppBar(
                    leading: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                    backgroundColor: Colors.white,
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                              radius: 22.0,
                              backgroundImage: NetworkImage(socialModel.image)),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            socialModel.name,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          // Icon(
                        ],
                      ),
                    ),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        //
                        Expanded(
                          child: ConditionalBuilder(
                            condition: socialCubit.messagesList.length > 0,
                            fallback: (context) {
                              return Center(child: CircularProgressIndicator());
                            },
                            builder: (BuildContext context) {
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  // String message =
                                  //     socialCubit.messagesList[index].messageText;

                                  return Column(
                                    children: <Widget>[
                                      if (socialModel.uID ==
                                          socialCubit
                                              .messagesList[index].senderID)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.centerStart,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15),
                                              ),
                                              color: Colors.grey[300],
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(socialCubit
                                                  .messagesList[index]
                                                  .messageText),
                                            ),
                                          ),
                                        ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      if (socialModel.uID !=
                                          socialCubit
                                              .messagesList[index].senderID)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.centerEnd,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15),
                                                bottomLeft: Radius.circular(15),
                                              ),
                                              color: Colors.blue[300],
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(socialCubit
                                                      .messagesList[index]
                                                      .messageText
                                                  // 'gooood 2'
                                                  ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                },
                                itemCount: socialCubit.messagesList.length,
                              );
                            },
                          ),
                        ),

                        Container(
                          width: double.infinity,
                          height: 50,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: TextFormField(
                                  controller: messageController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'type your message here...'),
                                ),
                              ),
                              Container(
                                //clipBehavior: Clip.antiAliasWithSaveLayer,
                                height: 50,
                                width: 50,
                                child: OutlineButton(
                                    onPressed: () {
                                      socialCubit.cubitsSendMessages(
                                          messageText: messageController.text,
                                          receiverID: socialModel.uID,
                                          dateTime: DateTime.now().toString());
                                      print(
                                          'nameeeee ==  ${socialCubit.messagesList.length}');
                                    },
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.lightBlue,
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ));
            });
      },
    );
  }
}
