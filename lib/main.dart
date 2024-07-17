import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:flutter_khackathon/main_tabs/main_tabs.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with TickerProviderStateMixin {
  late final maintabControl = TabController(length: 5, vsync: this);
  final mainTabs = [
    const Tab(
      iconMargin: EdgeInsets.only(bottom: 0),
      icon: Icon(
        Icons.home_outlined,
        size: 30,
      ),
      text: "메인",
    ),
    const Tab(
      iconMargin: EdgeInsets.only(bottom: 0),
      icon: Icon(
        Icons.people_outline,
        size: 30,
      ),
      text: "친구",
    ),
    const Tab(
      iconMargin: EdgeInsets.only(bottom: 0),
      icon: Icon(
        Icons.add_box_outlined,
        size: 30,
      ),
      text: "학습",
    ),
    const Tab(
      iconMargin: EdgeInsets.only(bottom: 0),
      icon: Icon(
        Icons.search_outlined,
        size: 30,
      ),
      text: "검색",
    ),
    const Tab(
      iconMargin: EdgeInsets.only(bottom: 0),
      icon: Icon(
        Icons.menu_outlined,
        size: 30,
      ),
      text: "메뉴",
    ),
  ];

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  static const _mainpageTabs = [
    MainPage(),
    Placeholder(),
    MainQuizPage(),
    Placeholder(),
    Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Icon(Icons.check_box_outlined),
              const Spacer(),
              const Text("name"),
              const Spacer(
                flex: 25,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_outlined)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
              Builder(
                builder: (context) {
                  return IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.person_outline_outlined),
                  );
                },
              ),
            ],
          ),
        ),
        body: TabBarView(controller: maintabControl, children: _mainpageTabs),
        bottomNavigationBar: BottomAppBar(
          child: TabBar(controller: maintabControl, tabs: mainTabs),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _idControl = TextEditingController();
  final _pwControl = TextEditingController();
  bool _obscurePassword = true;
  bool _remember = false;

  void _seePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _rememberId() {
    setState(() {
      // 아이디 저장 처리
      _remember = !_remember;
    });
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      // 로그인 처리
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            const Flexible(child: Placeholder()),
            Expanded(
              flex: 5,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Center(
                        child: Text("text"),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: _idControl,
                        decoration: const InputDecoration(
                          labelText: "id",
                        ),
                        validator: (value) {
                          // example
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: TextFormField(
                              controller: _pwControl,
                              decoration: InputDecoration(
                                labelText: "pw",
                                suffixIcon: IconButton(
                                  onPressed: () => _seePassword(),
                                  icon: Icon(_obscurePassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined),
                                ),
                              ),
                              obscureText: _obscurePassword,
                              validator: (value) {
                                // example
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 10) {
                                  return 'Please enter a valid password';
                                }
                                return null;
                              },
                            ),
                          ),
                          const Expanded(child: Text("text")),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: IconButton(
                              onPressed: () => _rememberId(),
                              icon: Icon(_remember
                                  ? Icons.check_box_outlined
                                  : Icons.check_box_outline_blank),
                            ),
                          ),
                          const Expanded(
                            child: Text("아이디 기억하기"),
                          ),
                          const Spacer(),
                          Expanded(
                            flex: 2,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text("비밀번호 찾기"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextButton(
                        style: const ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(
                            Size(double.maxFinite, double.maxFinite),
                          ),
                        ),
                        onPressed: () => _login(),
                        child: const Text("로그인"),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextButton(
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 3,
                              child: Icon(Icons.g_mobiledata_outlined),
                            ),
                            Expanded(
                              child: Text("Log in with google"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ),
                          );
                        },
                        child: const Text("회원가입"),
                      ),
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

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
