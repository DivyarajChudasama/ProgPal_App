import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:progpal/screens/otp/otp_screen.dart';

class PhoneNumberScreen extends StatefulWidget {
  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  String _selectedCountryCode = '+91'; // Default country code

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _verifyPhoneNumber() async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: _selectedCountryCode + _phoneNumberController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          print('Auto verification completed, signed in.');
          // Navigate to the next screen, e.g., HomeScreen
        },
        verificationFailed: (FirebaseAuthException e) {
          print('Verification failed: ${e.message}');
          // Handle the verification failure
        },
        codeSent: (String verificationId, int? resendToken) {
          // Navigate to the OTP screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OTPScreen(verificationId: verificationId),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        timeout: const Duration(seconds: 60),
      );
    } catch (e) {
      print('Error during phone number verification: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Enter Phone Number',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 25, 25, 112),
      ),
      backgroundColor: const Color.fromARGB(255, 25, 25, 112),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                CountryCodePicker(
                  onChanged: (code) {
                    setState(() {
                      _selectedCountryCode = code.dialCode!;
                    });
                  },
                  initialSelection: 'IN', // Initial country code
                  favorite: ['+91'], // Your favorite country codes
                  textStyle: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'Enter Phone Number',
                        hintStyle: TextStyle(color: Colors.white),
                        contentPadding: EdgeInsets.symmetric(horizontal: 30),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verifyPhoneNumber,
              child: Text(
                'Send OTP',
                style: TextStyle(
                  color: const Color.fromARGB(255, 25, 25, 112),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
