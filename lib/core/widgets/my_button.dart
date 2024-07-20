import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final Color? backGroudcolor;
  final TextStyle? textStyle;
  final double? verticalPadding;
  final double? circularBorderRadius;
  final double? minWidth;
  final double? height;
  final Widget? child;
  const MyButton({
    super.key,
    required this.onPressed,
    this.text,
    this.child,
    this.backGroudcolor,
    this.textStyle,
    this.verticalPadding,
    this.circularBorderRadius,
    this.minWidth,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height ?? 55.0,
      minWidth: minWidth ?? MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 8),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorderRadius ?? 16)),
      color: backGroudcolor ?? Colors.amber,
      child: child ??
          Text(
            text ?? "Click Here",
            style: textStyle ??
                const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
    );
  }
}
