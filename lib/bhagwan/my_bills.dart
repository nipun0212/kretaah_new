import 'package:flutter/material.dart';
import 'package:kretaa/common_widgets/avatar.dart';
import 'package:kretaa/common_widgets/bill_card.dart';
import 'package:kretaa/model/bill.dart';
import 'package:kretaa/model/shop.dart';
import 'package:kretaa/services/database.dart';
import 'package:kretaa/shop_admin/state/shop_freezed_model.dart';
import 'package:provider/provider.dart';

class MyBills extends StatelessWidget {
  const MyBills({Key key, this.shopDocumentId}) : super(key: key);
  // final String billDocumentId;
  final String shopDocumentId;
  // Query buildQuery(Query q) {
  //   q = q.where('customerUID', isEqualTo: 'Bfrnla6oMzR9UVUeWLthPqku6gT2');
  //   // if (shopDocumentId != null)
  //   //   q = q.where('shopDocumentId', isEqualTo: shopDocumentId);
  //   print('q=$q');
  //   return q;
  // }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    return CustomScrollView(
      slivers: [
        // SliverAppBar(),
        SliverToBoxAdapter(
          child: Container(),
        ),
        StreamBuilder<List<Bill>>(
            stream: database.billsStream(
                q: (q) => q
                    .where('customerUID',
                        isEqualTo: database.loggedInUser.documentId)
                    .orderBy('updatedOn', descending: true),
                collectionGroup: true),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.data != null) {
                  List<Bill> bill = snapshot.data;
                  print('Bill $bill');
                  // print('Path = '${bill[0].documentId})
                  return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Column(
                        children: [
                          StreamBuilder<ShopFreezedModel>(
                              stream: database.shopDocumentStream(
                                  shopId: bill[index].shopDocumentId),
                              builder: (context, snapshot) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  BillCard(
                                                    billDocumentId:
                                                        bill[index].documentId,
                                                    shopDocumentId: bill[index]
                                                        .shopDocumentId,
                                                  )));
                                    },
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
                                            Text(
                                                bill[index].amount.toString())),
                                  ),
                                );
                              }),
                        ],
                      );
                    }, childCount: bill.length),
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
