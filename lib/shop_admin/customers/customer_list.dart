import 'package:flutter/material.dart';
import 'package:kretaa/common_widgets/avatar.dart';
import 'package:kretaa/model/customer.dart';
import 'package:kretaa/model/user.dart';
import 'package:kretaa/services/database.dart';
import 'package:provider/provider.dart';

class CustomerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          leading: Icon(Icons.access_alarm),
        ),
        StreamBuilder<Object>(
            stream: database.customerStream(
                shopDocumentId: database.loggedInUser.shopDocumentId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.data != null) {
                  List<Customer> customer = snapshot.data;
                  print('Custmome $customer');
                  return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Column(
                        children: [
                          StreamBuilder<User>(
                              stream: database.userStream(
                                  uid: customer[index].documentId),
                              builder: (context, snapshot) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                      leading: Avatar(
                                        photoUrl: snapshot.data?.photoURL,
                                        radius: 25,
                                        borderColor: Colors.black54,
                                        borderWidth: 2.0,
                                      ),
                                      title: Text((snapshot.data?.name != null)
                                          ? snapshot.data?.name
                                          : (snapshot.data?.phoneNumber != null)
                                              ? snapshot.data?.phoneNumber
                                              : ''),
                                      subtitle: Text(customer[index]
                                          .reward_points
                                          .toString())),
                                );
                              }),
                        ],
                      );
                    }, childCount: customer.length
                        //customer.length == null ? 0 : customer.length,
                        ),
                  );
                } else {
                  return SliverToBoxAdapter(child: Container());
                }
              } else {
                return SliverToBoxAdapter(child: Container());
              }
            })

        // StreamBuilder<Object>(
        //     stream: database.customerStream(),
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.active) {
        //         if (snapshot.data != null) {
        //           List<Customer> customer = snapshot.data;
        //           return Container(
        //             child: ListView.builder(
        //                 itemCount: customer.length,
        //                 itemBuilder: (BuildContext context, int index) {
        //                   return Column(
        //                     children: [
        //                       StreamBuilder<FirestoreUser>(
        //                           stream: database.userStream(
        //                               userUID: customer[index].documentId),
        //                           builder: (context, snapshot) {
        //                             return Padding(
        //                               padding: const EdgeInsets.all(8.0),
        //                               child: ListTile(
        //                                   leading: Avatar(
        //                                     photoUrl: snapshot.data?.photoURL,
        //                                     radius: 25,
        //                                     borderColor: Colors.black54,
        //                                     borderWidth: 2.0,
        //                                   ),
        //                                   title: Text((snapshot.data?.name !=
        //                                           null)
        //                                       ? snapshot.data?.name
        //                                       : (snapshot.data?.phoneNumber !=
        //                                               null)
        //                                           ? snapshot.data?.phoneNumber
        //                                           : ''),
        //                                   subtitle: Text(customer[index]
        //                                       .reward_points
        //                                       .toString())),
        //                             );
        //                           }),
        //                     ],
        //                   );
        //                 }),
        //           );
        //         }
        //       } else
        //         return SliverFillRemaining(child: CircularProgressIndicator());
        //     })
      ],
    );
  }
}
