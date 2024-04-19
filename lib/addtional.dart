import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Password in Login and signup page

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
              ),
              // Add other input fields (e.g., email) as needed
              // Add login button and other UI components
            ],
          ),
        ),
      ),
    );
  }
}


// Redirect in login and signup page

// TextButton(
//                       style: ButtonStyle(
//                         foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
//                         overlayColor: MaterialStateProperty.resolveWith<Color?>(
//                               (Set<MaterialState> states) {
//                             if (states.contains(MaterialState.hovered))
//                               return Colors.blue.withOpacity(0.04);
//                             if (states.contains(MaterialState.focused) ||
//                                 states.contains(MaterialState.pressed))
//                               return Colors.blue.withOpacity(0.12);
//                             return null; // Defer to the widget's default.
//                           },
//                         ),
//                       ),
//                       onPressed: () { },
//                       child: Text('TextButton')


// 
//
//
// home: Scaffold(
// backgroundColor: CustomColors.lightPrimary,
// body: SingleChildScrollView(
// child: Column(
// children: [
// Image.asset('./assets/Fantasy_Ethiopia_Logo_Transparent.png',
// width: 350,
// height: 350,
// ),
// Container(
// decoration: const BoxDecoration(
// borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
// color: Colors.white,
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// const Padding(
// padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
// child: Text("Login",
// style: StyledText.loginStyle,
// ),
// ),
// const Padding(
// padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
// child: Text("Please sign in to continue",
// style: TextStyle(
// fontWeight: FontWeight.w500,
// fontSize: 20.0
// ),
// ),
// ),
// SizedBox(
// height: 15.0,
// ),
// TextFieldWithIcon("EMAIL", Icons.email_outlined),
// TextFieldWithIcon("PASSWORD", Icons.lock_open_outlined),
//
// const SizedBox(
// height: 20.0,
// ),
// const AuthButton("LOGIN "),
// const BottomText("Don't you have an account?", "Sign Up")
//
//
// ]
// ),
// ),
// ),
// ),
// ),
// );
// }
// }