//
//  VideoMaker.h
//  Pods
//
//  Created by fang wang on 17/2/28.
//
//

#ifndef VideoMaker_h
#define VideoMaker_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <CoreImage/CoreImage.h>
#import <CoreMedia/CoreMedia.h>

#import "VDocument.h"
#import "CollageLayout.h"
#import "CollageSlidingLayout.h"

#import "CIImage+Convenience.h"
#import "AssetsCollection.h"
#import "VAsset.h"
#import "VAssetCollage.h"
#import "VAssetPHImage.h"
#import "VAssetWebImage.h"

#import "VAssetSegment.h"
#import "VSegmentsCollection.h"

#import "VRenderingStats.h"
#import "VideoComposition.h"
#import "VideoCompositor.h"
#import "VCompositionInstruction.h"

#import "VFrameRequest.h"
#import "VCoreVideoFrameProvider.h"
#import "VFrameProvider.h"
#import "VProvidersCollection.h"
#import "VStillImage.h"

#import "VEAspectFill.h"
#import "VEAspectFit.h"
#import "VEFadeInFadeOut.h"
#import "VEffect.h"
#import "VEKenBurns.h"


#import "VCollageFrame.h"

#import "VAccordionOrigamiTransition.h"
#import "VBookPageOrigamiTransition.h"
#import "VFoldingOrigamiTransition.h"
#import "VTwistingOrigamiTransition.h"

#import "VCollageBuilder.h"
#import "VKenBurnsCollageBuilder.h"
#import "VOrigamiCollageBuilder.h"
#import "VSlidingPanelsCollageBuilder.h"

#import "TransitionFilter.h"
#import "VTransition.h"
#import "VTransitionFactory.h"
#import "VTransition01Fading.h"
#import "VTransition02CIAccordionFoldTransition.h"
#import "VTransition03CIBarsSwipeTransition.h"
#import "VTransition04CIDissolveTransition.h"
#import "VTransition05CIModTransition.h"
#import "VTransition06CISwipeTransition.h"
#import "VTransition07CIPageCurlWithShadowTransition.h"
#import "VTransition08CIBarsSwipeTransition.h"
#import "VTransition09CIBarsSwipeTransition.h"
#import "VTransition10CIBarsSwipeTransition.h"
#import "VTransition11CIBarsSwipeTransition.h"
#import "VTransition12CIBarsSwipeTransition.h"
#import "VTransition13CIModTransition.h"
#import "VTransition14CIModTransition.h"
#import "VTransition15CIModTransition.h"
#import "VTransition16CIModTransition.h"
#import "VTransition17CIModTransition.h"
#import "VTransition18CISwipeTransition.h"
#import "VTransition19CISwipeTransition.h"
#import "VTransition20CISwipeTransition.h"
#import "VTransition21CISwipeTransition.h"
#import "VTransition22CISwipeTransition.h"
#import "VTransition23CIPageCurlWithShadowTransition.h"
#import "VTransition24CIPageCurlWithShadowTransition.h"
#import "VTransition25CIPageCurlWithShadowTransition.h"
#import "VTransition26CIPageCurlWithShadowTransition.h"
#import "VTransition27CIPageCurlWithShadowTransition.h"

#import "PlayerView.h"


#endif /* VideoMaker_h */
