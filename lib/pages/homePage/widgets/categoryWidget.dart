import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryWidget extends StatelessWidget {
  final String iconPath;
  final String btName;
  const CategoryWidget({super.key,required this.btName,required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:8.0),
      child: InkWell(
                            onTap: (){},
                            child: Container(
                              padding:const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).colorScheme.background
                              ),
                              child: Row(children: [
                          
                                SvgPicture.asset(iconPath),
                               const SizedBox(width: 5,),
                                Text(btName)
                              ],),
                            ),
                          ),
    );
  }
}