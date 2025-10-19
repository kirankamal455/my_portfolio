import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomSocialIcon extends StatefulWidget {
  final IconData iconData;
  final VoidCallback? onTap;
  final double size;
  final Color? color; // changed to nullable
  final Color? hoverColor; // changed to nullable

  const CustomSocialIcon({
    super.key,
    required this.iconData,
    this.onTap,
    this.size = 37,
    this.color,
    this.hoverColor,
  });

  @override
  State<CustomSocialIcon> createState() => _CustomSocialIconState();
}

class _CustomSocialIconState extends State<CustomSocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final defaultColor = isDark ? Colors.white : Colors.black;
    final defaultHoverColor = isDark ? Colors.blue[300]! : Colors.blue;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: FaIcon(
          widget.iconData,
          size: widget.size,
          color: _isHovered
              ? (widget.hoverColor ?? defaultHoverColor)
              : (widget.color ?? defaultColor),
        ),
      ),
    ).pSymmetric(h: 8);
  }
}
