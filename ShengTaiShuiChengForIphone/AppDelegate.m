//
//  AppDelegate.m
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/20.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "TravelHomeViewController.h"
#import "FindViewController.h"
#import "MineViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.userInteractionEnabled = YES;
    [self.window makeKeyAndVisible];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.delegate = self;
    self.window.rootViewController = tabBarController;
    
    DSXNavigationController *navHome, *navTravel, *navFind, *navMine;
    HomeViewController *homeView = [[HomeViewController alloc] init];
    navHome = [[DSXNavigationController alloc] initWithRootViewController:homeView];
    navHome.tabBarItem = [self tabBarItemWithTitle:@"首页" image:@"icon-home.png" selectedImage:@"icon-selected-home.png"];
    [navHome setNavBarStyle:ZWNavigationBarStyleOrange];
    
    TravelHomeViewController *travelView = [[TravelHomeViewController alloc] init];
    navTravel = [[DSXNavigationController alloc] initWithRootViewController:travelView];
    navTravel.tabBarItem = [self tabBarItemWithTitle:@"旅游之家" image:@"icon-travel.png" selectedImage:@"icon-selected-travel.png"];
    [navTravel setNavBarStyle:ZWNavigationBarStyleOrange];
    
    FindViewController *findView = [[FindViewController alloc] init];
    navFind = [[DSXNavigationController alloc] initWithRootViewController:findView];
    navFind.tabBarItem = [self tabBarItemWithTitle:@"发现" image:@"icon-find.png" selectedImage:@"icon-selected-find.png"];
    [navFind setNavBarStyle:ZWNavigationBarStyleOrange];
    
    MineViewController * mineView = [[MineViewController alloc] init];
    navMine = [[DSXNavigationController alloc] initWithRootViewController:mineView];
    navMine.tabBarItem = [self tabBarItemWithTitle:@"我的" image:@"icon-mine.png" selectedImage:@"icon-selected-mine.png"];
    [navMine setNavBarStyle:ZWNavigationBarStyleOrange];
    
    [tabBarController setViewControllers:@[navHome,navTravel,navFind,navMine]];
//    [tabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbg.png"]];
    
    //启用定位服务
//    if ([CLLocationManager locationServicesEnabled]) {
//        if ([CLLocationManager authorizationStatus] == 2) {
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"定位服务被禁止"
//                                                            message:@"我们需要访问你的位置才能为你显示当前的位置信息"
//                                                           delegate:self
//                                                  cancelButtonTitle:@"取消"
//                                                  otherButtonTitles:@"确定", nil];
//            [alert show];
//        }else {
//            CLLocationManager *clmanager = [[CLLocationManager alloc] init];
//            [clmanager startUpdatingLocation];
//            CLLocation *location = [clmanager location];
//            CLGeocoder *geocoder = [[CLGeocoder alloc] init];
//            [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
//                if ([placemarks count] > 0) {
//                    CLPlacemark *placeMark = [placemarks firstObject];
//                    [[NSUserDefaults standardUserDefaults] setObject:placeMark.locality forKey:@"locality"];
//                }else {
//                    NSLog(@"%@", error);
//                }
//            }];
//        }
//    }else {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"定位服务未开启"
//                                                        message:@"我们需要访问你的位置才能为你显示当前的地理位置信息"
//                                                       delegate:self
//                                              cancelButtonTitle:@"取消"
//                                              otherButtonTitles:@"确定", nil];
//        [alert show];
//    }

    
    return YES;
}


- (UITabBarItem *)tabBarItemWithTitle:(NSString *)title image:(NSString *)imageName selectedImage:(NSString *)selectedImageName{
    UIImage *image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image selectedImage:selectedImage];
    
    [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:1 green:0 blue:0 alpha:1]} forState:UIControlStateSelected];
    
    return tabBarItem;
}

//#pragma mark - navigationcontroller delegate
//- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
//    if (viewController == tabBarController.viewControllers[3] || viewController == tabBarController.viewControllers[4]) {
//        if ([[UserStatus sharedStatus] logged] == NO) {
////            LoginViewController *loginView = [[LoginViewController alloc] init];
////            DSXNavigationController *navigation = [[DSXNavigationController alloc] initWithRootViewController:loginView];
////            [tabBarController presentViewController:navigation animated:YES completion:nil];
//            return NO;
//        }
//    }
//    return YES;
//}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "cn.zhangwoo.xingwei.XingWeiForIPhone" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"ShengTaiShuiChengForIPhone" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}


- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"ShengTaiShuiChengForIPhone.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
