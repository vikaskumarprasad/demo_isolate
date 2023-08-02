import 'package:flutter/material.dart';

const double minHeight = 120;

class ExhibitionBottomSheet extends StatefulWidget {
  @override
  _ExhibitionBottomSheetState createState() => _ExhibitionBottomSheetState();
}

class _ExhibitionBottomSheetState extends State<ExhibitionBottomSheet>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: minHeight,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        decoration: const BoxDecoration(
          color: Color(0xFF162A49),
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
      ),
    );
  }
}
