import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelfreak_playstore/display.dart';
import 'package:travelfreak_playstore/login.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';
import 'package:uuid/uuid.dart';

import 'admanager.dart';
import 'func.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  const FirebaseOptions firebaseOptions = FirebaseOptions(
    projectId: "travelfreak-playstore",
    appId: "1:237893749545:android:9b26aec71671121d1bc538",
    apiKey: "AIzaSyDl9RH2TaZHsqInVXXAisBMhNsjSz_JcwY",
    messagingSenderId: "237893749545",
  );

  await Firebase.initializeApp(
    //name: "name", //<-- THIS IS DID THE TRICK FOR ME
    options: firebaseOptions,
  );

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  FlutterNativeSplash.remove();


  MobileAds.instance.initialize();
  await UnityAds.init(
    gameId: '5685713',
    onComplete: () => print('Initialization Complete'),
    onFailed: (error, message) => print('Initialization Failed: $error $message'),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TravelFreak',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      home: (FirebaseAuth.instance.currentUser != null) ? Display() : Login(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var location = TextEditingController();
  var username = TextEditingController();
  var describe = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  var Value;
  var email = "";
  bool isConnected = false;
  final GlobalKey<FormState> _key1 = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  StreamSubscription? _internetSubscription;
  late BannerAd _bannerAd;
  bool _isAdLoaded = false;

  var udid = Uuid().v1();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    enter();
    _initBannerAd();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      await AdsManager.loadUnityAD();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void enter ()async{
    SharedPreferences spb = await SharedPreferences.getInstance();
    email = spb.getString('EI').toString();
    setState(() {

    });
  }
  _initBannerAd(){
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-4220179663363363/8249000693',
      listener: BannerAdListener(
        onAdLoaded: (ad){
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad,error){},
      ),
      request: AdRequest(),
    );
    _bannerAd.load();
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          children: [
            Text("Travel",style: TextStyle(fontFamily: 'TitleFont',fontWeight: FontWeight.bold,color: Colors.brown),),
            Text("Freak",style: TextStyle(fontFamily: 'TitleFont',fontWeight: FontWeight.bold,color: Colors.amber),),
          ],
        ),
      ),
      body:SingleChildScrollView(
        child: Form(
          key: _key1,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: location,
                  validator: (Value){
                    if(Value!.isEmpty){
                      return"Enter the name of the place";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    labelText: "Enter the name of the place",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: username,
                  validator: (Value){
                    if(Value!.isEmpty){
                      return"Enter your name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    labelText: "Enter your name",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: describe,
                  validator: (Value){
                    if(Value!.isEmpty){
                      return"Enter your description";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    labelText: "Enter your description",
                  ),
                  maxLines: 10,
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(11)
                ),
                child: TextButton(onPressed: () async{
                  if (_key1.currentState!.validate()){
                    try{
                      create(username.text.trim(), location.text.trim(), describe.text.trim(),email,_auth.currentUser!.uid,udid);
                      username.clear();
                      location.clear();
                      describe.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Post created!!"),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }catch(e){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Failed to upload the post"),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  }
                },child: Text("Save",style: TextStyle(fontSize: 24,color: Colors.black),),),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: _isAdLoaded ? Container(
        height: _bannerAd.size.height.toDouble(),
        width: _bannerAd.size.width.toDouble(),
        child: AdWidget(ad: _bannerAd,),
      ) : SizedBox(),
    );
  }
}
