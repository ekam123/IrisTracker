//
//  SampleAppManagerBridge.m
//  TrainingApp
//
//  Created by Ekam  on 2020-05-04.
//

#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"
#import "React/RCTEventEmitter.h"

@interface RCT_EXTERN_MODULE(SampleAppManager, RCTEventEmitter)

RCT_EXTERN_METHOD(openIrisApp)

@end
