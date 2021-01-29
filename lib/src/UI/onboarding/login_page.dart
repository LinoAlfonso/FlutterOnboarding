
import 'package:flutter/material.dart';
import 'package:onbording_provider_app/src/Services/LoginProvider.dart';
import 'package:onbording_provider_app/src/UI/widgets/LoadingProgress.dart';
import 'package:onbording_provider_app/src/UI/widgets/boton_azul.dart';
import 'package:onbording_provider_app/src/UI/widgets/custom_input.dart';
import 'package:onbording_provider_app/src/UI/widgets/labels.dart';
import 'package:onbording_provider_app/src/UI/widgets/logo.dart';
import 'package:provider/provider.dart';




class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Logo( titulo: 'Messenger' ),
                    _Form(),
                    Labels(
                      ruta: 'register',
                      titulo: '¿No tienes cuenta?',
                      subTitulo: 'Crea una ahora!',
                    ),
                    Text('Términos y condiciones de uso', style: TextStyle( fontWeight: FontWeight.w200 ),)
                  ],
                ),
                Visibility(
                  visible: authService.isLoading,
                    child: loading()),
              ],
            ),
          ),
        ),
      )
   );
  }
}



class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {

  final emailCtrl = TextEditingController();
  final passCtrl  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<LoginProvider>(context);


    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric( horizontal: 50 ),
       child: Column(
         children: <Widget>[
           
           CustomInput(
             icon: Icons.mail_outline,
             placeholder: 'Correo',
             keyboardType: TextInputType.emailAddress, 
             textController: emailCtrl,
           ),

           CustomInput(
             icon: Icons.lock_outline,
             placeholder: 'Contraseña',
             textController: passCtrl,
             isPassword: true,
           ),
           

           BotonAzul(
             text: 'Ingrese',
             onPressed: (){
    authService.isLoading=true;
    }
    )

    ],
    ),
    }
    );
  }
}
