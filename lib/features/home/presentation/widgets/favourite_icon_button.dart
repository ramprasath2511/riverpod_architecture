import 'package:flutter/material.dart';

import '../../domain/entities/image_model.dart';


class FavouriteIconButton extends StatefulWidget {
  const FavouriteIconButton({
    super.key,
    required this.image,
    this.isSelectedInitial = false,
    required this.onFavourited,
    required this.onUnfavourited,
  });

  final ImageModel image;
  final bool isSelectedInitial;
  final VoidCallback onFavourited;
  final VoidCallback onUnfavourited;

  @override
  State<FavouriteIconButton> createState() => _FavouriteIconButtonState();
}

class _FavouriteIconButtonState extends State<FavouriteIconButton> {
  late bool _isFavourited;

  @override
  void initState() {
    super.initState();
    _isFavourited = widget.isSelectedInitial;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: _toggle,
        icon: Icon(
          Icons.favorite,
          color: _isFavourited ? Colors.red : Colors.grey,
        ),
      ),
    );
  }

  void _toggle() {
    setState(() {
      _isFavourited = !_isFavourited;
      _isFavourited ? widget.onFavourited() : widget.onUnfavourited();
    });
  }
}