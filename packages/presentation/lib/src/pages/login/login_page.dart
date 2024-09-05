import 'package:auto_route/auto_route.dart';
import 'package:di/di.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mobx/mobx.dart';
import 'package:presentation/src/base/base_stateful_page_widget.dart';
import 'package:presentation/src/components/iicons.dart';
import 'package:presentation/src/components/space.dart';
import 'package:presentation/src/extensions/app_router_extension.dart';
import 'package:presentation/src/extensions/widget_extension.dart';
import 'package:presentation/src/pages/login/login_page_store.dart';
import 'package:presentation/src/router/app_router.dart';
import 'package:presentation/src/utils/form_validation_rules.dart';

@RoutePage()
class LoginPage extends BaseStatefulPageWidget<LoginPageStore> {
  const LoginPage({super.key}) : super(pageName: "Login");

  @override
  BasePageState<LoginPageStore> createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPageStore> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  ReactionDisposer? _eventDisposer;

  @override
  void initState() {
    super.initState();
    disposers.add(
      reaction(
        (_) => store.event,
        (_) {
          store.event.maybeWhen(
            authorisationInProgress: () {
              context
                ..clearFocus()
                ..loaderOverlay.show();
            },
            success: () {
              context
                ..loaderOverlay.hide()
                ..goToAndReplace(const HomeRoute());
            },
            error: (message) {
              context
                ..loaderOverlay.hide()
                ..showSnackBar(message: message);
            },
            orElse: () {},
          );
        },
      ),
    );
  }

  @override
  LoginPageStore createStore() => LoginPageStore(
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
          "Login",
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 80),
        )
      ],
    );
  }

  Widget _buildEmailInput(BuildContext context) {
    return Focus(
      onFocusChange: (value) => !value ? setState(() {}) : null,
      child: TextFormField(
        controller: _emailController,
        style: Theme.of(context).textTheme.titleSmall,
        decoration: InputDecoration(
          border: Theme.of(context).inputDecorationTheme.border,
          floatingLabelStyle:
              Theme.of(context).inputDecorationTheme.floatingLabelStyle,
          labelText: "Email",
          prefixIcon: const Icon(Icons.email_outlined),
        ),
        validator: (value) {
          final sanitizedValue = value?.trim() ?? "";
          final validation1 = ValidationRules.emailRequiredValidation;
          if (sanitizedValue.isEmpty) {
            return validation1.message;
          }

          final validation2 = ValidationRules.emailValidation;
          if (!validation2.value.hasMatch(sanitizedValue)) {
            return validation2.message;
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPasswordInput(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      style: Theme.of(context).textTheme.titleSmall,
      decoration: InputDecoration(
        border: Theme.of(context).inputDecorationTheme.border,
        floatingLabelStyle:
            Theme.of(context).inputDecorationTheme.floatingLabelStyle,
        labelText: "Password",
        prefixIcon: const Icon(Icons.password_outlined),
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
          store.login(
            email: _emailController.text,
            password: _passwordController.text,
          );
        },
        child: const Text("Login"),
      ),
    );
  }

  Widget _buildCreateAccountButton(BuildContext context) {
    final theme = Theme.of(context).outlinedButtonTheme;
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: theme.style,
        onPressed: () => context.goTo(const SignUpRoute()),
        child: const Text("Create Account"),
      ),
    );
  }

  Widget _buildForgetPassword(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        "Forget Password ?",
        textAlign: TextAlign.end,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }

  Widget _buildOAuthLogin() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(3.0),
          child: IIcons.google,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withOpacity(0.5),
              width: 1,
            ),
          ),
        ),
        const Space(x: 30),
        Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(10.0),
          child: IIcons.apple,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withOpacity(0.5),
              width: 1,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildOrSignInWith() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1,
          width: 50,
          color: Colors.white.withOpacity(0.5),
        ),
        const Space(x: 20),
        const Text("Or sign in with"),
        const Space(x: 20),
        Container(
          height: 1,
          width: 50,
          color: Colors.white.withOpacity(0.5),
        ),
      ],
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(_, __) => AppBar();

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildEmailInput(context),
          const Space(y: 10),
          _buildPasswordInput(context),
          const Space(y: 10),
          _buildForgetPassword(context),
          const Space(y: 40),
          _buildSubmitButton(context),
        ],
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context, LoginPageStore store) {
    return LoaderOverlay(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context),
            const Space(y: 40),
            _buildForm(context),
            const Space(y: 20),
            _buildCreateAccountButton(context),
            const Space(y: 30),
            _buildOrSignInWith(),
            const Space(y: 30),
            _buildOAuthLogin(),
          ],
        ),
      ),
    );
  }

  bool _isFormValid() => _formKey.currentState?.validate() ?? false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _eventDisposer?.call();
    super.dispose();
  }
}
