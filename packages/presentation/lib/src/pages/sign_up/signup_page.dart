import 'package:auto_route/auto_route.dart';
import 'package:di/di.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:presentation/src/base/base_stateful_page_widget.dart';
import 'package:presentation/src/components/space.dart';
import 'package:presentation/src/extensions/app_router_extension.dart';
import 'package:presentation/src/pages/sign_up/events/signup_event.dart';
import 'package:presentation/src/pages/sign_up/signup_page_store.dart';
import 'package:presentation/src/router/app_router.dart';

@RoutePage()
class SignUpPage extends BaseStatefulPageWidget<SignUpPageStore> {
  const SignUpPage({super.key}) : super(pageName: "Signup");

  @override
  BasePageState<SignUpPageStore> createState() => _SignUpPageState();
}

class _SignUpPageState extends BasePageState<SignUpPageStore> {
  bool _isPasswordObscured = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    disposers.add(
      when(
        (_) => store.event is Success,
        () => context.goToAndReplace(const HomeRoute()),
      ),
    );
  }

  @override
  SignUpPageStore createStore() => SignUpPageStore(
        authRepository: di.get<AuthRepository>(),
        analyticsRepository: di.get<AnalyticsRepository>(),
      );

  Widget _buildTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's get\nstarted",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          "Signup",
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 80),
        )
      ],
    );
  }

  Widget _buildEmailInput(BuildContext context) {
    return TextField(
      controller: _emailController,
      style: Theme.of(context).textTheme.titleSmall,
      decoration: InputDecoration(
        border: Theme.of(context).inputDecorationTheme.border,
        floatingLabelStyle:
            Theme.of(context).inputDecorationTheme.floatingLabelStyle,
        labelText: "Email",
        prefixIcon: const Icon(Icons.email_outlined),
      ),
    );
  }

  Widget _buildPasswordInput(BuildContext context) {
    return TextField(
      controller: _passwordController,
      obscureText: _isPasswordObscured,
      style: Theme.of(context).textTheme.titleSmall,
      decoration: InputDecoration(
        border: Theme.of(context).inputDecorationTheme.border,
        floatingLabelStyle:
            Theme.of(context).inputDecorationTheme.floatingLabelStyle,
        labelText: "Password",
        prefixIcon: const Icon(Icons.password_outlined),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordObscured
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
          onPressed: () => setState(() {
            _isPasswordObscured = !_isPasswordObscured;
          }),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    final theme = Theme.of(context).elevatedButtonTheme;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: theme.style,
        onPressed: () {
          store.signup(
            email: _emailController.text,
            password: _passwordController.text,
            firstName: _firstNameController.text,
            lastName: _lastNameController.text,
          );
        },
        child: const Text("Signup"),
      ),
    );
  }

  Widget _buildFirstName(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: _firstNameController,
        style: Theme.of(context).textTheme.titleSmall,
        decoration: InputDecoration(
          border: Theme.of(context).inputDecorationTheme.border,
          floatingLabelStyle:
              Theme.of(context).inputDecorationTheme.floatingLabelStyle,
          labelText: "First name",
          prefixIcon: const Icon(Icons.person_outline_outlined),
        ),
      ),
    );
  }

  Widget _buildLastName(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: _lastNameController,
        style: Theme.of(context).textTheme.titleSmall,
        decoration: InputDecoration(
          border: Theme.of(context).inputDecorationTheme.border,
          floatingLabelStyle:
              Theme.of(context).inputDecorationTheme.floatingLabelStyle,
          labelText: "Last name",
          prefixIcon: const Icon(Icons.person_outline_outlined),
        ),
      ),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(
          BuildContext context, SignUpPageStore store) =>
      AppBar(
        backgroundColor: Colors.transparent,
      );

  @override
  Widget buildBody(BuildContext context, SignUpPageStore store) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(context),
          const Space(y: 40),
          Row(
            children: [
              _buildFirstName(context),
              const Space(x: 12),
              _buildLastName(context),
            ],
          ),
          const Space(y: 20),
          _buildEmailInput(context),
          const Space(y: 20),
          _buildPasswordInput(context),
          const Space(y: 20),
          _buildSubmitButton(context),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }
}
