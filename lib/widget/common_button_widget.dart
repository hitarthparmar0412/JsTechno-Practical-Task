import 'package:flutter/material.dart';

class CommonButtonWidget extends StatefulWidget {
  const CommonButtonWidget({
    Key? key,
    required this.onTap,
    required this.text,
    this.buttonColor,
    this.textColor,
    this.boxShadow,
    this.border,
    this.fontWeight,
    this.fontSize,
    this.padding,
    this.image,
    this.maxwidth,
    this.innerPaddding,
    this.borderRadius,
  }) : super(key: key);
  final Function() onTap;
  final String text;
  final Color? buttonColor;
  final Color? textColor;
  final List<BoxShadow>? boxShadow;
  final Border? border;
  final FontWeight? fontWeight;
  final double? fontSize;
  final EdgeInsets? padding;
  final String? image;
  final double? maxwidth;
  final EdgeInsets? innerPaddding;
  final BorderRadiusGeometry? borderRadius;

  @override
  State<CommonButtonWidget> createState() => _CommonButtonWidgetState();
}

class _CommonButtonWidgetState extends State<CommonButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          constraints: (widget.maxwidth != null) ? BoxConstraints(maxWidth: widget.maxwidth!) : null,
          padding: widget.innerPaddding ?? const EdgeInsets.all(13),
          decoration: BoxDecoration(
            border: widget.border,
            color: widget.buttonColor ?? Colors.blue,
            borderRadius: widget.borderRadius ??
                const BorderRadius.all(
                  Radius.circular(8),
                ),
            boxShadow: widget.boxShadow,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.image != null) ...[
                SizedBox(
                  height: 20,
                  width: 20,
                  child: widget.image != null ? Image.asset(widget.image!) : const SizedBox(),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
              Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: widget.fontSize ?? 15,
                  fontWeight: widget.fontWeight ?? FontWeight.w500,
                  color: widget.textColor ?? Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
