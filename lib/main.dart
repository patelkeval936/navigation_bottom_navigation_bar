import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation/transitions.dart';
import 'ios.dart';
import 'navigation_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.orange,
      // ),

      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context)=>const MyHomePage(),
        'nav' : (context)=>const NavigationExample(),
        'a' : (context)=>const A(),
        'b' : (context)=>const B(),
        'c' : (context)=>const C(),
        'd' : (context)=>const D(),
        'e' : (context)=>const E(),
      },

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    //print('build homepage');
    super.initState();
  }


  @override
  void dispose() {
    //print('dispose homepage');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Navigator.of(context).canPop() ? IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)) : Container(),
        title: const Text('HomePage'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const NavigationExample()));
                  // Navigator.of(context).pushNamed('nav');
                },
                child: const  Text('Navigator Example'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const Page2();
                      },
                    ),
                  );
                },
                child: const Text('Material Transition'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (BuildContext context) {
                        return const Page2();
                      },
                    ),
                  );
                },
                child: const Text('Cupertino Transition'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(SlideRightRoute(const  Page2()));
                },
                child: const Text('Slide Transition'),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(ScaleRoute(const Page2()));
                  },
                  child: const Text('Scale Transition')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(RotationRoute(const Page2()));
                  },
                  child: const Text('Rotation Transition')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(EnterExitRoute(widget, const Page2()));
                  },
                  child: const Text('Enter Exit Transition')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const IosWidgets()));
                  },
                  child: const Text('Cupertino Widgets'),
              ),


              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder : (context)=>const Page2()));
                },
                child: Hero(
                  tag: 'my_image',
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.network('https://media.gettyimages.com/id/1347739253/vector/logistics-technology-abstract-networking-connections-background.jpg?s=2048x2048&w=gi&k=20&c=TftwLF2dvvuIzuTr4ZYL05sGbJTncLP-IlzLS73ARro='),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  void maybePop() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      //do nothing
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
        backgroundColor: Colors.green.shade200,
        appBar: AppBar(
            title: const  Text('Page 2'),
            automaticallyImplyLeading: false,
            leading: Navigator.of(context).canPop()
                ? IconButton(
                    onPressed: () async {
                      //print(await Navigator.of(context).maybePop());
                      Navigator.of(context).canPop();
                    },
                    icon: const Icon(Icons.arrow_back))
                : Container()),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'my_image',
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.network('https://media.gettyimages.com/id/1347739253/vector/logistics-technology-abstract-networking-connections-background.jpg?s=2048x2048&w=gi&k=20&c=TftwLF2dvvuIzuTr4ZYL05sGbJTncLP-IlzLS73ARro='),
                  ),
                ),
                 Text(data.toString()),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Go Back'))
              ],
            ),
          ),
        ));
  }
}
