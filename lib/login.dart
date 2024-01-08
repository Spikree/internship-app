import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
      ),
    );

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? _emailError;
  String? _passwordError;

  void clear() {
    setState(() {
      _emailError = null;
      _passwordError = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 243, 243, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(30))),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      const Text(
                        'VG Vishwa',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Container(
                          height: 170,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              promoCard('images/Vishwakarma_Institutes.png'),
                              const SizedBox(
                                width: 15,
                              ),
                              promoCard('images/Vishwakarma_University.png'),
                              const SizedBox(
                                width: 15,
                              ),
                              promoCard('images/Universal_Wisdom_School.jpg'),
                              const SizedBox(
                                width: 15,
                              ),
                              promoCard('images/Wisdom_World_School.jpg'),
                              const SizedBox(
                                width: 15,
                              ),
                              promoCard('images/Vishwakarma_Vidyalaya.png'),
                              const SizedBox(
                                width: 15,
                              ),
                              promoCard('images/EduplusNow.png'),
                              const SizedBox(
                                width: 15,
                              ),
                              promoCard('images/Aakar_Foundry.png'),
                              const SizedBox(
                                width: 15,
                              ),
                              promoCard('images/Bansilal_Cloth_Market.jpg'),
                              const SizedBox(
                                width: 15,
                              ),
                              promoCard('images/Eduplus_Campus.png'),
                              const SizedBox(
                                width: 15,
                              ),
                              promoCard('images/Vishwakarma_Publications.png'),
                              const SizedBox(
                                width: 15,
                              ),
                              promoCard('images/Roott_Square.png'),
                              const SizedBox(
                                width: 15,
                              ),
                              promoCard('images/Investronaut.png'),
                            ],
                          ),
                        ),
                      ),
                      const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(244, 243, 243, 1),
                            borderRadius: BorderRadius.circular(15)),
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.black87,
                            ),
                            hintText: "example@gmail.com",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                            errorText: _emailError,
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                                    .hasMatch(value)) {
                              setState(() {
                                _emailError = 'Enter a valid email address';
                              });
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(244, 243, 243, 1),
                            borderRadius: BorderRadius.circular(15)),
                        child: TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.black87,
                            ),
                            hintText: "password",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                            errorText: _passwordError,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              setState(() {
                                _passwordError = 'Enter a password';
                              });
                              return 'Enter a password';
                            }
                            return null;
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Navigator.pushNamed(context, 'verifyOtp');
                                  if (_formKey.currentState!.validate()) {
                                    clear();
                                    print(emailController.text);
                                    print(passwordController.text);
                                    print('Login proceed');
                                  }
                                },
                                // ignore: sort_child_properties_last
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2, vertical: 1),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white,
                                      height: 3,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black87,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 120,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'verifyEmail');
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forgot password',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Center(
                        child: SizedBox(
                          height: 20,
                          width: 150,
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Why VG vishwa?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'About Vishwakarma Group',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Indeminity Clause',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Privacy Policy',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget promoCard(Image) {
    return AspectRatio(
      aspectRatio: 1.9,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            // fit: BoxFit.cover,
            image: AssetImage(Image),
          ),
        ),
      ),
    );
  }
}
