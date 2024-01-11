import 'package:flutter/material.dart';
import 'package:mvvm_provider/data/response/status.dart';
import 'package:mvvm_provider/resources/colors.dart';
import 'package:mvvm_provider/utils/Routes/routes-name.dart';
import 'package:mvvm_provider/view_model/home_model_provider.dart';
import 'package:mvvm_provider/view_model/user_model_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModelProvider homeViewModelProvider = HomeViewModelProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModelProvider.fetchproduct();
  }

  @override
  Widget build(BuildContext context) {
    final userPref = Provider.of<UserModelProvider>(context);

    return Scaffold(
        appBar: AppBar(
            title: Center(child: Text('Products', textAlign: TextAlign.center)),
            backgroundColor: AppColors.appColor,
            automaticallyImplyLeading: false,
            actions: [
              InkWell(
                onTap: () {
                  userPref.clearuser().then((value) {
                    Navigator.pushNamed(context, RoutesName.login);
                  });
                },
                child: Text('Logout'),
              ),
              SizedBox(
                width: 20,
              )
            ]),
        body: ChangeNotifierProvider(
            create: (BuildContext) => homeViewModelProvider,
            child:
                Consumer<HomeViewModelProvider>(builder: (context, value, _) {
              switch (value.productslist.status) {
                case Status.LOADING:
                  return CircularProgressIndicator();
                case Status.ERROR:
                  return Text(value.productslist.message.toString());
                case Status.COMPLETED:
                  return ListView.builder(
                      itemCount: value.productslist.data!.products!.length,
                      itemBuilder: ((context, index) {
                        return Card(
                          color: Color.fromARGB(255, 199, 187, 143),
                          shadowColor: Colors.brown,
                          child: ListTile(
                            leading: Image.network(value
                                .productslist.data!.products![index].image
                                .toString()),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  value.productslist.data!.products![index]
                                          .category!.name
                                          .toString() +
                                      ':',
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  value.productslist.data!.products![index].name
                                      .toString(),
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              value.productslist.data!.products![index].price
                                  .toString(),
                              style: TextStyle(fontSize: 10),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  value.productslist.data!.products![index]
                                      .rating
                                      .toString(),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                )
                              ],
                            ),
                          ),
                        );
                      }));
                default:
              }

              return Container();
            })));
  }
}
