import 'package:catbreeds_app/src/presentation/pages/home_page/export.dart';

AppBar appBar({BuildContext? context, String? title, bool? nav}) => AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: nav == true
          ? GestureDetector(
              onTap: () {
                GoRouter.of(context!).pop();
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            )
          : Container(),
      elevation: 0,
      title: Text(
        title ?? 'CatBreeds',
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
