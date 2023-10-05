import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String coverUrl;
  final String title;
  final VoidCallback onTap;

  const BookCard({super.key,required this.coverUrl,required this.onTap,required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.only(right:10.0),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
                        width: 120,
                        child: Column(children: [
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
                              child: Image.network(coverUrl,width: 120,)),
                          ),
                          SizedBox(height: 5,),
                          Text(title,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],),
                      ),
      ),
    );
  }
}