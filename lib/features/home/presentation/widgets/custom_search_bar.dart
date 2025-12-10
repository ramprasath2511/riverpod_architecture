import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
    required this.onSearchQueryChanged,
  });

  final ValueChanged<String> onSearchQueryChanged;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final _controller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: _controller,
        cursorColor: Theme.of(context).textTheme.bodyMedium?.color,
        decoration: InputDecoration(
          hintText: 'Search...',
          suffixIcon: IconButton(
            onPressed: () => widget.onSearchQueryChanged(_controller.text),
            icon: const Icon(Icons.search),
          ),
        ),
        onSubmitted: (_) => widget.onSearchQueryChanged(_controller.text),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
