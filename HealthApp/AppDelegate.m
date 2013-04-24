//
//  AppDelegate.m
//  HealthApp
//
//  Created by Pablo Epíscopo on 21/05/12.
//  Copyright (c) 2012 pabloepi14@hotmail.com. All rights reserved.
//

#import "AppDelegate.h"
#import "ICD9ViewController.h"
#import "ICD10ViewController.h"
//#import "SearchViewController.h"
#import "SearchTableViewController.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.backgroundColor = [UIColor whiteColor];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
    
    /* Creacion de TabBarController */
    UITabBarController *tabBarController=[[UITabBarController alloc] init];
    
    /* Search NavigationBar and Table */
    searchTableViewController = [[SearchTableViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *navControllerSearch=[[UINavigationController alloc] initWithRootViewController:searchTableViewController];
    
    /* ICD9 NavigationBar and Table */
    icd9ViewController = [[ICD9ViewController alloc] initWithStyle:UITableViewStyleGrouped] ;
    UINavigationController *navControllerICD9=[[UINavigationController alloc] initWithRootViewController:icd9ViewController];
    [[icd9ViewController tableView] setScrollEnabled:NO];
    
    /* ICD10 NavigationBar and Table */
    icd10ViewController = [[ICD10ViewController alloc] initWithStyle:UITableViewStyleGrouped];
    UINavigationController *navControllerICD10=[[UINavigationController alloc] initWithRootViewController:icd10ViewController];
    [[icd10ViewController tableView] setScrollEnabled:NO];
    
    /* Agregar objetos al TabBar */
    [tabBarController setViewControllers:[NSArray arrayWithObjects:navControllerICD9, navControllerICD10, navControllerSearch, nil]];
    [navControllerSearch release];
    [self.window setRootViewController:tabBarController];
    
    [navControllerICD9 release];
    [navControllerICD10 release];

    [tabBarController release];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    sleep(2);
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    sleep(2);
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
