import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.child,
    this.color,
    this.backgroundImage,
    this.border,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    this.height,
    this.width,
    this.sectionKey,
    this.padding,
    this.margin,
    this.onTap,
    this.decoration,
  });
  final Widget child;
  final Color? color;
  final DecorationImage? backgroundImage;
  final BoxBorder? border;
  final double? height;
  final double? width;
  final BoxShape shape;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final BoxDecoration? decoration;

  final GlobalKey? sectionKey;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {},
      onTap: onTap,
      child: Container(
        key: sectionKey,
        padding: padding,
        margin: margin,
        height: height,
        width: width,
        decoration: decoration ??
            BoxDecoration(
                color: color,
                borderRadius: borderRadius,
                border: border,
                image: backgroundImage,
                shape: shape),
        child: child,
      ),
    );
  }
}
