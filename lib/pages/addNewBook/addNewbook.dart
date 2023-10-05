import 'package:ebook_app/components/backButton.dart';
import 'package:ebook_app/components/booktile.dart';
import 'package:ebook_app/components/multilinetextformField.dart';
import 'package:ebook_app/components/myTextformField.dart';
import 'package:ebook_app/config/colors.dart';
import 'package:ebook_app/controller/bookController.dart';
import 'package:ebook_app/controller/pdfController.dart';
import 'package:ebook_app/models/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewBookPage extends StatelessWidget {
  const AddNewBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller =TextEditingController();
    PdfController pdfController = Get.put(PdfController());
    BookController bookController = Get.put(BookController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
      
          children: [
          
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
              color:Theme.of(context).colorScheme.primary ,
              
             
      // height: 400,
              width: MediaQuery.of(context).size.width,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                         Text("Add new book",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: backgroudColor),),
                         SizedBox(width: 
                         50,)
                         
                          
                        ],
                      ),
                        SizedBox(height: 80,),
                       
                         InkWell(
                          onTap: () {
                            bookController.pickImage();
                          },
                           child: Obx(() => Container(
                            height: 190,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).colorScheme.background
                            ),
                            child:Center(
                              child: bookController.isImageUploading.value? CircularProgressIndicator(
                                color: primaryColor,
                              ):bookController.imageUrl.value == ""?Image.asset("assets/Icons/addImage.png"):
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(bookController.imageUrl.value,fit: BoxFit.cover,))
                            ),
                           ),)
                         ),
                        
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
                 Row(children: [
                   Expanded(
                    child: Obx(() => Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: bookController.pdfUrl.value==""?Theme.of(context).colorScheme.primary:Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: bookController.isPdfUploading.value?Center(
                        child: CircularProgressIndicator(
                          color: backgroudColor,
                        ),
                      ):
                      bookController.pdfUrl.value == ""?
                      InkWell(
                        onTap: () {
                        bookController.pickPDF();
                      },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                                "assets/Icons/upload.png"),
                                            
                            SizedBox(width: 6,),
                        Text("Book Pdf",style:Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.background))
                                          
                                          ],),
                      ):InkWell(
                        onTap: () {
                          bookController.pdfUrl.value = "";
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                                "assets/Icons/delete.png",width: 20,),
                                            
                            SizedBox(width: 6,),
                        Text("Delette Pdf",style:Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.primary))
                                          
                                          ],),
                      ),
                    ),),
                  ),
                 
                 ],),
                  SizedBox(height: 10,),
                 MyTextFormField(
                  hintText:"Book Title",
                   icon: Icons.book,
                    controller: bookController.title),
                    SizedBox(height: 10,),
                     MultiTextFormField(
                      hintText: "Book Description",
                         controller: bookController.des),
                       SizedBox(height: 10,),

                     MyTextFormField(
                  hintText:"Author Name",
                   icon: Icons.person,
                    controller: bookController.auth),
                    SizedBox(height: 10,),
                      MyTextFormField(
                  hintText:"About Author",
                   icon: Icons.person,
                    controller: bookController.aboutAuth),
                    SizedBox(height: 10,),

                   

                    Row(children: [
                      Expanded(child: 
                       MyTextFormField(
                  hintText:"Price",
                  isNumber: true,
                   icon: Icons.currency_rupee,
                    controller: bookController.price),
                    
                      ),
                     SizedBox(width: 10,),
                      Expanded(child: 
                       MyTextFormField(
                  hintText:"Pages",
                  isNumber: true,
                   icon: Icons.book,
                    controller: bookController.pages),
                    
                      )
                    ],),
                     SizedBox(height: 10,),
                      Row(children: [
                      Expanded(child: 
                       MyTextFormField(
                  hintText:"Language",
                   icon: Icons.language,
                    controller: bookController.language),
                    
                      ),
                     SizedBox(width: 10,),
                      Expanded(child: 
                       MyTextFormField(
                  hintText:"Audio length",
                   icon: Icons.audiotrack,
                    controller: bookController.audioLen),
                    
                      )
                    ],),
                     SizedBox(height: 20,),

                   
                 Row(children: [
                   
                  SizedBox(width: 10,),
                   Expanded(
                    child: Obx(() => Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary?.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child:bookController.isPostUploading.value ?Center(child: CircularProgressIndicator(

                      ),):
                       InkWell(
                        onTap: () {
                          bookController.createBook();
                        },
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.upload,color: Theme.of(context).colorScheme.background),
                            SizedBox(width: 6,),
                                               Text("Post",style:Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.background))
                                             
                                             ],),
                       ),
                    ),)
                  ),
                 ],),
                   

                    

                    
                    
            
                ],
              ),
            )
          ],
        ),
    ));
  }
}