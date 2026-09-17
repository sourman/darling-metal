// SPDX-FileCopyrightText: 2026 Darling Developers
// SPDX-License-Identifier: MPL-2.0

#import <Metal/Metal.h>
#if DARLING_METAL_ENABLED
#include <indium/indium.hpp>
#endif
#import <Metal/MTLDeviceInternal.h>
#import <Metal/stubs.h>

#if DARLING_METAL_ENABLED

// TODO: add some extension here that MetalKit needs.
//
// because MetalKit gets loaded after we do, it has no way to tell us what extensions it needs.
// so, we have to hardcode it here and always require those extensions, even if we don't actually
// use MetalKit. TODO: find some way to avoid hardcoding these extensions.
static const char* additionalExtensions[] = {
	// we don't render to these directly; see CAMetalDrawable.mm (in Cocotron's QuartzCore) for more details
	//"VK_KHR_xlib_surface",
	//"VK_KHR_surface",
	//"VK_KHR_swapchain",
};

__attribute__((constructor))
static void initMetal(void) {
	// Skip Indium/Vulkan. Loading lavapipe on this host SIGILL'd Comet.
};

__attribute__((destructor))
static void finitMetal(void) {
};

#endif

// Comet/Chromium 151 compatibility stubs for symbols not yet implemented in Darling Metal.
extern "C" {
void MTLCommonCounterSetTimestamp(void) {}
void MTLCommonCounterTimestamp(void) {}
}
