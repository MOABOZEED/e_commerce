// import 'package:flutter/material.dart';
//
// class AuthField extends StatelessWidget {
//   final String hintText;
//   final bool isObsecureText;
//
//
//   const AuthField({
//     super.key, required this.hintText,  this.isObsecureText=false, required TextEditingController controller,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       validator:(value){
//         if(value!.isEmpty  ){
//           return "$hintText is failed " ;
//         }
//         return null;
//       } ,
//       obscureText: isObsecureText,
//       decoration: InputDecoration(
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.grey,
//             width: 5,
//           ),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.green,
//             width: 5,
//           ),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         hintText: hintText,),
//
//
//     );
//   }
// }
