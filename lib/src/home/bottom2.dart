import 'dart:ui';

import 'package:flutter/material.dart';

import 'bottom_sheet.dart';

class _ExhibitionBottomSheetState extends State<ExhibitionBottomSheet>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller; //<-- Create a controller

  double get maxHeight =>
      MediaQuery.of(context).size.height; //<-- Get max height of the screen

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      //<-- initialize a controller
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    _controller!.dispose(); //<-- and remember to dispose it!
    super.dispose();
  }

  double? lerp(double min, double max) => lerpDouble(min, max,
      _controller!.value); //<-- lerp any value based on the controller

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      //<--add animated builder
      animation: _controller!,
      builder: (context, child) {
        return Positioned(
          height: lerp(minHeight,
              maxHeight), //<-- update height value to scale with controller
          left: 0,
          right: 0,
          bottom: 0,
          child: GestureDetector(
            //<-- add a gesture detector
            onTap: _toggle, //<-- on tap...
            child: Container(),
          ),
        );
      },
    );
  }

  void _toggle() {
    final bool isOpen = _controller!.status == AnimationStatus.completed;
    _controller!.fling(
        velocity: isOpen ? -2 : 2); //<-- ...snap the sheet in proper direction
  }
}
