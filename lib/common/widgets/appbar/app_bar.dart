import 'package:flutter/material.dart';
import 'package:spotify/common/helper/is_dark_mode.dart';
import 'package:spotify/common/helper/navigator.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool hideBack;
  final Widget? action;
  final Widget? leadingWidget;
  const BasicAppBar({
    super.key,
    this.title,
    this.hideBack = false,
    this.action,
    this.leadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 1,
      shadowColor: Colors.black,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: title ?? const Text(''),
      titleTextStyle: TextStyle(
        color: context.isDarkMode ? const Color(0xffDDDDDD) : Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      leading: hideBack
          ? leadingWidget
          : IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.isDarkMode
                      ? Colors.white.withOpacity(0.03)
                      : Colors.black.withOpacity(0.04),
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 17,
                  color: context.isDarkMode
                      ? const Color(0xffDDDDDD)
                      : const Color(0xff414141),
                ),
              ),
            ),
      actions: [
        action ?? Container(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
