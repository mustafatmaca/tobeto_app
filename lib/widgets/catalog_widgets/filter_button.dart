import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  final List<String> filterOptions;
  final Function(String) onFilterSelected;

  const FilterButton({
    Key? key,
    required this.filterOptions,
    required this.onFilterSelected,
  }) : super(key: key);

  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  String selectedFilter = ''; // Seçilen filtreleme seçeneği

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(colors: [
              Color(0xFF004D79),
              Color(0xFF011D42),
              Color(0xFF341132),
            ], begin: Alignment.topCenter, end: Alignment.bottomLeft),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DropdownButton<String>(
            value: selectedFilter.isNotEmpty
                ? selectedFilter
                : null, // Sabit metni göstermek için null kullanılır
            onChanged: (value) {
              assert(value != null, "DropdownButton value cannot be null");
              setState(() {
                selectedFilter = value!;
              });
              widget.onFilterSelected(value!);
            },
            items: widget.filterOptions.map((filter) {
              return DropdownMenuItem<String>(
                value: filter,
                child: Text(
                  filter,
                  style: TextStyle(
                    color:
                        selectedFilter == filter ? Colors.white : Colors.black,
                  ),
                ),
              );
            }).toList(),
            hint: Text(
              "Filtrele",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.background,
                  fontWeight: FontWeight.bold),
            ),
            iconEnabledColor: Theme.of(context).colorScheme.background,
            underline: Container(), // Alt çizgiyi kaldır
          ),
        ),
      ],
    );
  }
}
