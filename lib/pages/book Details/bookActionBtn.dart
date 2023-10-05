import 'package:ebook_app/config/colors.dart';
import 'package:ebook_app/pages/bookPage/bookPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BookActionBtn extends StatelessWidget {
  final String bookUrl;
  const BookActionBtn({super.key,required this.bookUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  decoration: BoxDecoration(color: primaryColor,borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(BookPage(
                            bookUrl: bookUrl,
                          ));
                        },
                        child: Row(
                          children: [SvgPicture.asset("assets/Icons/book.svg"),
                          SizedBox(width: 10,),
                          Text("Read Book",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.background,letterSpacing: 1.4),)
                          ],
                        ),
                      ),
                      Container(
                    width: 2,
                    //height: 10,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.circular(10)
                    ),

                      ),
                      Row(
                        children: [SvgPicture.asset("assets/Icons/playe.svg"),
                        SizedBox(width: 10,),
                        Text("Play Book",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.background,letterSpacing: 1.4),)
                        ],
                      )
                    ],
                  ),
                )
      ;
  }
}