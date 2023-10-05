import 'package:ebook_app/components/backButton.dart';
import 'package:ebook_app/config/colors.dart';
import 'package:ebook_app/models/bookmodel.dart';
import 'package:ebook_app/pages/book%20Details/bookActionBtn.dart';
import 'package:ebook_app/pages/book%20Details/headerwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookDetails extends StatelessWidget {
  final BookModel book;
  const BookDetails({super.key,required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              //height: 500,
              color: primaryColor,
              child: Row(
                children: [
                  Expanded(
                    child:BookDetailsHeader(
                      coverUrl: book.coverUrl!,
                      title: book.title!,
                      author: book.author!,
                      description: book.description!,
                      rating: book.rating!,
                      pages: book.pages.toString(),
                      langugae: book.language!,
                      audioLen: book.audioLen!,


                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                
                children: [
                Row(
                  children: [
                    Text("About Book",style: Theme.of(context).textTheme.bodyMedium,),
      
                  ],
                ),
                SizedBox(height: 8,),
                 Row(
                  children: [
                    Flexible(child: Text(book.description!,style: Theme.of(context).textTheme.labelSmall,)),
      
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text("About Author",style: Theme.of(context).textTheme.bodyMedium,),
      
                  ],
                ),
                SizedBox(height: 8,),
                 Row(
                  children: [
                    Flexible(child: Text(book.aboutAuthor!,style: Theme.of(context).textTheme.labelSmall,)),
      
                  ],
                ),
                SizedBox(height: 40,),

                BookActionBtn(bookUrl: book.bookurl!,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}