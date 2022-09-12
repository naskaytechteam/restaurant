// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../providers/authentication.dart';
// enum LOGIN{
//   google,facebook,apple
//
// }
// class LoginWith extends StatelessWidget {
//   final String loginText;
//   final bool isImage;
//   final String? url;
//   final IconData? icon;
//   final LOGIN login;
//
//   const LoginWith({
//     required this.loginText,
//     this.isImage = false,
//     this.url,
//     this.icon,
//     required this.login,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double height = size.height;
//     double width = size.width;
//     Authentication authentication=Provider.of<Authentication>(context);
//     return InkWell(
//       onTap: ()async{
//         if(login==LOGIN.google){
//
//           await authentication.signInWithGoogle();
//         }
//         else if(login==LOGIN.facebook){
//           await authentication.signUpWithFacebook();
//         }
//
//       },
//       child: Container(
//         height: height * 0.07,
//         width: width,
//         color: Colors.white,
//         child: Flex(
//           direction: Axis.horizontal,
//           children: [
//             Flexible(
//               flex: 2,
//               child: Align(
//                 alignment: Alignment.centerRight,
//                 child: isImage == true
//                     ? Image.asset(
//                         url!,
//                         height: 27,
//                         width: 27,
//                         fit: BoxFit.cover,
//                       )
//                     : Icon(
//                         icon,
//                         size: 30,
//                       ),
//               ),
//             ),
//             SizedBox(
//               width: width * 0.03,
//             ),
//             // SizedBox(width: width*0.1,),
//             Flexible(
//                 flex: 5,
//                 child: Text(
//                   loginText,
//                   style:
//                       const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }
