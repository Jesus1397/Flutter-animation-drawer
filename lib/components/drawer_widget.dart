import 'package:flutter/material.dart';

import 'item_animation_widget.dart';
import 'logo_animation_widget.dart';
import 'profile_animation_widget.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  var isExpanded = false;
  Duration duration = const Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: duration,
      margin: const EdgeInsets.only(top: 20, left: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      width: isExpanded ? size.width * 0.8 : size.width * 0.22,
      height: size.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: LogoAnimationWidget(
              duration: duration,
              text: 'FlyCompany',
              isExpanded: isExpanded,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Divider(color: Colors.grey, thickness: 1),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemAnimationWidget(
                  isExpanded: isExpanded,
                  duration: duration,
                  text: 'Home',
                  icon: Icons.home,
                ),
                const SizedBox(height: 25),
                ItemAnimationWidget(
                  isExpanded: isExpanded,
                  duration: duration,
                  text: 'Calendar',
                  icon: Icons.calendar_today,
                ),
                const SizedBox(height: 25),
                ItemAnimationWidget(
                  isExpanded: isExpanded,
                  duration: duration,
                  text: 'Destinations',
                  icon: Icons.pin_drop_rounded,
                  isArrow: true,
                ),
                const SizedBox(height: 25),
                ItemAnimationWidget(
                  isExpanded: isExpanded,
                  duration: duration,
                  text: 'Messages',
                  icon: Icons.message,
                  isNotification: true,
                  notiNumber: '8',
                ),
                const SizedBox(height: 25),
                ItemAnimationWidget(
                  isExpanded: isExpanded,
                  duration: duration,
                  text: 'Weather',
                  icon: Icons.cloud,
                  isArrow: true,
                ),
                const SizedBox(height: 25),
                ItemAnimationWidget(
                  isExpanded: isExpanded,
                  duration: duration,
                  text: 'Flights',
                  icon: Icons.airplane_ticket,
                  isArrow: true,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Divider(color: Colors.grey, thickness: 1),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              children: [
                ItemAnimationWidget(
                  isExpanded: isExpanded,
                  duration: duration,
                  text: 'Notifications',
                  icon: Icons.notifications,
                  isNotification: true,
                  notiNumber: '2',
                ),
                const SizedBox(height: 15),
                ItemAnimationWidget(
                  isExpanded: isExpanded,
                  duration: duration,
                  text: 'Settings',
                  icon: Icons.settings,
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
          ProfileWidget(duration: duration, isExpanded: isExpanded, size: size),
          const SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: AnimatedContainer(
                alignment:
                    isExpanded ? Alignment.centerRight : Alignment.center,
                duration: duration,
                child: Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_left_rounded
                      : Icons.keyboard_arrow_right_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
