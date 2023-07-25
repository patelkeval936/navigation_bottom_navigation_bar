import 'package:flutter/material.dart';

class NavigationExample extends StatefulWidget {
  const NavigationExample({Key? key}) : super(key: key);

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
            Navigator.of(context).pushNamed('a');
              //print('result in class Navigation : $result');
            }, child: const Text('Navigator Example')),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: const Text('pop')),
          ],
        ),
      ),
    );
  }
}

class A extends StatefulWidget {
  const A({Key? key}) : super(key: key);

  @override
  State<A> createState() => _AState();
}

class _AState extends State<A> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
            Navigator.of(context).pushNamed('b');
              //print('result in class A : $result');
            }, child: const Text('Screen A')),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop('return from screen A');
            }, child: const Text('Pop')),
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
        Navigator.of(context).pushNamed('c');
            }, child: const Text('Screen B')),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop('return from screen B');
            }, child: const Text('Pop')),
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
            ElevatedButton(onPressed: (){
            Navigator.of(context).pushNamed('d');
              }, child: const Text('Screen C')),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop('return from screen c');
            }, child: const Text('pop')),
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
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed('e');
            }, child: const Text('Screen D')),

            ElevatedButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: const Text('Pop')),

            ElevatedButton(onPressed: (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const NavigationExample()), (route){
                //print(route);
                return route.settings.name == 'a';
              });
            }, child: const Text('Push and remove until B')),

            ElevatedButton(onPressed: (){
              Navigator.of(context).popAndPushNamed('a');
            }, child: const Text('Pop and push named to A')),

            ElevatedButton(onPressed: (){
              Navigator.of(context).popUntil(ModalRoute.withName('nav'));
            }, child: const Text('Pop until Nav')),

            ElevatedButton(onPressed: (){

              Navigator.of(context).popUntil((route) => route.settings.name == 'a');
             }, child: const Text('pop untill A'),
            ),
            ElevatedButton(onPressed: (){
             // Navigator.of(context).replace(oldRoute: MaterialPageRoute(builder: (context)=>D()),
             //     newRoute: MaterialPageRoute(builder: (context)=>C()));
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.of(context).removeRoute(MaterialPageRoute(builder: (context)=>B()));
              });
            // Navigator.of(context).removeRouteBelow(MaterialPageRoute(builder: (_)=>B()));


            }, child: const Text('pop untill A'),
            ),
            ElevatedButton(onPressed: (){
              //print(Navigator.of(context).restorationId);
             }, child: const Text('dispose'),
            ),
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
        child: ElevatedButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: const Text('Screen E')),
      ),
    );
  }
}
