import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:new_app/shared/widgets/app_bar_bottom_divider.dart';
import 'package:new_app/shared/widgets/app_bar_leading_arrow.dart';

class ViewPatientScreen extends StatefulWidget {
  const ViewPatientScreen({super.key});

  @override
  State<ViewPatientScreen> createState() => _ViewPatientScreenState();
}

class _ViewPatientScreenState extends State<ViewPatientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('view_patient'.tr),
        leading: const AppBarLeadingArrow(),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.5),
          child: AppBarBottomDivider(),
        ),
      ),
    );
  }
}
