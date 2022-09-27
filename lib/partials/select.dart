import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Select extends StatefulWidget {
  const Select(
      {super.key, required this.list, required this.field, required this.id,required this.selectedList});
  final List list;
  final Function field;
  final Function id;
  final List<int> selectedList;
  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
   List<int> selectedItem = [];
  List filteredList = [];
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    selectedItem=widget.selectedList;
    filteredList.addAll(widget.list);
    searchController.addListener(() {
      search(searchController.text);
    });
  }

  void search(String s) {
    List temp = [];

    if (s.isEmpty) {
      temp.addAll(widget.list);
    } else {
      for (var element in widget.list) {
        if (widget
            .field(element)
            .toString()
            .toLowerCase()
            .contains(s.toLowerCase())) {
          temp.add(element);
        }
      }
    }
    setState(() {
      filteredList = temp;
    });
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              splashRadius: 22,
              onPressed: () {
                Get.back(
                    result: selectedItem);
              },
              icon: const FaIcon(FontAwesomeIcons.chevronLeft)),
          title: TextFormField(
            controller: searchController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
                hintText: 'Recherche'),
          ),
        ),
        body: ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              var item = filteredList[index];
              bool isSelected = selectedItem.contains(widget.id(item));
              return ListTile(
                onTap: () {
                  if (isSelected) {
                    setState(() {
                      selectedItem.remove(widget.id(item));
                    });
                  } else {
                    setState(() {
                      selectedItem.add(widget.id(item));
                    });
                  }
                },
                dense: true,
                title: Text(widget.field(item)),
                trailing: FaIcon(
                    isSelected
                        ? FontAwesomeIcons.circleDot
                        : FontAwesomeIcons.circle,
                    color: isSelected ? Theme.of(context).primaryColor : null),
              );
            }));
  }
}
