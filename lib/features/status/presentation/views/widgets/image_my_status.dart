import 'package:flutter/material.dart';
import 'package:minichat_project/core/themes/colors.dart';
import 'package:minichat_project/features/status/presentation/views/widgets/image_status_widget.dart';

class ImageMyStatus  extends StatelessWidget {
  const ImageMyStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageStatusWidget(),
        Positioned(
          bottom:.5,
            right: .5,
            child:  CircleAvatar(
              radius: 12,
              backgroundColor: ColorsApp.green,
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
                ),
                child: Center(
                  child: Icon(Icons.add,color: ColorsApp.green,size: 20,),
                ),
              ),
            )
        ),
      ]


    );
  }
}
