import 'package:a_m_social_app/data_base/shared_data.dart';
import 'package:a_m_social_app/networking/social_cubit.dart';
import 'package:a_m_social_app/networking/social_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// a_m_social_app
//a_m_social_app

class ScreenFeeds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        SocialCubit socialCubit = SocialCubit.getShopCubit(context);

        return Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: Material(
                    elevation: 10,
                    child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image(
                        fit: BoxFit.fill,
                        height: 200,
                        width: double.infinity,
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1628191011993-69070758764f?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
                        ),
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 25.0,
                                  backgroundImage: NetworkImage(
                                      socialCubit.posts[index].image),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text(
                                            socialCubit.posts[index].name,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        // Icon(
                                        Icon(
                                          Icons.check_circle,
                                          color: Colors.blueAccent,
                                          size: 16.0,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      socialCubit.posts[index].postDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          .copyWith(
                                            height: 1.4,
                                          ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                IconButton(
                                  icon: Icon(
                                    Icons.more_horiz,
                                    size: 16.0,
                                  ),
                                  onPressed: () {
                                    SharedData.sharedPreferences.remove('uID');
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: Colors.grey[400],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(socialCubit.posts[index].postText),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Software_Developer',
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            if (socialCubit.posts[index].postImage != '')
                              Material(
                                elevation: 10,
                                child: Container(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image(
                                    fit: BoxFit.fill,
                                    height: 150,
                                    width: double.infinity,
                                    image: NetworkImage(
                                        socialCubit.posts[index].postImage,
                                        scale: 1),
                                  ),
                                ),
                              ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  if (socialCubit.allLikes.isNotEmpty)
                                    Text(
                                      //socialCubit.elements[index]
                                      '${socialCubit.allLikes[index]}',
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                  Spacer(),
                                  Icon(
                                    Icons.comment,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    '100 comment',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: Colors.grey[400],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 18.0,
                                  backgroundImage: NetworkImage(
                                    'https://images.unsplash.com/photo-1628191011993-69070758764f?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'write a comment...',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      // socialCubit.cubitGetLikedPosts(
                                      //     socialCubit.elements[index]);
                                      socialCubit.cubitPutLikeORComment(
                                          likedColor: 1,
                                          isLiked: true,
                                          elementID:
                                              socialCubit.elements[index]);
                                      print(socialCubit.elements[index]);
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Icon(
                                            Icons.favorite_border,
                                            size: 20,
                                            color: Colors.red,
                                          ),
                                        ),
                                        // if (socialCubit.isLikedList.isNotEmpty)
                                        Text('Like',
                                            style:
                                                // socialCubit
                                                //             .isLikedList[index] ==
                                                //         0
                                                //     ? TextStyle(
                                                //         color: Colors.blue,
                                                //         fontWeight:
                                                //             FontWeight.bold)
                                                //     :
                                                TextStyle(
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: socialCubit.posts.length,
                  reverse: true,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

////return Scaffold(
//               body: SingleChildScrollView(
//                 physics: BouncingScrollPhysics(),
//                 child: Column(
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.all(3),
//                       child: Material(
//                         elevation: 10,
//                         child: Container(
//                           clipBehavior: Clip.antiAliasWithSaveLayer,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Image(
//                             fit: BoxFit.fill,
//                             height: 200,
//                             width: double.infinity,
//                             image: NetworkImage(
//                               'https://images.unsplash.com/photo-1628191011993-69070758764f?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     ListView.builder(
//                       itemBuilder: (BuildContext context, int index) {
//                         return Card(
//                           elevation: 10,
//                           child: Padding(
//                             padding: const EdgeInsets.all(3),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Row(
//                                   children: <Widget>[
//                                     CircleAvatar(
//                                       radius: 25.0,
//                                       backgroundImage: NetworkImage(
//                                           socialCubit.posts[index].image),
//                                     ),
//                                     SizedBox(
//                                       width: 30,
//                                     ),
//                                     Column(
//                                       children: <Widget>[
//                                         Row(
//                                           children: <Widget>[
//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                       horizontal: 8.0),
//                                               child: Text(
//                                                 socialCubit.posts[index].name,
//                                                 style: TextStyle(
//                                                     fontSize: 15,
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                             ),
//                                             // Icon(
//                                             Icon(
//                                               Icons.check_circle,
//                                               color: Colors.blueAccent,
//                                               size: 16.0,
//                                             ),
//                                           ],
//                                         ),
//                                         Text(
//                                           socialCubit.posts[index].postDate,
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .caption
//                                               .copyWith(
//                                                 height: 1.4,
//                                               ),
//                                         ),
//                                       ],
//                                     ),
//                                     Spacer(),
//                                     IconButton(
//                                       icon: Icon(
//                                         Icons.more_horiz,
//                                         size: 16.0,
//                                       ),
//                                       onPressed: () {
//                                         SharedData.sharedPreferences
//                                             .remove('uID');
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                   width: double.infinity,
//                                   height: 1,
//                                   color: Colors.grey[400],
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Text(socialCubit.posts[index].postText),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                   'Software_Developer',
//                                   style: TextStyle(
//                                       color: Colors.lightBlue,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 if (socialCubit.posts[index].postImage != '')
//                                   Material(
//                                     elevation: 10,
//                                     child: Container(
//                                       clipBehavior: Clip.antiAliasWithSaveLayer,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                       child: Image(
//                                         fit: BoxFit.fill,
//                                         height: 150,
//                                         width: double.infinity,
//                                         image: NetworkImage(
//                                             socialCubit.posts[index].postImage,
//                                             scale: 1),
//                                       ),
//                                     ),
//                                   ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 SizedBox(
//                                   height: 8,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 20),
//                                   child: Row(
//                                     children: <Widget>[
//                                       Icon(
//                                         Icons.favorite_border,
//                                         color: Colors.red,
//                                       ),
//                                       SizedBox(
//                                         width: 8,
//                                       ),
//                                       Text(
//                                         '1000',
//                                         style:
//                                             Theme.of(context).textTheme.caption,
//                                       ),
//                                       Spacer(),
//                                       Icon(
//                                         Icons.comment,
//                                         color: Colors.red,
//                                       ),
//                                       SizedBox(
//                                         width: 8,
//                                       ),
//                                       Text(
//                                         '100 comment',
//                                         style:
//                                             Theme.of(context).textTheme.caption,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Container(
//                                   width: double.infinity,
//                                   height: 1,
//                                   color: Colors.grey[400],
//                                 ),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Row(
//                                   children: <Widget>[
//                                     CircleAvatar(
//                                       radius: 18.0,
//                                       backgroundImage: NetworkImage(
//                                         'https://images.unsplash.com/photo-1628191011993-69070758764f?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 20,
//                                     ),
//                                     Text(
//                                       'write a comment...',
//                                       style:
//                                           Theme.of(context).textTheme.caption,
//                                     )
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                       physics: NeverScrollableScrollPhysics(),
//                       scrollDirection: Axis.vertical,
//                       shrinkWrap: true,
//                       itemCount: socialCubit.posts.length,
//                     )
//                   ],
//                 ),
//               ),
//             );

//////////////////////////////////////////////////////////////////////////

// class MyWidget extends StatelessWidget {
//   MyWidget({
//     Key key,
//     @required this.image,
//     @required this.name,
//     @required this.postDate,
//     @required this.postText,
//     @required this.postImage,
//     @required this.elementID,
//     @required this.isLiked,
//   });
//
//   String image;
//   String name;
//   String postDate;
//   String postText;
//   String postImage;
//   String elementID;
//   bool isLiked;
//
//   @override
//   Widget build(BuildContext context) {
//     SocialCubit socialCubit = SocialCubit.getShopCubit(context);
//     return Card(
//       elevation: 10,
//       child: Padding(
//         padding: const EdgeInsets.all(5),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Row(
//               children: <Widget>[
//                 CircleAvatar(
//                   radius: 25.0,
//                   backgroundImage: NetworkImage(image),
//                 ),
//                 SizedBox(
//                   width: 15,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Row(
//                       children: <Widget>[
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                           child: Text(
//                             name,
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         // Icon(
//                         Icon(
//                           Icons.check_circle,
//                           color: Colors.blueAccent,
//                           size: 16.0,
//                         ),
//                       ],
//                     ),
//                     Text(
//                       postDate.trim(),
//                       style: Theme.of(context).textTheme.caption.copyWith(
//                         height: 1.4,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Spacer(),
//                 IconButton(
//                   icon: Icon(
//                     Icons.more_horiz,
//                     size: 16.0,
//                   ),
//                   onPressed: () {
//                     SharedData.sharedPreferences.remove('uID');
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               width: double.infinity,
//               height: 1,
//               color: Colors.grey[400],
//             ),
//             SizedBox(
//               height: 25,
//             ),
//             Text(postText),
//             SizedBox(
//               height: 15,
//             ),
//             Text(
//               'Software_Developer',
//               style: TextStyle(
//                   color: Colors.lightBlue, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             if (postImage != '')
//               Material(
//                 elevation: 10,
//                 child: Container(
//                   clipBehavior: Clip.antiAliasWithSaveLayer,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Image(
//                     fit: BoxFit.fill,
//                     height: 150,
//                     width: double.infinity,
//                     image: NetworkImage(postImage, scale: 1),
//                   ),
//                 ),
//               ),
//             SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Row(
//                 children: <Widget>[
//                   Icon(
//                     Icons.favorite_border,
//                     color: Colors.red,
//                   ),
//                   SizedBox(
//                     width: 8,
//                   ),
//                   Text(
//                     '1000',
//                     style: Theme.of(context).textTheme.caption,
//                   ),
//                   Spacer(),
//                   Icon(
//                     Icons.comment,
//                     color: Colors.red,
//                   ),
//                   SizedBox(
//                     width: 8,
//                   ),
//                   InkWell(
//                     onTap: () {},
//                     child: Text(
//                       '100 comment',
//                       style: Theme.of(context).textTheme.caption,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Container(
//               width: double.infinity,
//               height: 1,
//               color: Colors.grey[400],
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Row(
//               children: <Widget>[
//                 CircleAvatar(
//                   radius: 18.0,
//                   backgroundImage: NetworkImage(
//                     'https://images.unsplash.com/photo-1628191011993-69070758764f?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
//                   ),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Text(
//                   'write a comment...',
//                   style: Theme.of(context).textTheme.caption,
//                 ),
//                 Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: InkWell(
//                     onTap: () {
//                       socialCubit.cubitPutLikeORComment(
//                           isLiked: true, elementID: elementID);
//                     },
//                     child: Row(
//                       children: <Widget>[
//                         Container(
//                           width: 30,
//                           child: IconButton(
//                             onPressed: null,
//                             color: Colors.redAccent,
//                             icon: Icon(
//                               Icons.favorite_border,
//                               size: 20,
//                             ),
//                           ),
//                         ),
//                         Text(
//                           'Like',
//                           style: TextStyle(
//                               color: Colors.blue, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
/////////////////////////////////////////////////////////////////////////////////

//   return Scaffold(
//           body: SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(3),
//                   child: Material(
//                     elevation: 10,
//                     child: Container(
//                       clipBehavior: Clip.antiAliasWithSaveLayer,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Image(
//                         fit: BoxFit.fill,
//                         height: 200,
//                         width: double.infinity,
//                         image: NetworkImage(
//                           'https://images.unsplash.com/photo-1628191011993-69070758764f?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 StreamBuilder<QuerySnapshot>(
//                   stream: socialCubit.fireStores
//                       .collection('post')
//                       .orderBy('postDate')
//                       .snapshots(),
//                   builder: (BuildContext context,
//                       AsyncSnapshot<QuerySnapshot> snapshot) {
//                     List<PostModel> elements = [];
//
//                     if (snapshot.hasData) {
//                       for (QueryDocumentSnapshot allData
//                           in snapshot.data.docs) {
//                         postText = allData.data()['postText'];
//                         name = allData.data()['name'];
//                         image = allData.data()['image'];
//                         postDate = allData.data()['postDate'];
//                         postImage = allData.data()['postImage'];
//                         elementID = allData.id;
//
//                         PostModel postModel = PostModel(
//                             name: name,
//                             postImage: postImage,
//                             postText: postText,
//                             postDate: postDate,
//                             image: image,
//                             elementID: elementID);
//
//                         elements.add(postModel);
//                       }
//                     }
//
//                     return ListView.builder(
//                       physics: NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount: elements.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         // String w = socialCubit.likedPosts[index].elementID;
//
//                         return Card(
//                           elevation: 10,
//                           child: Padding(
//                             padding: const EdgeInsets.all(5),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Row(
//                                   children: <Widget>[
//                                     CircleAvatar(
//                                       radius: 25.0,
//                                       backgroundImage:
//                                           NetworkImage(elements[index].image),
//                                     ),
//                                     SizedBox(
//                                       width: 15,
//                                     ),
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: <Widget>[
//                                         Row(
//                                           children: <Widget>[
//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                       horizontal: 8.0),
//                                               child: Text(
//                                                 elements[index].name,
//                                                 style: TextStyle(
//                                                     fontSize: 15,
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                             ),
//                                             // Icon(
//                                             Icon(
//                                               Icons.check_circle,
//                                               color: Colors.blueAccent,
//                                               size: 16.0,
//                                             ),
//                                           ],
//                                         ),
//                                         Text(
//                                           elements[index].postDate,
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .caption
//                                               .copyWith(
//                                                 height: 1.4,
//                                               ),
//                                         ),
//                                       ],
//                                     ),
//                                     Spacer(),
//                                     IconButton(
//                                       icon: Icon(
//                                         Icons.more_horiz,
//                                         size: 16.0,
//                                       ),
//                                       onPressed: () {
//                                         SharedData.sharedPreferences
//                                             .remove('uID');
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                   width: double.infinity,
//                                   height: 1,
//                                   color: Colors.grey[400],
//                                 ),
//                                 SizedBox(
//                                   height: 25,
//                                 ),
//                                 Text(elements[index].postText),
//                                 SizedBox(
//                                   height: 15,
//                                 ),
//                                 Text(
//                                   'Software_Developer',
//                                   style: TextStyle(
//                                       color: Colors.lightBlue,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 if (elements[index].postImage != '')
//                                   Material(
//                                     elevation: 10,
//                                     child: Container(
//                                       clipBehavior: Clip.antiAliasWithSaveLayer,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                       child: Image(
//                                         fit: BoxFit.fill,
//                                         height: 150,
//                                         width: double.infinity,
//                                         image: NetworkImage(
//                                             elements[index].postImage,
//                                             scale: 1),
//                                       ),
//                                     ),
//                                   ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 20),
//                                   child: Row(
//                                     children: <Widget>[
//                                       Icon(
//                                         Icons.favorite_border,
//                                         color: Colors.red,
//                                       ),
//                                       SizedBox(
//                                         width: 8,
//                                       ),
//                                       Text(
//                                         '100',
//                                         style:
//                                             Theme.of(context).textTheme.caption,
//                                       ),
//                                       Spacer(),
//                                       Icon(
//                                         Icons.comment,
//                                         color: Colors.red,
//                                       ),
//                                       SizedBox(
//                                         width: 8,
//                                       ),
//                                       InkWell(
//                                         onTap: () {},
//                                         child: Text(
//                                           '100 comment',
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .caption,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Container(
//                                   width: double.infinity,
//                                   height: 1,
//                                   color: Colors.grey[400],
//                                 ),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Row(
//                                   children: <Widget>[
//                                     CircleAvatar(
//                                       radius: 18.0,
//                                       backgroundImage:
//                                           NetworkImage(elements[index].image),
//                                     ),
//                                     SizedBox(
//                                       width: 20,
//                                     ),
//                                     Text(
//                                       'write a comment...',
//                                       style:
//                                           Theme.of(context).textTheme.caption,
//                                     ),
//                                     Spacer(),
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: InkWell(
//                                         onTap: () {
//                                           socialCubit.cubitPutLikeORComment(
//                                               isLiked: true,
//                                               elementID:
//                                                   elements[index].elementID);
//                                         },
//                                         child: Row(
//                                           children: <Widget>[
//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.all(3.0),
//                                               child: Icon(
//                                                 Icons.favorite_border,
//                                                 size: 20,
//                                                 color: Colors.red,
//                                               ),
//                                             ),
//                                             Text('Like',
//                                                 style: TextStyle(
//                                                     color: Colors.red,
//                                                     fontWeight:
//                                                         FontWeight.bold)),
//                                           ],
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 )
//               ],
//             ),
//           ),
//         );
