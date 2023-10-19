
import 'package:flutter/material.dart';

class AppBarBuild extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBuild({Key? key, this.showAction=false}) : super(key: key);
  final bool showAction;
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Text('Labhouse Radio'),
          ),
          Icon(Icons.radio)
        ],
      ) ,
      centerTitle: true,
      actions: !showAction
        ? null
        :[
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_rounded)
          )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}