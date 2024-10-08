// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:little_library/config/routes.dart';
// import 'package:little_library/constants.dart';
// import 'package:little_library/modal/book_modal.dart';
// import 'package:little_library/modal/user.modal.dart';
// import 'package:little_library/screens/HomePage/description.dart';
// import 'package:little_library/theme/colors.dart';
// import 'package:little_library/widgets/status_pills.dart';

// class SliderCard extends StatefulWidget {
//   const SliderCard({super.key});

//   @override
//   State<SliderCard> createState() => _SliderCardState();
// }

// class _SliderCardState extends State<SliderCard> {
//   UserModel? user;
//   GoogleMapController? _mapController;

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: FirebaseFirestore.instance.collection('books').get().then(
//           (value) => value.docs
//               .map((e) => Book.fromMap(e.data()))
//               .toList()),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           List<Book> book = snapshot.data!;
//           return SizedBox(
//             height: 200,
//             child: PageView.builder(
//               onPageChanged: (value) {
//                 setState(() {
//                   _mapController?.moveCamera(
//                     CameraUpdate.newCameraPosition(
//                       CameraPosition(
//                         target: LatLng(
//                           book[value].locationCoordinates!.latitude,
//                           book[value].locationCoordinates!.longitude,
//                         ),
//                         zoom: 14.0,
//                       ),
//                     ),
//                   );
//                 });
//               },
//               controller: PageController(viewportFraction: 0.8),
//               itemCount: book.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) {
//                         return BookDetail(
//                           book: book[index],
//                         );
//                       }),
//                     );
//                   },
//                   child: Card(
//                     clipBehavior: Clip.antiAlias,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadiusDirectional.circular(10),
//                     ),
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 10),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 flex: 3,
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       book[index].bookName ?? '',
//                                       overflow: TextOverflow.ellipsis,
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodyMedium!
//                                           .copyWith(
//                                               fontWeight: FontWeight.w500),
//                                     ),
//                                     y5,
//                                     Text(
//                                       book[index].bookDescription ?? '',
//                                       overflow: TextOverflow.ellipsis,
//                                       maxLines: 2,
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodySmall!
//                                           .copyWith(
//                                               color: AppColors.placeholderText),
//                                     ),
//                                     y5,
//                                     FutureBuilder(
//                                       future: FirebaseFirestore.instance
//                                           .collection('users')
//                                           .doc(book[index].bookOwnerId)
//                                           .get(),
//                                       builder: (context, snapshot) {
//                                         if (snapshot.hasData) {
//                                           final map = snapshot.data!.data();
//                                           user = UserModel.fromMap(
//                                               map as Map<String, dynamic>);
//                                           return Row(
//                                             children: [
//                                               SizedBox(
//                                                 child: user?.profileUrl != '' &&
//                                                         user?.profileUrl != null
//                                                     ? CircleAvatar(
//                                                         radius: 13,
//                                                         backgroundColor:
//                                                             AppColors
//                                                                 .hoverColor,
//                                                         backgroundImage:
//                                                             NetworkImage(user!
//                                                                 .profileUrl!),
//                                                       )
//                                                     : const CircleAvatar(
//                                                         radius: 13,
//                                                         backgroundColor:
//                                                             AppColors
//                                                                 .hoverColor,
//                                                         child: Icon(
//                                                           Icons.person,
//                                                           color: AppColors.grey,
//                                                           size: 13,
//                                                         ),
//                                                       ),
//                                               ),
//                                               const SizedBox(width: 8),
//                                               Text(
//                                                 user!.username ?? '',
//                                                 overflow: TextOverflow.ellipsis,
//                                                 style: Theme.of(context)
//                                                     .textTheme
//                                                     .bodySmall,
//                                               ),
//                                             ],
//                                           );
//                                         }
//                                         return const SizedBox();
//                                       },
//                                     ),
//                                     // Row(
//                                     //   children: [
//                                     //     const CircleAvatar(
//                                     //       radius: 16.0,
//                                     //       backgroundColor: AppColors.border,
//                                     //       child: Icon(
//                                     //         Icons.person,
//                                     //         color: AppColors.background2,
//                                     //       ),
//                                     //     ),
//                                     //     x5,
//                                     //     Text(
//                                     //       'Username',
//                                     //       overflow: TextOverflow.ellipsis,
//                                     //       style: Theme.of(context)
//                                     //           .textTheme
//                                     //           .bodySmall,
//                                     //     ),
//                                     //   ],
//                                     // ),
//                                   ],
//                                 ),
//                               ),
//                               x10,
//                               SizedBox(
//                                 height: 110,
//                                 width: 120,
//                                 child: Card(
//                                   clipBehavior: Clip.antiAlias,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: Image.network(
//                                     book[index].bookImages!.first,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           y10,
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               GestureDetector(
//                                 onTap: () {},
//                                 child: Container(
//                                   height: 40,
//                                   width: 150,
//                                   decoration: BoxDecoration(
//                                     color: AppColors.primary,
//                                     borderRadius: BorderRadius.circular(25),
//                                   ),
//                                   child: const Center(
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Icon(Icons.location_pin,
//                                             color: AppColors.secondary),
//                                         Text(
//                                           'Locate on map',
//                                           style: TextStyle(
//                                               color: AppColors.secondary),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               const Icon(Icons.bookmark_outline,
//                                   color: AppColors.secondary),
//                               SizedBox(
//                                   width: 110, child: unavailableStatusPills()),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         } else {
//           return const Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }
