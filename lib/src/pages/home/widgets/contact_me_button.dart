part of '../home_page.dart';

class _ContactMeButton extends StatelessWidget {
  const _ContactMeButton();

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        showCustomModalBottomSheet(
          context: context,
          childBuilder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  title: const Text(
                    'Email',
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                  subtitle: const Text(
                    'gigok100@gmail.com',
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                  onTap: () {
                    url_launcher.launchUrl(
                      Uri.parse('mailto:gigok100@gmail.com'),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  trailing: CustomIconButton(
                    onPressed: () async {
                      await ClipboardService.copyAndNotify(
                        context,
                        'gigok100@gmail.com',
                      );
                      if (context.mounted && Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    icon: const Icon(Icons.copy_rounded),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Telegram',
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                  subtitle: const Text(
                    't.me/utopic_narwhal',
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                  onTap: () {
                    url_launcher.launchUrl(
                      Uri.parse('https://t.me/utopic_narwhal'),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  trailing: CustomIconButton(
                    onPressed: () async {
                      await ClipboardService.copyAndNotify(
                        context,
                        'https://t.me/utopic_narwhal',
                      );
                      if (context.mounted && Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    icon: const Icon(Icons.copy_rounded),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'LinkedIn',
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                  subtitle: const Text(
                    'linkedin.com/in/sergei-danilov-ab1b64164',
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                  onTap: () {
                    url_launcher.launchUrl(
                      Uri.parse('https://linkedin.com/in/sergei-danilov-ab1b64164'),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  trailing: CustomIconButton(
                    onPressed: () async {
                      await ClipboardService.copyAndNotify(
                        context,
                        'https://linkedin.com/in/sergei-danilov-ab1b64164',
                      );
                      if (context.mounted && Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    icon: const Icon(Icons.copy_rounded),
                  ),
                ),
              ],
            );
          },
        );
      },
      text: Dictums.of(context).contactMeButton,
    );
  }
}
