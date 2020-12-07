//
//  SceneDelegate.m
//  FetchCodingExercise
//
//  Created by Blake Jansen on 12/5/20.
//

#import "SceneDelegate.h"
#import "FetchRootViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    FetchRootViewController *ftc = [FetchRootViewController new];
    UINavigationController *nav = [UINavigationController new];
    [nav addChildViewController:ftc];
    self.window.rootViewController = nav;
}


@end
