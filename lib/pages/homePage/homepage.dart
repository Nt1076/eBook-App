import 'package:ebook_app/components/bookcard.dart';
import 'package:ebook_app/components/booktile.dart';
import 'package:ebook_app/config/colors.dart';
import 'package:ebook_app/controller/bookController.dart';
import 'package:ebook_app/models/data.dart';
import 'package:ebook_app/pages/book%20Details/bookDetails.dart';
import 'package:ebook_app/pages/homePage/widgets/appBar.dart';
import 'package:ebook_app/pages/homePage/widgets/categoryWidget.dart';
import 'package:ebook_app/pages/homePage/widgets/myInputTextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  
  Widget build(BuildContext context) {
    BookController bookController = Get.put(BookController());
     bookController.getUserBook();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
      
          Container(
            padding: EdgeInsets.all(10),
            height: 380,
            color: Theme.of(context).colorScheme.primary,
            child: Expanded(
              
              child: Row(
                children: [
                   Expanded(
                     child: Column(
                      children: [
                        SizedBox(height: 40,),
                     HomeAppBar(),
                         SizedBox(height: 30,),
                     Row(
                       children: [
                         Text("Good Morning ✋ ",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.background),),
                         Text("Nitish",style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.background),)
                       ],
                     ),
                    SizedBox(height: 5,),
                      Row(
                       children: [
                         Flexible(child: Text("Time to read book and enhance your knowledge",
                         style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Theme.of(context).colorScheme.background)
                         )),
                         
                       ],
                     ),
                     SizedBox(height: 20,),
                    MyInputTextfield(),
                    SizedBox(height: 20,),
                      Row(
                        children: [
                          Text("Topic",style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: Theme.of(context).colorScheme.background
                          ),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: 
                            categoryData.map((e) => CategoryWidget(btName: e["lebel"]!, iconPath: e["icon"]!)).toList(),
                          
                        ),
                      )
                        
                      ],
                     ),
                   )
                ],
              )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(children: [
                  Text("Trending",style: Theme.of(context).textTheme.labelMedium,),
                  
                ],),
                SizedBox(height: 10,),
      
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(() => Row(children:
                    bookController.bookData.map((e) => BookCard(
                      coverUrl:e.coverUrl!, 
                      onTap: () {    Get.to(BookDetails(
                        book: e,
                      ));},
                       title: e.title!,
      
      
                    )).toList(),
                  ),)
                ),
                 SizedBox(height: 10,),
                 Row(children: [
                  Text("Your Interest",
                  style: Theme.of(context).textTheme.labelMedium,),
                  
                ],),
                SizedBox(height: 10,),
                Obx(() => Column(
                  children: bookController.bookData.map((e) => BookTile(
                    ontap:() {
                      Get.to(BookDetails(book: e));
                    },
                    title: e.title!,
                     coverUrl: e.coverUrl!,
                      author: e.author!,
                       price: e.price!,
                        rating: e.rating!,
                        // totalRating: e.numberofRating!,
                          )).toList()
                ))
               
              ],
            ),
          )
        ],),
      ),
    );
  }
}