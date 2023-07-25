import 'package:flutter/material.dart';

void main() {
  List<Some> list = [Some(0,0),Some(1,1)];

    for (int i = 0; i < list.length; i++) {
      //Case 1
      var val = list[i];
      val.a = 100;
      val.b = 10;
    }

    // for (int i = 0; i < list.length; i++) {
    //   //Case 2
    //   list[i].a = 100;
    //   list[i].b = 50;
    // }
  print(list.map((e) => e.a).toList());
}
class Some{
  int a;
  int b;
  Some(this.a,this.b);
}

class IndexedStackApp extends StatefulWidget {
  const IndexedStackApp({super.key});

  @override
  State<IndexedStackApp> createState() => _IndexedStackAppState();
}

class _IndexedStackAppState extends State<IndexedStackApp> {

  int selectedIndex = 0;

  List<GlobalKey<NavigatorState>> keysForTabs = [GlobalKey<NavigatorState>(), GlobalKey<NavigatorState>(), GlobalKey<NavigatorState>()];

  Route<dynamic>? onGenerate(setting) {
    String? name = setting.name;
    switch (name) {
      case 'a':
        return MaterialPageRoute(builder: (context) => A());
      case 'b':
        return MaterialPageRoute(builder: (context) => const B());
      case 'c':
        return MaterialPageRoute(builder: (context) => const C());
      case 'd':
        return MaterialPageRoute(builder: (context) => const D());
      case 'e':
        return MaterialPageRoute(builder: (context) => const E());
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(title: const  Text('Instagram')),
          body: IndexedStack(
            index: selectedIndex,
            children: [
              Navigator(
                key: keysForTabs[0],
                initialRoute: 'a',
                onGenerateRoute: onGenerate,
              ),
              Navigator(
                key: keysForTabs[1],
                initialRoute: 'a',
                onGenerateRoute: onGenerate,
              ),
              Navigator(
                key: keysForTabs[2],
                initialRoute: 'a',
                onGenerateRoute: onGenerate,
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: InkWell(
                    onDoubleTap: () {
                      keysForTabs[0].currentState?.popUntil((route) => route.isFirst);
                    },
                    child: const Icon(Icons.image),
                  ),
                  label: 'Image'),
              BottomNavigationBarItem(
                  icon: InkWell(
                    onDoubleTap: () {
                      keysForTabs[1].currentState?.popUntil((route) => route.isFirst);
                    },
                    child:const  Icon(Icons.video_call),
                  ),
                  label: 'Video'),
              BottomNavigationBarItem(
                  icon: InkWell(
                    onDoubleTap: () {
                      keysForTabs[2].currentState?.popUntil((route) => route.isFirst);
                    },
                    child:const  Icon(Icons.movie_creation_outlined),
                  ),
                  label: 'Movie'),
            ],
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ));
  }
}

class A extends StatefulWidget {
  A({Key? key}) : super(key: key);

  @override
  State<A> createState() => _AState();
}

class _AState extends State<A> {
  @override
  void deactivate() {
    //print('deactivate A');
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    //print('build run A');

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('b');
                },
                child: const Text('Screen A')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Pop')),
          ],
        ),
      ),
    );
  }
}

class B extends StatefulWidget {
  const B({Key? key}) : super(key: key);

  @override
  State<B> createState() => _BState();
}

class _BState extends State<B> {
  @override
  void deactivate() {
    //print('deactivate B');
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    //print('build run B');

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('c');
                },
                child: const Text('Screen B')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop('return from screen B');
                },
                child: const Text('Pop')),
          ],
        ),
      ),
    );
  }
}

class C extends StatefulWidget {
  const C({Key? key}) : super(key: key);

  @override
  State<C> createState() => _CState();
}

class _CState extends State<C> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    //print('deactivate C');
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    //print('build run C');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('hello'),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('d');
                },
                child: const Text('Screen C')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('pop')),
          ],
        ),
      ),
    );
  }
}

class D extends StatefulWidget {
  const D({Key? key}) : super(key: key);

  @override
  State<D> createState() => _DState();
}

class _DState extends State<D> {
  @override
  void dispose() {
    super.dispose();
    //print('dispose D');
  }

  @override
  Widget build(BuildContext context) {
    //print('build run D');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('e');
                },
                child: const Text('Screen D')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Pop')),
          ],
        ),
      ),
    );
  }
}

class E extends StatefulWidget {
  const E({Key? key}) : super(key: key);

  @override
  State<E> createState() => _EState();
}

class _EState extends State<E> {
  @override
  void deactivate() {
    //print('deactivate E');
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    //print('build run E');
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Screen E')),
      ),
    );
  }
}
