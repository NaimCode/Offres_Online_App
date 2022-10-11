import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:offres_onlines/config/theme.dart';
import 'package:offres_onlines/partials/filter_page.dart';
import 'package:offres_onlines/utils/conversion.dart';
import 'package:offres_onlines/widgets/Loading.dart';
import 'package:offres_onlines/widgets/error.dart';
import 'package:offres_onlines/widgets/no_data.dart';
import 'package:offres_onlines/widgets/small/text_currency.dart';
import '../bloc/offre/offre_bloc.dart';
import '../models/filter.dart';
import '../models/offre.dart';

class AppelsOffresJour extends StatefulWidget {
  const AppelsOffresJour({super.key});

  @override
  State<AppelsOffresJour> createState() => _AppelsOffresJourState();
}

class _AppelsOffresJourState extends State<AppelsOffresJour> {
  ScrollController scrollController = ScrollController();
  RxString search = "".obs;
  RxBool isToUp = false.obs;

  late Filter filter;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<OffreBloc>(Get.context!).add(OffreEventGetAll());
    scrollController.addListener(useToUp);
    //
    filter = Filter.empty();
  }

  void useToUp() {
    if (scrollController.offset >= 300) {
      isToUp.value = true;
    } else {
      isToUp.value = false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  void backResult(Filter? result) {
    if (result == null || result.noFilter()) {
      BlocProvider.of<OffreBloc>(context).add(OffreEventGetAll());
    } else {
      filter = result;
      BlocProvider.of<OffreBloc>(context).add(OffreFilter(filter: result));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(() => Visibility(
            visible: isToUp.value,
            child: FloatingActionButton(
              backgroundColor: PRIMARY_COLOR,
              onPressed: () {
                scrollController.animateTo(0,
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeIn);
              },
              child: const FaIcon(FontAwesomeIcons.chevronUp),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          controller: scrollController,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Appels d'offres du jour",
                      style: Theme.of(context).textTheme.headline6),
                  OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Theme.of(context).primaryColor,
                          side: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      onPressed: () async {
                        Filter? result =
                            await Get.to(() => FilterPage(filter: filter));

                        backResult(result);
                      },
                      icon: const FaIcon(FontAwesomeIcons.filter, size: 17),
                      label: const Text('Filtrer'))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value) {
                  search.value = value.toLowerCase();
                },
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                    hintText: "Recherche",
                    suffixIcon: SizedBox(
                        width: double.minPositive,
                        child: Center(
                            child: FaIcon(FontAwesomeIcons.magnifyingGlass,
                                size: 20))),
                    filled: true,
                    border: InputBorder.none),
              ),
            ),
            const Divider(),
            BlocBuilder<OffreBloc, OffreState>(builder: (context, state) {
              if (state is OffreIsLoading) {
                return const Loading();
              }
              if (state is OffreError) {
                return const Error(text: 'Impossible de charger les donnés');
              }
              if (state is OffreData ) {
                return Obx(() => state.data(searchText: search.value).isEmpty
                    ? const NoData()
                    : ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                          color: Colors.amber.shade300,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Text(
                                          "${state.data(searchText: search.value).length} appels d'offres"),
                                    )
                                  ]),
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    state.data(searchText: search.value).length,
                                itemBuilder: ((context, index) {
                                  Offre offre = state.data(
                                      searchText: search.value)[index];
                                  return OffreCard(offre: offre);
                                })),
                          ]));
              }

              return Container();
            })
          ],
        ),
      ),
    );
  }
}

class OffreCard extends StatelessWidget {
  final Offre offre;
  final RxBool seen = false.obs;
  OffreCard({super.key, required this.offre});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Opacity(
          opacity: seen.isTrue ? 0.7 : 1.0,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade100),
            child: ListTile(
              onTap: () async {
                await Get.toNamed("/offre", arguments: offre);
                seen.value = true;
              },
              title: Visibility(
                  visible:
                      offre.mrchSorga != null && offre.mrchSorga!.isNotEmpty,
                  child: Text(offre.mrchSorga!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis)),
              subtitle: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Visibility(
                    visible:
                        offre.mrchObjt != null && offre.mrchObjt!.isNotEmpty,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(offre.mrchObjt ?? "--",
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 6),
                        child:TextCurrency(number: offre.mrchCutn,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.black)),
                      ),
                      const SizedBox(
                        width: 20,
                        child: Center(
                            child:
                                FaIcon(FontAwesomeIcons.solidCircle, size: 6)),
                      ),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 6),
                        child: Text(offre.mrchCntca ?? "---",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.black)),
                      ),
                      const Expanded(child: SizedBox()),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.calendar,
                            size: 15,
                            color:
                                Theme.of(context).primaryColor.withOpacity(.7),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            dateFormatDMY(date: offre.mrchDlmt!),
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                    color: Theme.of(context).primaryColor),
                          )
                        ],
                      )
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Visibility(
                          visible: offre.mrchDssi != null,
                          child: Text(
                            DateFormat.yMd().add_Hm().format(offre.mrchDssi!),
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(fontStyle: FontStyle.italic),
                          )),
                      const Expanded(child: SizedBox()),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.locationDot,
                            size: 15,
                            color: Colors.green.shade500,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            offre.pays!.paysLabel ?? "---",
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: Colors.green.shade900),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
