import 'package:exam_app/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Sign In'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 50.0,),
              Container(child:
                Lottie.asset('assets/animation_lo7eeonw.json'),
                height: 300.0,
                alignment: Alignment.center,
              ),
              SizedBox(height: 50.0,),
              Text("Halo Selamat Datang", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.7,
              ),
              Text("Selamat Datang di Aplikasi Mari belajar disini kita akan berlatih untuk menjawab soal", style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                color: Color(0xff78827a)
              ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: 'Masukkan Email',
                      enabledBorder: OutlineInputBorder()
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  obscureText: true, autocorrect: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password_outlined),
                    suffixIcon: Icon(Icons.visibility),
                    hintText: 'Masukkan Password',
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>home()));
                  },
                  child: Text('Login')
              ),
              SizedBox(height: 10.0),
              GestureDetector(
                onTap: (){},
                child: Container(
                  child : InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text('Lupa Password?'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              GestureDetector(
                onTap: (){},
                child: Container(
                  child :InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text('Tidak Punya Akun? Yuk Daftar'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
