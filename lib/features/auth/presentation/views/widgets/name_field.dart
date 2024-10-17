import 'package:flutter/material.dart';

import '../../../../../core/shared_widgets/default_text_field.dart';

class NameField  extends StatelessWidget {
  const NameField({super.key, required this.nameController});
  final TextEditingController  nameController;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: defaultTextField(
        hintText: "your name",
        labelText: "enter your name",
        type: TextInputType.text,
        icon: Icons.person,
        controller: nameController,
          validator: (val){
            if(val!.isEmpty || val == null){
              return "Please enter your name";
            }
            return "" ;

          }
      ),
    );
  }
}
