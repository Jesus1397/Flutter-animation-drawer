import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
    required this.duration,
    required this.isExpanded,
    required this.size,
  });

  final Duration duration;
  final bool isExpanded;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      width: isExpanded ? size.width * 0.8 : size.width * 0.20,
      height: size.height * 0.12,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xff2C2C2C),
        borderRadius: BorderRadius.all(
          Radius.circular(22),
        ),
      ),
      child: AnimatedSwitcher(
        duration: duration,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: SizeTransition(
              sizeFactor: animation,
              axis: Axis.horizontal,
              child: child,
            ),
          );
        },
        child: isExpanded
            ? const Row(
                key: ValueKey<bool>(true),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage(
                        'assets/pana_miguel.jpg',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jesus Avendaño',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          maxLines: 1,
                        ),
                        SizedBox(height: 5),
                        Text(
                          '@Jesus1397',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                          maxLines: 1,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.logout, color: Colors.white),
                  ),
                ],
              )
            : const Column(
                key: ValueKey<bool>(false),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/pana_miguel.jpg',
                    ),
                  ),
                  Icon(Icons.logout, color: Colors.white),
                ],
              ),
      ),
    );
  }
}
