
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:labhouse_radio/cubits/stations_cubit.dart';
import 'package:labhouse_radio/views/routes/app_router.dart';
import 'package:labhouse_radio/views/themes/theme.dart';

String initialRoute = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //MultiBlocProvider para cargar cubits al cargar la APP
    return MultiBlocProvider(
      providers: [
        BlocProvider<StationsCubit>(create: (context) => StationsCubit()),
      ],
      child: MaterialApp(
         localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [ Locale('es') ],
        locale: const Locale('es'),
        title: 'LabHouse Radio',
        debugShowCheckedModeBanner: false,
        // Se encarga de gestionar todas las rutas de la página
        onGenerateRoute: _appRouter.onGenerateRoute,
        // Carga el tema de la aplicación
        theme: AppTheme.theme,
        initialRoute: '/'
      ),
    );
  }
}