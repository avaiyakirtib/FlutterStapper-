import 'package:flutter/material.dart';
import 'package:fluttertest/Commons/GetSize.dart';
import 'package:fluttertest/Commons/colors.dart';

class BaseIndicator extends StatelessWidget {
  /// Whether this indicator is selected or not.
  final bool isSelected;

  /// The child to be placed within the indicator.
  final Widget? child;

  /// Action to be taken when this indictor is pressed.
  final Function? onPressed;
  final String? lable;

  /// Color of this indicator when it is not selected.
  final Color? color;

  /// Color of this indicator when it is selected.
  final Color? activeColor;

  /// Border color of this indicator when it is selected.
  final Color? activeBorderColor;
  final Color? unactiveBorderColor;

  /// The border width of this indicator when it is selected.
  final activeBorderWidth;
  final unactiveBorderWidth;

  /// Radius of this indicator.
  final double radius;

  /// The amount of padding around each side of the child.
  final double padding;

  /// The amount of margin around each side of the indicator.
  final double margin;

  final BoxBorder? border;
  final double? lablePadding;

  BaseIndicator({
    this.isSelected = false,
    this.child,
    this.border,
    this.lable,
    this.onPressed,
    this.color,
    this.lablePadding,
    this.activeColor,
    this.activeBorderColor,
    this.unactiveBorderColor,
    this.unactiveBorderWidth =1.0,
    this.radius = 24.0,
    this.padding = 5.0,
    this.margin = 1.0,
    this.activeBorderWidth = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed as void Function()?,
          child: child
        ),
        SizedBox(height:lablePadding?? h.h2,),
        Text(lable!,style:TextStyle(color: black,
            fontSize: sp.sp9,
            fontWeight: FontWeight.bold,
          letterSpacing: 0.5

        ))
      ],
    );
  }
}
