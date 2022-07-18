import 'package:flutter/material.dart';
import 'package:flutter_youtubemusic_ui/view/screen/login_screen.dart';
import 'package:flutter_youtubemusic_ui/view/widget/widget_track_in_list.dart';
import 'package:provider/provider.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TrackChoice()),
    ],
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube music',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
