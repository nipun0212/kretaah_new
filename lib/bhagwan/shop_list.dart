import 'package:flutter/material.dart';
import 'package:kretaa/bhagwan/my_bills.dart';
import 'package:kretaa/common_widgets/avatar.dart';
import 'package:kretaa/common_widgets/custom_app_bar.dart';
import 'package:kretaa/model/customer.dart';
import 'package:kretaa/model/shop.dart';
import 'package:kretaa/services/auth.dart';
import 'package:kretaa/services/database.dart';
import 'package:provider/provider.dart';

class ShopList extends StatelessWidget {
  // Query buildQuery(Query q) {
  //   q = q.where('customerUID', isEqualTo: 'Bfrnla6oMzR9UVUeWLthPqku6gT2');
  //   print('q=$q');
  //   return q;
  // }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);

    final database = Provider.of<Database>(context, listen: false);
    return CustomScrollView(
      slivers: [
        // SliverAppBar(),
        SliverToBoxAdapter(
          child: Container(),
        ),
        StreamBuilder<List<Customer>>(
            stream: database.customerCollectionStream(
                q: (q) => q.where('customerUID',
                    isEqualTo: database.loggedInUser.documentId)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.data != null) {
                  List<Customer> customer = snapshot.data;
                  print('Bill $customer');
                  // print('Path = '${bill[0].documentId})
                  return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Scaffold(
                                        appBar: CustomAppBar(
                                                title: 'bills',
                                                context: context)
                                            .buildAppBar(auth),
                                        body: MyBills(
                                            // shopDocumentId: customer[index]
                                            //     .path
                                            //     .split('/')[1]
                                            //     .toString()
                                            shopDocumentId: customer[index]
                                                .path
                                                .split('/')[1]
                                                .toString()),
                                      )));
                        },
                        child: Column(
                          children: [
                            StreamBuilder<Shop>(
                                stream: database.shopDocumentStream(
                                    shopId: customer[index]
                                        .path
                                        .split('/')[1]
                                        .toString()),
                                builder: (context, snapshot) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                        leading: Avatar(
                                          photoUrl: null,
                                          radius: 25,
                                          borderColor: Colors.black54,
                                          borderWidth: 2.0,
                                        ),
                                        title: Text((snapshot.data?.shopName !=
                                                null)
                                            ? snapshot.data?.shopName
                                            : (snapshot.data
                                                        ?.ownerPhoneNumber !=
                                                    null)
                                                ? snapshot
                                                    .data?.ownerPhoneNumber
                                                : ''),
                                        subtitle:
                                            // Text(bill[index].amount.toString())),
                                            Text(customer[index]
                                                .reward_points
                                                .toString())),
                                  );
                                }),
                          ],
                        ),
                      );
                    }, childCount: snapshot.data?.length),
                  );
                } else {
                  return SliverToBoxAdapter(
                    child: Container(),
                  );
                }
              } else {
                return SliverToBoxAdapter(
                  child: Container(),
                );
              }
            })
      ],
    );
  }
}
