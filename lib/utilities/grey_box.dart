import 'package:flutter/material.dart';

class GreyBox extends StatelessWidget {
  const GreyBox(
      {super.key,
      this.child,
      this.height,
      this.padding,
      this.margin,
      this.width,
      this.bgColor});
  final Widget? child;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(10),
      padding: padding ?? const EdgeInsets.all(8),
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: bgColor ?? const Color.fromARGB(255, 30, 27, 30),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: child,
    );
  }
}
