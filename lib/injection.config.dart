// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:FantasyE/application/auth/auth_form/auth_notifier.dart' as _i21;
import 'package:FantasyE/application/auth/auth_logic/auth_logic_notifier.dart'
    as _i22;
import 'package:FantasyE/application/auth/auth_users/auth_users_notifier.dart'
    as _i20;
import 'package:FantasyE/application/auth/manage_account/manage_account_notifier.dart'
    as _i19;
import 'package:FantasyE/application/avatar/add_avatar/add_avatar_bloc.dart'
    as _i14;
import 'package:FantasyE/application/avatar/avatar_manager/avatar_manager_bloc.dart'
    as _i17;
import 'package:FantasyE/application/avatar/avatar_watcher/avatar_watcher_bloc.dart'
    as _i18;
import 'package:FantasyE/application/league/league_manager/league_manager_notifier.dart'
    as _i8;
import 'package:FantasyE/application/league/league_watcher/league_watcher_notifier.dart'
    as _i13;
import 'package:FantasyE/domain/auth/i_auth_facade.dart' as _i15;
import 'package:FantasyE/domain/avatar/i_avatar_repository.dart' as _i9;
import 'package:FantasyE/domain/leagues/i_league_repository.dart' as _i6;
import 'package:FantasyE/domain/manage_account/i_manage_account_facade.dart'
    as _i11;
import 'package:FantasyE/infrastructure/auth/api_client.dart' as _i3;
import 'package:FantasyE/infrastructure/auth/repository/auth_repository.dart'
    as _i16;
import 'package:FantasyE/infrastructure/avatar/api_client.dart' as _i4;
import 'package:FantasyE/infrastructure/avatar/repository/avatar_repository.dart'
    as _i10;
import 'package:FantasyE/infrastructure/leagues/api_client.dart' as _i5;
import 'package:FantasyE/infrastructure/leagues/repository/league_repository.dart'
    as _i7;
import 'package:FantasyE/infrastructure/manage_accounts/repository/edit_account_repository.dart'
    as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ApiClient>(() => _i3.ApiClient());
    gh.factory<_i4.ApiClient>(() => _i4.ApiClient());
    gh.factory<_i5.ApiClient>(() => _i5.ApiClient());
    gh.lazySingleton<_i6.ILeagueRepository>(
        () => _i7.LeagueRepository(gh<_i5.ApiClient>()));
    gh.factory<_i8.LeagueManagerNotifier>(
        () => _i8.LeagueManagerNotifier(gh<_i6.ILeagueRepository>()));
    gh.lazySingleton<_i9.IAvatarRepository>(
        () => _i10.AvatarRepository(apiClient: gh<_i4.ApiClient>()));
    gh.lazySingleton<_i11.IManageAccountFacade>(
        () => _i12.AccountManagementRepository(apiClient: gh<_i3.ApiClient>()));
    gh.factory<_i13.LeagueWatcherNotifier>(
        () => _i13.LeagueWatcherNotifier(gh<_i6.ILeagueRepository>()));
    gh.factory<_i14.AddAvatarBloc>(
        () => _i14.AddAvatarBloc(gh<_i9.IAvatarRepository>()));
    gh.lazySingleton<_i15.IAuthFacade>(
        () => _i16.AuthRepository(apiClient: gh<_i3.ApiClient>()));
    gh.factory<_i17.AvatarManagerBloc>(
        () => _i17.AvatarManagerBloc(gh<_i9.IAvatarRepository>()));
    gh.factory<_i18.AvatarWatcherBloc>(
        () => _i18.AvatarWatcherBloc(gh<_i9.IAvatarRepository>()));
    gh.factory<_i19.ManageAccountNotifier>(
        () => _i19.ManageAccountNotifier(gh<_i11.IManageAccountFacade>()));
    gh.factory<_i20.AuthUsersNotifier>(
        () => _i20.AuthUsersNotifier(gh<_i11.IManageAccountFacade>()));
    gh.factory<_i21.SignupFormNotifier>(
        () => _i21.SignupFormNotifier(gh<_i15.IAuthFacade>()));
    gh.factory<_i21.LoginFormNotifier>(
        () => _i21.LoginFormNotifier(gh<_i15.IAuthFacade>()));
    gh.factory<_i22.AuthLogicNotifier>(
        () => _i22.AuthLogicNotifier(gh<_i15.IAuthFacade>()));
    return this;
  }
}
