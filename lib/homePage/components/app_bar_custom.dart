import 'package:flutter/material.dart';

class AppBarCustom extends StatefulWidget {
  const AppBarCustom({Key? key, required this.title, this.search, this.button})
      : super(key: key);

  final Widget? button;
  final Widget? search;
  final String title;

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(39))),
      actions: [if (widget.button != null) widget.button!],
      elevation: 12,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        padding: const EdgeInsets.only(top: 20),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(242, 117, 212, 8),
                Color.fromARGB(104, 14, 161, 9),
              ]),
        ),
        child: Center(
          child: widget.search != null
              ? widget.search!
              : Text(
                  widget.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: "Hack",
                    fontSize: 30.0,
                  ),
                ),
        ),
      ),
    );
  }
}
