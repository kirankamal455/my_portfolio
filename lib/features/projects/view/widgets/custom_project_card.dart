import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

import 'back_card_side.dart';
import 'front_card_side.dart';

class CusotmProjectCard extends StatefulWidget {
  final String projectName;
  final String projectDescription;
  const CusotmProjectCard(
      {super.key, required this.projectName, required this.projectDescription});

  @override
  State<CusotmProjectCard> createState() => _CusotmProjectCardState();
}

class _CusotmProjectCardState extends State<CusotmProjectCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {},
      onHover: (isHovering) {
        if (isHovering) {
          setState(() {
            isHover = true;
          });
        } else {
          setState(() {
            isHover = false;
          });
        }
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: VxBox(
          child: isHover
              ? FrontCardSide(
                  ProjectDescription: widget.projectDescription,
                )
              : BackCardSide(
                  ProjectName: widget.projectName,
                ),
        )
            .withDecoration(
              BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    offset: const Offset(0, 0),
                    color: Colors.black.withAlpha(100),
                  )
                ],
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            )
            .make()
            .h(200)
            .w(330),
      ),
    );
  }
}
