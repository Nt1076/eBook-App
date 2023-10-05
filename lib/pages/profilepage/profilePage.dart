import 'package:ebook_app/components/backButton.dart';
import 'package:ebook_app/components/booktile.dart';
import 'package:ebook_app/components/mybutton.dart';
import 'package:ebook_app/config/colors.dart';
import 'package:ebook_app/controller/authController.dart';
import 'package:ebook_app/controller/bookController.dart';
import 'package:ebook_app/models/data.dart';
import 'package:ebook_app/pages/addNewBook/addNewbook.dart';
import 'package:ebook_app/pages/book%20Details/bookDetails.dart';
import 'package:ebook_app/pages/homePage/homepage.dart';
import 'package:ebook_app/pages/homePage/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    BookController bookController = Get.put(BookController());
   
    return Scaffold(

      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.to(AddNewBookPage());
      },
      child:Icon(Icons.add,color: Theme.of(context).colorScheme.background,) ,
      ),
      body: SingleChildScrollView(
        child: Column(
      
          children: [
          
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
              color:Theme.of(context).colorScheme.primary ,
              
             
      // height: 400,
              width: MediaQuery.of(context).size.width,
              child:Row(
                children: [
                  Expanded(
                    child: Column(
                      
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        
                        children: [
                        MyBackButton(),
                         Text("My Profile",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: backgroudColor),),
                       IconButton(onPressed: (){
                       authController.signout();
                       },
                        icon: Icon(Icons.exit_to_app,color: Theme.of(context).colorScheme.background,))
                         
                          
                        ],
                      ),
                        SizedBox(height: 80,),
                       
                         Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            border: Border.all(
                              width: 2,
                              color: Theme.of(context).colorScheme.background
                            )
                          ),
      
                          child: Container(
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Image.network("${authController.auth.currentUser!.photoURL}",fit: BoxFit.cover,))),
                         ),
                         SizedBox(height: 20,),
                         Text("${authController.auth.currentUser!.displayName}",style: Theme.of(context).textTheme.bodyLarge?.copyWith
                         (color: Theme.of(context).colorScheme.background),),
                          Text("${authController.auth.currentUser!.email}",style: Theme.of(context).textTheme.labelSmall?.copyWith
                         (color: Theme.of(context).colorScheme.background),)
                      ],
                    ),
                  ),
                ],
              )
            ),
          
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
      
                  Row(
                    children: [
                      Text("Your Books",style: Theme.of(context).textTheme.labelMedium ,)
                    ],
                  ),
                  SizedBox(height: 20,),
                 Obx(() =>  Column(children:
                  
                  bookController.currentUserBooks.map((e) => BookTile(
                     title: e.title!,
                       coverUrl: e.coverUrl!,
                        author: e.author!,
                         price: e.price!,
                          rating: e.rating!,
                          // totalRating: e.numberofRating!,
                            ontap: (){
                                 Get.to(BookDetails(
                        book: e,
                      ));
                            
                            }
                         )).toList(),))
                
            
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}