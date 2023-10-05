import 'package:ebook_app/components/mybutton.dart';
import 'package:ebook_app/config/colors.dart';
import 'package:ebook_app/controller/authController.dart';
import 'package:ebook_app/pages/homePage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: Column(
        children: [
          Container(
            color:Theme.of(context).colorScheme.primary ,
            
           
            height: 400,
            width: MediaQuery.of(context).size.width,
            child:Column(
              
              children: [
               const SizedBox(height: 30,),
              
                 Image.asset("assets/Images/book.png",height: 200,width: 300,),
              const   SizedBox(height: 10,),

                 Text("e  Book app",style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Theme.of(context).colorScheme.background
                 )),
              const  SizedBox(height: 20,),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal:30.0),
                   child: Text("Enhance your knowledge and Make your own \n                          exciting library \n                      make reading a fun ",style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.background
                   )),
                 ),
                 
              ],
            )
          ),
         const  SizedBox(height: 40,),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:10.0),
                child: Row(
                  children: [
                    Text("Disclaimer",style: Theme.of(context).textTheme.labelMedium,),
              
              
                  ],
                ),
              ),
        const  SizedBox(height: 10,),
         Padding(
          padding: const EdgeInsets.only(left:10.0),
           child: Text("publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum",style: Theme.of(context).textTheme.labelSmall,),
         ),
     const SizedBox(height: 50,),
         PrimaryButton(
          
          image: Image.asset("assets/Icons/google.png"),
          
          onTap: (){
        
        authController.loginWithEmail();
         },btName: "Login with google",)

            ],
          )
        ],
      ),
    );
  }
}