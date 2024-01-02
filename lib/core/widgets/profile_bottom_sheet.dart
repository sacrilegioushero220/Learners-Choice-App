import 'package:flutter/material.dart';

Future<dynamic> showProfileDialog(
  BuildContext context,
) {
  return showModalBottomSheet(
    context: context,
    builder: (context) => SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          const ListTile(
            title: Text("Profile"),
          ),
          Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    onChanged: (value) {},
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              onPressed: () {},
              child: const Text("Update"),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    ),
  );
}

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const ListTile(
              title: Text("Profile"),
            ),
            Row(
              children: [
                const SizedBox(width: 16),
                //  PaisaUserImageWidget(pickImage: () => _pickImage(context)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                onPressed: () {},
                child: const Text("Update"),
              ),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
