import 'package:flutter/material.dart';

import '../../../../../core/shared_widgets/default_text_field.dart';

class EmailField  extends StatelessWidget {
   const EmailField({super.key, required this.emailController});
final TextEditingController emailController ;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: defaultTextField(

        labelText: "enter your email",
        hintText: "your email",
        controller: emailController,
        icon: Icons.email,
        type: TextInputType.emailAddress,
        validator: (val){
          if(val!.isEmpty || val ==null){
            return "Please enter your email";
          }
            return "" ;

        }

      ),
    );
  }
}
