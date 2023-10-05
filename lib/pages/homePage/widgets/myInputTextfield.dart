import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyInputTextfield
 extends StatelessWidget {
  const MyInputTextfield
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(children: [
                      SizedBox(width: 10,),
                      SvgPicture.asset("assets/Icons/search.svg"),
                      SizedBox(width: 5,),
                      Expanded(
                        child: TextFormField(
                          

                          decoration: InputDecoration(
                            
                            hintText: "Search here",
                            border: OutlineInputBorder(borderSide: BorderSide.none)
                          ),
                        ))
                    ]),
                   );
  }
}