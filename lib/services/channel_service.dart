import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/channel_model.dart';
import 'supabase_service.dart';

class ChannelService {
  RealtimeChannel? _channel;

  /// Fetch all channels
  Future<List<Channel>> getChannels() async {
    final response = await SupabaseService.client
        .from('channels')
        .select();

    return response
        .map<Channel>((map) => Channel.fromMap(map))
        .toList();
  }

  /// Subscribe to realtime changes
  Stream<List<Channel>> subscribeChannels() {
    late StreamController<List<Channel>> controller;

    controller = StreamController<List<Channel>>(
      onListen: () async {
        try {
          // Load initial data
          final initialChannels = await getChannels();
          controller.add(initialChannels);

          // Create realtime subscription
          _channel = SupabaseService.client
              .channel('public:channels')
              .onPostgresChanges(
                event: PostgresChangeEvent.all,
                schema: 'public',
                table: 'channels',
                callback: (payload) async {
                  try {
                    // Reload updated data
                    final updatedChannels = await getChannels();

                    if (!controller.isClosed) {
                      controller.add(updatedChannels);
                    }
                  } catch (e) {
                    if (!controller.isClosed) {
                      controller.addError(e);
                    }
                  }
                },
              )
              .subscribe();
        } catch (e) {
          if (!controller.isClosed) {
            controller.addError(e);
          }
        }
      },
      onCancel: () async {
        // Remove realtime subscription
        if (_channel != null) {
          await SupabaseService.client.removeChannel(_channel!);
        }

        await controller.close();
      },
    );

    return controller.stream;
  }
}