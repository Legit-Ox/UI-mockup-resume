import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIcon extends StatefulWidget {
  const SocialIcon(
      {super.key, required this.onHoverBackground, required this.icon});
  final Color onHoverBackground;
  final String icon;

  @override
  State<SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: MouseRegion(
        onEnter: (details) => setState(() => isHover = true),
        onExit: (details) => setState(() {
          isHover = false;
        }),
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: isHover
                  ? widget.onHoverBackground
                  : const Color.fromARGB(255, 38, 36, 38),
              borderRadius: const BorderRadius.all(Radius.circular(1000))),
          child: SvgPicture.asset(
            widget.icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
