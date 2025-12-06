import 'package:flutter/material.dart';
import 'package:todo_riverpod/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const HomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.task_alt,size: 80, color: Colors.blue,),
          const SizedBox(height: 20,),
          
          Text("Splash Screen"),
          const SizedBox(height: 20,),
          const CircularProgressIndicator()
        ],
      ),),
    );
  }
}
