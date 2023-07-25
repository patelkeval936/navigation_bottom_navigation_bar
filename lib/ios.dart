import 'package:flutter/cupertino.dart';

class IosWidgets extends StatelessWidget {
  const IosWidgets({super.key});


  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoTabScaffold(
        tabBuilder: (context, i) => Center(
          child: CustomScrollView(
            slivers: <Widget>[
              CupertinoSliverNavigationBar(
                automaticallyImplyLeading: true,
                largeTitle: i == 0 ? const Text("Phone") : const Text('Chat'),
              ),
              SliverFillRemaining(
                child: Center(
                  child: i == 0 ? const Text("Phone") : const Text('Chat'),
                ),
              )
            ],
          ),
        ),
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone), label: "Phone", backgroundColor: CupertinoColors.activeBlue),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.conversation_bubble), label: "Chat")
          ],
        ),
      ),
    );
  }
}
