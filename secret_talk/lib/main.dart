import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:secret_talk/app.dart';
import 'package:secret_talk/repositories/kakao_social_repositoryl.dart';
import 'package:secret_talk/state/home/home_bloc.dart';



void main() async {
  // await dotenv.load(fileName: '.env');

  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(create: (BuildContext context) => KakaoSocialDefaultRepository(),)
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => HomeBloc({}),
          
        )
      ],
      child: const SecretTalkApp(),
    ),
  ));
  // runApp(const FreightApp());
}
