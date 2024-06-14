import 'package:flutter/material.dart';

class ItemAnimationWidget extends StatelessWidget {
  final bool isExpanded;
  final Duration duration;
  final String text;
  final IconData icon;
  final bool isNotification;
  final bool isArrow;
  final String notiNumber;

  const ItemAnimationWidget({
    super.key,
    required this.isExpanded,
    required this.duration,
    required this.text,
    required this.icon,
    this.isNotification = false,
    this.isArrow = false,
    this.notiNumber = '1',
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white),
        AnimatedContainer(
          duration: duration,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 30),
          width: isExpanded ? MediaQuery.of(context).size.width * 0.60 : 0.0,
          height: 16,
          child: AnimatedOpacity(
            opacity: isExpanded ? 1.0 : 0.0,
            duration: duration,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                if (!isNotification)
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                if (isNotification)
                  Expanded(
                    flex: 1,
                    child: AnimatedOpacity(
                      opacity: isExpanded ? 1.0 : 0.0,
                      duration: duration,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 30,
                          decoration: const BoxDecoration(
                            color: Color(0xffCF91DA),
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              notiNumber,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (!isArrow)
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                if (isArrow)
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: AnimatedOpacity(
                        opacity: isExpanded ? 1.0 : 0.0,
                        duration: duration,
                        child: const SizedBox(
                          width: 30,
                          child: Icon(
                            Icons.chevron_right_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
