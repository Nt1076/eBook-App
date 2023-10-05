import 'package:ebook_app/config/colors.dart';
import 'package:ebook_app/controller/authController.dart';
import 'package:ebook_app/pages/profilepage/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController =Get.put(AuthController());
    return   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        
                        children: [
                         SvgPicture.asset("assets/Icons/dashboard.svg"),
                         Text("e Book",style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: backgroudColor),),
                         InkWell
                         (
                          onTap: () {
                            Get.to(ProfilePage());
                          },
                           child: CircleAvatar(
                            radius: 22,
                            backgroundColor: Theme.of(context).colorScheme.background,
                            child:ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.network("${authController.auth.currentUser!.photoURL}"))
                            
                            ,
                            ),
                         )

                          
                        ],
                      );
  }
}