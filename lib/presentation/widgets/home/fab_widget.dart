import 'package:safepet/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class FabWidget extends StatelessWidget {
  final void Function()? onPressed;
  final IconData iconData;
  final bool isMini;
  const FabWidget({
    Key? key,
    required this.onPressed,
    required this.iconData,
    required this.isMini,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: isMini,
      backgroundColor: AppColors.black,
      onPressed: onPressed,
      child: Icon(iconData),
    );
  }
}
