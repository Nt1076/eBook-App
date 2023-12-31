import 'package:flutter/material.dart';

class MultiTextFormField extends StatelessWidget {
  final String hintText;
  
  final TextEditingController controller;
  const MultiTextFormField({super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 5,
      controller: controller,

                  decoration: InputDecoration(
                    fillColor: Theme.of(context).colorScheme.primary?.withOpacity(0.2),
                    filled: true,
                    hintText: hintText,
                   
                    
                  ),
                 );
  }
}