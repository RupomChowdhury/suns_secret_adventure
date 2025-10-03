import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/home_screen.dart';
import 'screens/chapters_screen.dart';
import 'screens/story_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/story_introduction_screen.dart';
import 'screens/learnings_screen.dart';
import 'screens/live_events_screen.dart';
import 'screens/missions_screen.dart';
import 'screens/games_screen.dart';
import 'screens/nasa_kids_screen.dart';
import 'screens/feedback_screen.dart';
import 'screens/crew_guardian_mission.dart';
import 'screens/satellite_mission.dart';
import 'screens/power_grid_mission.dart';
import 'screens/character_selection_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      pageBuilder: (context, state) => const MaterialPage(child: HomeScreen()),
    ),
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      pageBuilder: (context, state) => const MaterialPage(child: OnboardingScreen()),
    ),
    GoRoute(
      path: '/character_selection',
      name: 'character_selection',
      pageBuilder: (context, state) {
        final name = state.extra as String? ?? 'Explorer';
        return MaterialPage(child: CharacterSelectionScreen(name: name));
      },
    ),
    GoRoute(
      path: '/story_introduction',
      name: 'story_introduction',
      pageBuilder: (context, state) {
        final name = state.extra as String? ?? 'Explorer';
        return MaterialPage(child: StoryIntroductionScreen(name: name));
      },
    ),
    GoRoute(
      path: '/chapters',
      name: 'chapters',
      pageBuilder: (context, state) => const MaterialPage(child: ChaptersScreen()),
    ),
    GoRoute(
      path: '/story/:chapterId',
      name: 'story',
      pageBuilder: (context, state) {
        final id = state.pathParameters['chapterId'] ?? '1';
        return MaterialPage(child: StoryScreen(chapterId: id));
      },
    ),
    GoRoute(
      path: '/quiz',
      name: 'quiz',
      pageBuilder: (context, state) => const MaterialPage(child: QuizScreen()),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      pageBuilder: (context, state) => const MaterialPage(child: SettingsScreen()),
    ),
    GoRoute(
      path: '/learnings',
      name: 'learnings',
      pageBuilder: (context, state) => const MaterialPage(child: LearningsScreen()),
    ),
    GoRoute(
      path: '/live_events',
      name: 'live_events',
      pageBuilder: (context, state) => const MaterialPage(child: LiveEventsScreen()),
    ),
    GoRoute(
      path: '/missions',
      name: 'missions',
      pageBuilder: (context, state) => const MaterialPage(child: MissionsScreen()),
    ),
    GoRoute(
      path: '/games',
      name: 'games',
      pageBuilder: (context, state) => const MaterialPage(child: GamesScreen()),
    ),
    GoRoute(
      path: '/nasa_kids',
      name: 'nasa_kids',
      pageBuilder: (context, state) => const MaterialPage(child: NasaKidsScreen()),
    ),
    GoRoute(
      path: '/feedback',
      name: 'feedback',
      pageBuilder: (context, state) => const MaterialPage(child: FeedbackScreen()),
    ),
    GoRoute(
      path: '/crew_guardian_mission',
      name: 'crew_guardian_mission',
      pageBuilder: (context, state) => const MaterialPage(child: CrewGuardianMission()),
    ),
    GoRoute(
      path: '/satellite_mission',
      name: 'satellite_mission',
      pageBuilder: (context, state) => const MaterialPage(child: SatelliteMission()),
    ),
    GoRoute(
      path: '/power_grid_mission',
      name: 'power_grid_mission',
      pageBuilder: (context, state) => const MaterialPage(child: PowerGridMission()),
    ),
  ],
);
