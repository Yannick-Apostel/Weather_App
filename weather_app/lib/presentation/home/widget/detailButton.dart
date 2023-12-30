import 'package:flutter/material.dart';

class DetailButton extends StatelessWidget{
  final Function callback;
  const DetailButton({super.key, required this.callback});


  @override
  Widget build(BuildContext context) {
   return InkResponse(
    child: Container(
      height: 40,
      width: double.infinity/5,
      decoration: BoxDecoration(
        color: Color.fromRGBO(1, 255, 220, 1),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Center(
        child: Text(
          'detail', style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w400
          ),
        ),
      ),
    ),
    onTap: ()=> callback(),
   );
  }}