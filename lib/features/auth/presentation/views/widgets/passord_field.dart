import 'package:flutter/material.dart';

import '../../../../../core/shared_widgets/default_text_field.dart';

class PasswordField  extends StatefulWidget {
   const PasswordField ({super.key, required this.passwordController});
final TextEditingController passwordController ;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
 bool isVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: defaultTextField(

          labelText: "enter your password",
          hintText: "your password",
          controller: widget.passwordController,
          icon: Icons.lock,
          type: TextInputType.visiblePassword,
          onChanged: (val){

          },
          validator: (val){
            if(val!.isEmpty || val ==null){
              return "Please enter your password";
            }
            return "" ;
          },
        obscureText: !isVisibility,
        suffix:isVisibility? Icons.visibility:Icons.visibility_off,
        onPressed: (){
            setState(() {
              isVisibility = !isVisibility;
            });
        }

      ),
    );
  }
}
