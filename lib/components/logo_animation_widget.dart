import 'package:flutter/material.dart';

class LogoAnimationWidget extends StatelessWidget {
  final Duration duration;
  final String text;
  final bool isExpanded;

  const LogoAnimationWidget({
    super.key,
    required this.duration,
    required this.text,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const FlutterLogo(),
        AnimatedContainer(
          padding: const EdgeInsets.only(left: 15),
          duration: duration,
          width: isExpanded ? size.width * 0.6 : 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (isExpanded)
                Expanded(
                  flex: 4,
                  child: Text(
                    'FlyCompany',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: isExpanded ? 18 : 0.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              if (isExpanded)
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: isExpanded ? 24.0 : 0.0,
                    ),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
