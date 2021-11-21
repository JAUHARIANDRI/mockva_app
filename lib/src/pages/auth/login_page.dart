import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockva_app/src/bloc/login_bloc/login_bloc.dart';
import 'package:mockva_app/src/data/session.dart';
import 'package:mockva_app/src/pages/dashboard/dashboard_navigation.dart';
import 'package:mockva_app/src/utils/components/custom_button.dart';
import 'package:mockva_app/src/utils/components/custom_toast.dart';
import 'package:mockva_app/src/utils/components/splash_screen.dart';
import 'package:mockva_app/src/utils/values/colors.dart';
import 'package:mockva_app/src/utils/values/dimens.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mockva_app/src/utils/values/strings.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _contactConts = TextEditingController();
  final TextEditingController _passwordConts = TextEditingController();

  final FocusNode _userIdFN = FocusNode();
  final FocusNode _passdFN = FocusNode();

  bool _isObsecure = true;

  var icn = const Icon(MdiIcons.eyeOff);

  String _validatepassword(String value, int minChatacter) {
    if (value.length < minChatacter)
      // ignore: curly_braces_in_flow_control_structures
      return 'Name must be more than  ${minChatacter - 1} character !!';
    else {
      return null;
    }
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _buildLoginForm(context),
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: BlocConsumer<LoginBloc, LoginState>(
          // ignore: void_checks
          listener: (context, state) {
            if (state is LoginSuccess) {
              setState(() async {
                Session.setAccountID(state.response.accountId);
                Session.setSessionId(state.response.id);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const SplashScreen()),
                    (Route<dynamic> route) => false);
              });
            }
            if (state is LoginFailure) {
              return ToastFlush.error(
                  context: context, message: Dictionary.warningLoginFailed);
            }

            if (state is LoginDetailLoaded) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const DashboardNavigation()),
                  (Route<dynamic> route) => false);
            }
          },
          builder: (context, state) {
            if (state is LoginProgress) {
              return const Center(
                  child: CircularProgressIndicator(color: primaryColor));
            } else {
              return _buildLoginForm(context);
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.all(marginActivity),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 80.0),
                child: Text(
                  "Mockva Mobile",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal),
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: marginForm,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 30),
                child: TextFormField(
                  controller: _contactConts,
                  focusNode: _userIdFN,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (term) {
                    _fieldFocusChange(context, _userIdFN, _passdFN);
                  },
                  autocorrect: false,
                  decoration: const InputDecoration(
                    errorStyle: TextStyle(color: Colors.green),
                    border: UnderlineInputBorder(),
                    // icon: Icon(Icons.person),
                    hintText: Dictionary.userName,
                    hintStyle: TextStyle(
                      fontSize: 15,
                    ),
                    labelText: Dictionary.userName,
                    labelStyle: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: marginMedium),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 40),
                child: TextFormField(
                  controller: _passwordConts,
                  focusNode: _passdFN,
                  obscureText: _isObsecure,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) => _validatepassword(value.toString(), 1),
                  onFieldSubmitted: (e) {
                    _passdFN.unfocus();
                  },
                  decoration: InputDecoration(
                    errorStyle: const TextStyle(color: Colors.green),
                    contentPadding: EdgeInsets.zero,
                    suffix: InkWell(
                      child: icn,
                      onTap: () {
                        if (_isObsecure == true) {
                          _isObsecure = false;
                          icn = const Icon(MdiIcons.eye);
                        } else {
                          _isObsecure = true;
                          icn = const Icon(MdiIcons.eyeOff);
                        }
                        setState(() {});
                      },
                    ),
                    border: const UnderlineInputBorder(),
                    hintText: "Input Password Here ",
                    hintStyle: const TextStyle(
                      fontSize: 15,
                    ),
                    labelText: "Password",
                    labelStyle: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                // ignore: sized_box_for_whitespace
                child: Container(
                  // width: MediaQuery.of(context).size.width,
                  width: 150,
                  child: FlatButtonPrimary(
                    label: Dictionary.login,
                    onPress: () {
                      if (_contactConts.text.isEmpty ||
                          _passwordConts.text.isEmpty) {
                        ToastFlush.warning(
                            context: context,
                            message: Dictionary.warningLoginEmpty);
                      } else {
                        // Navigator.of(context).pushAndRemoveUntil(
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             const DashboardNavigation()),
                        //     (Route<dynamic> route) => false);
                        BlocProvider.of<LoginBloc>(context).add(LoginStarted(
                            _contactConts.text, _passwordConts.text));
                      }
                    },
                  ),
                ),
              ),

              const SizedBox(height: marginMedium),
              const SizedBox(height: marginMedium),
              const SizedBox(height: marginMedium),
            ],
          ),
        ),
      ),
    );
  }
}
