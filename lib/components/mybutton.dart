import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String btName;
  final Image image;
  
  final VoidCallback onTap;
  const PrimaryButton({super.key,required this.btName,required this.onTap, required this.image});

  @override
  Widget build(BuildContext context) {
    return  InkWell(

      onTap: onTap,
      child: Container(
              padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width/1.1,
            height: 50,
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary,borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: image),
                SizedBox(width: 10,),
                
                Text(btName,style:Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.background))],),
            ),
    );
  }
}