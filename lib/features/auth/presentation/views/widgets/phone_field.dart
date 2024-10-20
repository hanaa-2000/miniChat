import 'package:flutter/material.dart';

import '../../../../../core/shared_widgets/default_text_field.dart';

class PhoneField  extends StatelessWidget {
  const PhoneField({super.key, required this.phoneController});
  final TextEditingController phoneController ;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: defaultTextField(

          labelText: "enter your phone",
          hintText: "your phone",
          controller: phoneController,
          icon: Icons.phone,
          type: TextInputType.phone,
          validator: (val){
            if(val!.isEmpty || val ==null){
              return "Please enter your phone";
            }
            return "" ;

          }

      ),
    );
  }
}
