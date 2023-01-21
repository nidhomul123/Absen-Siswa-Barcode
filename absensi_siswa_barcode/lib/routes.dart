import 'package:absensi_siswa_barcode/data/models/user_local_model.dart';
import 'package:absensi_siswa_barcode/domain/entities/user.dart';
import 'package:absensi_siswa_barcode/features/absence_history/detail_absence_history_page.dart';
import 'package:absensi_siswa_barcode/features/auth/login_page.dart';
import 'package:absensi_siswa_barcode/features/main/main_page.dart';
import 'package:absensi_siswa_barcode/features/profile/profile_page.dart';
import 'package:absensi_siswa_barcode/features/student/add_student_page.dart';
import 'package:absensi_siswa_barcode/features/student/detail_student_page.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: 'login',
      path: '/',
      redirect: (context, state) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        bool loginStatus = false;
        if (prefs.containsKey('login_status')) {
          loginStatus = prefs.getBool('login_status') ?? false;
        }
        if (loginStatus) {
          // has session
          return '/main';
        }
        return null;
      },
      builder: (context, state) => const LoginPage(),
      routes: <RouteBase>[
        // GoRoute(
        //   name: 'login',
        //   path: 'login',
        //   builder: (context, state) => const LoginPage(),
        // ),
      ],
    ),
    GoRoute(
      name: 'main',
      path: '/main',
      builder: (context, state) => const MainPage(),
      routes: <RouteBase>[
        GoRoute(
          name: 'profile',
          path: 'profile',
          builder: (context, state) => const ProfilePage(),
        ),
        GoRoute(
          name: 'detail_absence_history',
          path: 'detail_absence_history',
          builder: (context, state) => const DetailAbsenceHistoryPage(),
        ),
        GoRoute(
          name: 'add_student',
          path: 'add_student',
          builder: (context, state) => const AddStudentPage(),
        ),
        GoRoute(
          name: 'detail_student',
          path: 'detail_student',
          builder: (context, state) {
            var queryParams = state.queryParams;
            int? index = queryParams['index'] != null ? int.parse(queryParams['index']!) : null;
            User user = User(
              qrCode: queryParams['qr_code']!,
              username: queryParams['username']!,
              password: queryParams['password']!,
              name: queryParams['name']!,
              studentClass: queryParams['student_class']!,
              role: queryParams['role']!
            );
            return DetailStudentPage(
              index: index,
              student: user
            );
          },
        ),
      ],
    ),
  ],
);
