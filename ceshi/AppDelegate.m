//
//  AppDelegate.m
//  ceshi
//
//  Created by honey on 2018/4/20.
//  Copyright © 2018年 honey. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end
NSString * applicationDocumentDirectory(){
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}
//崩溃回调
void UncaughtExceptionHandler(NSException *e){
    NSArray *array = [e callStackSymbols];
    NSString *reason = [e reason];
    NSString *name = [e name];
    NSString * url = [NSString stringWithFormat:@"========异常错误报告========\nname:%@\nreason:\n%@\ncallStackSymbols:\n%@",name,reason,[array componentsJoinedByString:@"\n"]];
    NSString *path = [applicationDocumentDirectory() stringByAppendingPathComponent:@"excetiion.txt"];
    NSLog(@"%@",path);
    [url writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
}
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
    
    //发送崩溃日志
    NSString *path = [applicationDocumentDirectory() stringByAppendingPathComponent:@"excetiion.txt"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    if (data != nil){
        
    }
    return YES;
}


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
}


@end
