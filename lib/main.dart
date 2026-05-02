import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_preview/device_preview.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Authentication Screens
import 'package:namma_cambridge/Authentication/otp_screen.dart';
import 'package:namma_cambridge/Authentication/reset_password_screen.dart';
import 'package:namma_cambridge/Authentication/student_login_screen.dart';
import 'package:namma_cambridge/faculty_screens/auth/faculty_login_screen.dart';
import 'package:namma_cambridge/faculty_screens/faculty_dashboard_screen.dart';

// Feature Screens
import 'package:namma_cambridge/features/onboarding/screens/subscribe_screen.dart';
import 'package:namma_cambridge/features/onboarding/screens/successfull_screen.dart';
import 'package:namma_cambridge/features/splash/presentation/applyforadmission_screen/applyforadmission_screen.dart';
import 'package:namma_cambridge/features/splash/presentation/cse_core_specialization/cse_core_screen.dart';
import 'package:namma_cambridge/features/splash/presentation/faculty/faculty_screen.dart';
import 'package:namma_cambridge/features/splash/presentation/info/about_cit_screen.dart';
import 'package:namma_cambridge/features/splash/presentation/screens/campus_selection_screen.dart';
import 'package:namma_cambridge/features/splash/presentation/screens/dashboard_screen.dart';
import 'package:namma_cambridge/features/splash/presentation/screens/splash_screen.dart';
import 'package:namma_cambridge/features/splash/presentation/specialization/specialization_screen.dart';

// Campus Screens
import 'package:namma_cambridge/features/splash/presentation/screens/campuses_screen/cambridge_college.dart';
import 'package:namma_cambridge/features/splash/presentation/screens/campuses_screen/cambridge_juniors.dart';
import 'package:namma_cambridge/features/splash/presentation/screens/campuses_screen/cambridge_pu_college.dart';
import 'package:namma_cambridge/features/splash/presentation/screens/campuses_screen/cambridge_school_screen.dart';
import 'package:namma_cambridge/features/splash/presentation/screens/campuses_screen/cit_main_campus_screen.dart';
import 'package:namma_cambridge/features/splash/presentation/screens/campuses_screen/cit_north_screen.dart';

import 'core/theme/app_theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent),
  );

  runApp(
      DevicePreview(
        builder: (context) => MyApp(),
      )
      // const MyApp()
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Namma Cambridge',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      // USE HOME WITH STREAMBUILDER FOR PERSISTENCE
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // 1. While checking the session
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          // 2. If a user session exists
          if (snapshot.hasData && snapshot.data != null) {
            User user = snapshot.data!;

            // OPTION A: VISITOR (Anonymous Auth)
            if (user.isAnonymous) {
              return const AboutCITScreen();
            }

            // OPTION B & C: STUDENT or FACULTY (Check Firestore Role)
            return FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .doc(user.uid)
                  .get(),
              builder: (context, roleSnapshot) {
                if (roleSnapshot.connectionState == ConnectionState.waiting) {
                  return const Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  );
                }

                if (roleSnapshot.hasData && roleSnapshot.data!.exists) {
                  var data = roleSnapshot.data!.data() as Map<String, dynamic>;
                  String role = data['role'] ?? 'student';

                  if (role == 'faculty') {
                    return const FacultyDashboard(); // Faculty Screen
                  } else {
                    return const DashboardScreen(); // Student Screen
                  }
                }

                // Fallback if data is missing
                return const DashboardScreen();
              },
            );
          }

          // 3. NO USER LOGGED IN
          return const SplashScreen();
        },
      ),

      routes: {
        '/dashboard': (context) => const DashboardScreen(),
        '/campus_selection': (context) => const CampusSelectionScreen(),
        '/cit_main': (context) => const WelcomeRoleScreen(),
        '/cit_north': (context) => const NorthWelcomeRoleScreen(),
        '/cambridge_college': (context) => const CamCollegeWelcomeRoleScreen(),
        '/cambridge_pu': (context) => const PUWelcomeRoleScreen(),
        '/cambridge_school': (context) => const ScWelcomeRoleScreen(),
        '/cambridge_juniors': (context) => const JuWelcomeRoleScreen(),
        '/student_login_screen': (context) => const StudentLoginScreen(),
        '/subscribe_screen': (context) => const SubscribeScreen(),
        '/otp_screen': (context) {
          final String email =
          ModalRoute.of(context)!.settings.arguments as String;
          return OTPScreen(email: email);
        },
        '/sucessful_screen': (context) => const SubscriptionSuccessScreen(),
        '/about_cit_screen': (context) => const AboutCITScreen(),
        '/specialization_screen': (context) => const SpecializationScreen(),
        '/cse_core': (context) => const CSECoreDetailScreen(),
        '/applyforadmission': (context) => const ApplyAdmissionScreen(),
        '/faculty_screen': (context) =>  FacultyScreen(),
        '/faculty_login_screen': (context) => const FacultyLoginScreen(),
        '/faculty_dashboard': (context) => const FacultyDashboard(),
        '/reset_password_screen': (context) => ResetPasswordScreen(),
      },
    );
  }
}