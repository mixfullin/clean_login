import 'package:clean_login/core/di.dart';
import 'package:clean_login/core/size_config.dart';
import 'package:clean_login/features/auth/presentation/cubits/login_cubit.dart';
import 'package:clean_login/features/auth/presentation/cubits/login_state.dart';
import 'package:clean_login/features/auth/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool scure = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Login Failure"),
                backgroundColor: Colors.red,
              ),
            );
          }

          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Login Successful!'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeView()),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Color(0xffACACAC),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/mock-login-image.png",
                    width: SizeConfig.screenWidth / 1.5,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 7,
                      ),
                      child: TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Username",
                          hintStyle: TextStyle(
                            color: Color(0xff808080),
                            fontFamily: "Jaro",
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 7,
                      ),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Color(0xff808080),
                            fontFamily: "Jaro",
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                scure = !scure;
                              });
                            },
                            icon:
                                scure
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                          ),
                        ),
                        obscureText: scure,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockWidth(20),
                    ),
                    child: InkWell(
                      onTap:
                          () => context.read<LoginCubit>().login(
                            username: usernameController.text,
                            password: passwordController.text,
                          ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color:
                              state is LoginLoading
                                  ? Color(0xffFF6F00).withValues(alpha: 0.8)
                                  : Color(0xffFF6F00),
                        ),
                        padding: EdgeInsets.all(16),

                        child:
                            state is LoginLoading
                                ? Center(
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                                : Center(
                                  child: Text(
                                    "Login",

                                    style: TextStyle(
                                      fontFamily: "Jaro",
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
