import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  bool checkedValue = false;
  bool _isObscure = true;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight / 8,
                ),
                // Signin text
                Text('Sign Up',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoMono')),
                // welcome line
                SizedBox(
                  height: screenHeight / 100,
                ),
                Text('Register a new account!',
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoMono')),
                // email text field
                SizedBox(
                  height: screenHeight / 20,
                ),
                // first name TextField inside container
                Container(
                  width: screenWidth / 1,
                  height: 50,
                  decoration: BoxDecoration(
                      // color: Colors.grey.shade200,
                      ),
                  child: TextField(
                    cursorColor: Colors.deepOrange,
                    keyboardType: TextInputType.name,
                    controller: _firstNameController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.0),
                        ),
                        labelText: 'First Name',
                        labelStyle: TextStyle(color: Colors.deepOrange),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.0),
                        ),
                        hintText: 'First Name',
                        hintStyle: TextStyle(color: Colors.black26)
                        // border: InputBorder.none,
                        ),
                  ),
                ),
                SizedBox(
                  height: screenHeight / 60,
                ),
                // second name TextField inside container
                Container(
                  width: screenWidth / 1,
                  height: 50,
                  decoration: BoxDecoration(
                      // color: Colors.grey.shade200,
                      ),
                  child: TextField(
                    cursorColor: Colors.deepOrange,
                    controller: _lastNameController,
                    keyboardType: TextInputType.name,
                    //controller: phoneController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.0),
                        ),
                        labelText: 'Last Name',
                        labelStyle: TextStyle(color: Colors.deepOrange),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.0),
                        ),
                        hintText: 'Last Name',
                        hintStyle: TextStyle(color: Colors.black26)
                        // border: InputBorder.none,
                        ),
                  ),
                ),
                SizedBox(
                  height: screenHeight / 60,
                ),
                // email TextField inside container
                Container(
                  width: screenWidth / 1,
                  height: 50,
                  decoration: BoxDecoration(
                      // color: Colors.grey.shade200,
                      ),
                  child: TextField(
                    cursorColor: Colors.deepOrange,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    //controller: phoneController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.0),
                        ),
                        labelText: 'Student Email',
                        labelStyle: TextStyle(color: Colors.deepOrange),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.0),
                        ),
                        hintText: 'Student Email',
                        hintStyle: TextStyle(color: Colors.black26)
                        // border: InputBorder.none,
                        ),
                  ),
                ),
                SizedBox(
                  height: screenHeight / 60,
                ),
                // password TextField inside container
                Container(
                  width: screenWidth / 1,
                  height: 50,
                  decoration: BoxDecoration(
                      // color: Colors.grey.shade200,
                      ),
                  child: TextField(
                    cursorColor: Colors.deepOrange,
                    obscureText: _isObscure,
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    //controller: phoneController,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          icon: _isObscure
                              ? Icon(
                                  Icons.visibility_off,
                                  color: Colors.deepOrange,
                                )
                              : Icon(
                                  Icons.visibility,
                                  color: Colors.deepOrange,
                                ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.0),
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.deepOrange),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.0),
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.black26)
                        // border: InputBorder.none,
                        ),
                  ),
                ),
                SizedBox(
                  height: screenHeight / 60,
                ),
                // confirm password TextField inside container
                Container(
                  width: screenWidth / 1,
                  height: 50,
                  decoration: BoxDecoration(
                      // color: Colors.grey.shade200,
                      ),
                  child: TextField(
                    cursorColor: Colors.deepOrange,
                    obscureText: _isObscure,
                    controller: _confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    //controller: phoneController,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          icon: _isObscure
                              ? Icon(
                                  Icons.visibility_off,
                                  color: Colors.deepOrange,
                                )
                              : Icon(
                                  Icons.visibility,
                                  color: Colors.deepOrange,
                                ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.0),
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.deepOrange),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.0),
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.black26)
                        // border: InputBorder.none,
                        ),
                  ),
                ),
                SizedBox(
                  height: screenHeight / 60,
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: CheckboxListTile(
                      title: GestureDetector(
                          onTap: () {},
                          child: Text(
                              'I agree to Term of Services and Privacy Policy',
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold))),
                      value: checkedValue,
                      activeColor: Colors.deepOrange,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValue = newValue!;
                          print(newValue);
                        });
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    )),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight / 20,
          ),
          // sign-in Button
          Center(
              child: Column(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 50),
                      maximumSize: const Size(300, 50),
                      backgroundColor: Colors.deepOrange),
                  onPressed: () {
                    print(_firstNameController.text.trim());
                    print(_lastNameController.text.trim());
                    print(_emailController.text.trim());
                    print(_passwordController.text.trim());
                    print(_confirmPasswordController.text.trim());
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(fontSize: 20),
                  )),
              SizedBox(
                height: screenHeight / 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // forgot password
                  Text(
                    'Have an account?',
                    style: TextStyle(
                        color: Colors.black54, fontFamily: 'RobotoMono'),
                  ),
                  SizedBox(
                    width: screenWidth / 30,
                  ),
                  // signup
                  Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoMono'),
                  ),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }
}
