import 'package:flutter/material.dart';
import 'package:minichat_project/core/shared_widgets/appbar_widget.dart';
import 'package:minichat_project/features/status/presentation/views/widgets/status_body.dart';


class StatusScreen  extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StatusBody(),
    );
  }
}
