import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../services/auth_service.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() =>
      _AuthScreenState();
}

class _AuthScreenState
    extends State<AuthScreen> {
  final AuthService _authService =
      AuthService();

  final TextEditingController
      emailController =
      TextEditingController();

  final TextEditingController
      passwordController =
      TextEditingController();

  bool isLogin = true;
  bool isLoading = false;
  bool obscurePassword = true;

  // AZAM TV COLORS
  static const Color primaryBlue =
      Color(0xFF00AEEF);

  static const Color darkBlue =
      Color(0xFF061C3D);

  static const Color cardBlue =
      Color(0xFF0B2B5B);

  Future<void> submit() async {
    final email =
        emailController.text.trim();

    final password =
        passwordController.text.trim();

    if (email.isEmpty ||
        password.isEmpty) {
      showMessage(
        'Please fill all fields',
      );
      return;
    }

    try {
      setState(() {
        isLoading = true;
      });

      if (isLogin) {
        await _authService.signIn(
          email: email,
          password: password,
        );
      } else {
        await _authService.signUp(
          email: email,
          password: password,
        );

        showMessage(
          'Account created successfully',
        );
      }

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              const HomeScreen(),
        ),
      );
    } catch (e) {
      showMessage(
        e
            .toString()
            .replaceAll(
              'AuthException(message: ',
              '',
            )
            .replaceAll(')', ''),
      );
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        backgroundColor: primaryBlue,
        behavior:
            SnackBarBehavior.floating,
        shape:
            RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(
            14,
          ),
        ),
        content: Text(message),
      ),
    );
  }

  InputDecoration inputDecoration(
    String hint,
  ) {
    return InputDecoration(
      hintText: hint,

      hintStyle: TextStyle(
        color: Colors.white
            .withOpacity(0.5),
      ),

      filled: true,

      fillColor: Colors.white
          .withOpacity(0.06),

      contentPadding:
          const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),

      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),

      enabledBorder:
          OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(20),
        borderSide: BorderSide(
          color: Colors.white
              .withOpacity(0.05),
        ),
      ),

      focusedBorder:
          OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: primaryBlue,
          width: 1.5,
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,

      body: SafeArea(
        child: Stack(
          children: [
            // BACKGROUND GLOW
            Positioned(
              top: -120,
              right: -80,
              child: Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryBlue
                      .withOpacity(0.15),
                ),
              ),
            ),

            Positioned(
              bottom: -100,
              left: -60,
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryBlue
                      .withOpacity(0.08),
                ),
              ),
            ),

            Center(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.all(
                  24,
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,

                  children: [
                    // LOGO
                    Row(
                      children: [
                        Container(
                          width: 14,
                          height: 42,
                          decoration:
                              BoxDecoration(
                            color:
                                primaryBlue,
                            borderRadius:
                                BorderRadius.circular(
                              10,
                            ),
                          ),
                        ),

                        const SizedBox(
                          width: 12,
                        ),

                        const Text(
                          'AZAMTV',
                          style: TextStyle(
                            color:
                                Colors.white,
                            fontSize: 42,
                            fontWeight:
                                FontWeight
                                    .w900,
                            letterSpacing:
                                1.5,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 18,
                    ),

                    Text(
                      isLogin
                          ? 'Welcome Back'
                          : 'Create Account',

                      style:
                          const TextStyle(
                        fontSize: 34,
                        fontWeight:
                            FontWeight
                                .bold,
                        color:
                            Colors.white,
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    Text(
                      isLogin
                          ? 'Login to continue watching your favorite channels'
                          : 'Sign up and enjoy live streaming',

                      style: TextStyle(
                        color: Colors.white
                            .withOpacity(
                          0.7,
                        ),
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(
                      height: 40,
                    ),

                    // CARD
                    Container(
                      padding:
                          const EdgeInsets.all(
                        24,
                      ),

                      decoration:
                          BoxDecoration(
                        color: cardBlue
                            .withOpacity(
                          0.75,
                        ),

                        borderRadius:
                            BorderRadius.circular(
                          32,
                        ),

                        border: Border.all(
                          color: Colors
                              .white
                              .withOpacity(
                            0.06,
                          ),
                        ),
                      ),

                      child: Column(
                        children: [
                          // EMAIL
                          TextField(
                            controller:
                                emailController,

                            keyboardType:
                                TextInputType
                                    .emailAddress,

                            style:
                                const TextStyle(
                              color:
                                  Colors.white,
                            ),

                            decoration:
                                inputDecoration(
                              'Email Address',
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          // PASSWORD
                          TextField(
                            controller:
                                passwordController,

                            obscureText:
                                obscurePassword,

                            style:
                                const TextStyle(
                              color:
                                  Colors.white,
                            ),

                            decoration:
                                inputDecoration(
                              'Password',
                            ).copyWith(
                              suffixIcon:
                                  IconButton(
                                onPressed:
                                    () {
                                  setState(
                                    () {
                                      obscurePassword =
                                          !obscurePassword;
                                    },
                                  );
                                },

                                icon: Icon(
                                  obscurePassword
                                      ? Icons
                                          .visibility_off
                                      : Icons
                                          .visibility,

                                  color: Colors
                                      .white54,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 30,
                          ),

                          // BUTTON
                          SizedBox(
                            width:
                                double.infinity,
                            height: 58,

                            child:
                                ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(
                                backgroundColor:
                                    primaryBlue,

                                foregroundColor:
                                    Colors.white,

                                elevation: 0,

                                shape:
                                    RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(
                                    18,
                                  ),
                                ),
                              ),

                              onPressed:
                                  isLoading
                                      ? null
                                      : submit,

                              child: isLoading
                                  ? const SizedBox(
                                      width:
                                          24,
                                      height:
                                          24,
                                      child:
                                          CircularProgressIndicator(
                                        color:
                                            Colors.white,
                                        strokeWidth:
                                            2.5,
                                      ),
                                    )
                                  : Text(
                                      isLogin
                                          ? 'LOGIN'
                                          : 'CREATE ACCOUNT',

                                      style:
                                          const TextStyle(
                                        fontSize:
                                            16,
                                        fontWeight:
                                            FontWeight.bold,
                                        letterSpacing:
                                            1,
                                      ),
                                    ),
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          TextButton(
                            onPressed: () {
                              setState(() {
                                isLogin =
                                    !isLogin;
                              });
                            },

                            child: RichText(
                              text: TextSpan(
                                style:
                                    const TextStyle(
                                  fontSize:
                                      15,
                                ),
                                children: [
                                  TextSpan(
                                    text: isLogin
                                        ? 'Don\'t have an account? '
                                        : 'Already have an account? ',

                                    style:
                                        TextStyle(
                                      color: Colors
                                          .white
                                          .withOpacity(
                                        0.7,
                                      ),
                                    ),
                                  ),

                                  const TextSpan(
                                    text:
                                        'Switch',

                                    style:
                                        TextStyle(
                                      color:
                                          primaryBlue,
                                      fontWeight:
                                          FontWeight
                                              .bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}