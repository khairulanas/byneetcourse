import 'package:byneetcourseapp/src/modules/course/models/course_model_purin.dart';
import 'package:byneetcourseapp/src/modules/login/services/login_service.dart';
import 'package:byneetcourseapp/src/modules/nodata_container.dart';
import 'package:byneetcourseapp/src/modules/wishlist/widgets/wishlist_widget.dart';
import 'package:byneetcourseapp/src/modules/wishlist/wishlist_service.dart';
import 'package:byneetcourseapp/src/tools/constColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../loading_container.dart';

class WishlistAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LoginService>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.background,
        elevation: 0,
      ),
      body: FutureBuilder<List<CourseModel>>(
          future: WishListService(user.user.uid).getDataCollection(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done)
              return LoadingContainer();
            if (!snapshot.hasData) return NoDataContainer();
            return Container(
              child: WishListWidget(
                kelas: snapshot.data,
              ),
            );
          }),
    );
  }
}
