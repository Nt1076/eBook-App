import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookTile extends StatelessWidget {
  final String title;
  final String coverUrl;
  final String author;
  final int price;
  final String rating;
  //final String totalRating;
  final VoidCallback ontap;

  const BookTile({
    super.key,
    required this.title,
    required this.coverUrl,
    required this.author,
    required this.price,
    required this.rating,
   // required this.totalRating,
    required this.ontap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color:Theme.of(context).colorScheme.primary?.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(children: [
                           Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: Offset(2, 2),
                        
                                  )
                                ]
                              ),
                              child: ClipRRect
                              (
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(coverUrl,width: 100,)),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(title,style: Theme.of(context).textTheme.bodyMedium,maxLines: 2,),
                                  SizedBox(height: 6,),
                                  Text("BY : $author",style: Theme.of(context).textTheme.labelMedium,),
                                  SizedBox(height: 6,),
                                  Text("price: $price",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.secondary)),
                                  SizedBox(height: 6,),
                                  Row(
                                    children: [
                                    SvgPicture.asset("assets/Icons/star.svg"),
                                    SizedBox(width: 4,),
                                    Text(rating),
                                     SizedBox(width: 4,),
                                  //  Text("($totalRating rating)",style: Theme.of(context).textTheme.labelMedium,)
                                    ],
                                  )
                                  
                                ],
                              ),
                            )
                        ],),
                      ),
    );
  }
}