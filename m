Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBD610EB;
	Sun,  4 Feb 2024 01:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707010341; cv=none; b=f0TL3ZaCqTJdTB1fJNGPEEBCcc5bFj6nv1s23irrdUFD6/y+LFOcCyaEgWiHKsnNqnJ+yBu81sYsM7r5HjBbC0cM/60HHsHJZs7QDwMH7yGQrATA5oxxV4c8kpCpkpS3E/jsfdYd9NYug/USohYUorQ2iDAnIrpWWvcMLsM6hk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707010341; c=relaxed/simple;
	bh=9rtXi9FZrZVS4n3JMxU82Bap/PP7tG9Sd595ece2kBQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FI1+QejgHVkF9lKxMfoFf6/MFtxL5uBAfTYK+Dc1/via4bHnFjYIFO7lHRsXO1vDiKmxWHsUkur+Ayg9cHhJdNEznAg8tVtA/0E3TbcaX2gNSC1AcE+Kc8k1ZVAoXFsxjsetelSDV2wkXcWnAIriS9IZd3VDzZZqK0BIkdRuCic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jgJypugp; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jgJypugp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707010339; x=1738546339;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9rtXi9FZrZVS4n3JMxU82Bap/PP7tG9Sd595ece2kBQ=;
  b=jgJypugpO1W57MVFyMj235LgnVp4RqutWXz4HVKPTA5JJr/2obIQL9JO
   z2wtZJlASaE48tFK3YTLcaSIUlwFnrBJBR3QK1hxaZEkt1OY0vbrZQ5yn
   BE4RLulJf8Xin4qrgW+LcMvxqZtNn+0nGe630UrhYgOvRzM2muIXhp/Q1
   9j2eq5ct1LWyBegfDsQv9RDf2dDK+mpgrADH7NbwWeUd+Zhk3bGykHAMi
   ivZTalCV1eP/2QSN2RRdER0ldD5CKFMkTbhLbOw6KpAgmS0cxKkn7Merj
   nramjqoeUYRmc19Dj9f+jP0NdWeic8Od0truIj7975y8OHuvIBXFCIYm5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="273805"
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="273805"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 17:32:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="692056"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 03 Feb 2024 17:32:16 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWRMi-0005r2-2q;
	Sun, 04 Feb 2024 01:32:13 +0000
Date: Sun, 4 Feb 2024 09:31:14 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Subject: [drm-misc:drm-misc-next 1/1] drivers/gpu/drm/xe/xe_bo.c:42:20:
 warning: incompatible pointer to integer conversion initializing 'unsigned
 int' with an expression of type 'const struct ttm_place *'
Message-ID: <202402040923.VZprV5x8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   3d94e7584486f7ac4a44fe215330ae6a1094e492
commit: 4db102dcb0396a4ccf89b1eac0f4eb3fd167a080 [1/1] Merge drm/drm-next into drm-misc-next
config: arm64-randconfig-002-20240204 (https://download.01.org/0day-ci/archive/20240204/202402040923.VZprV5x8-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402040923.VZprV5x8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402040923.VZprV5x8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_bo.c:41:3: error: field designator 'num_busy_placement' does not refer to any field in type 'struct ttm_placement'; did you mean 'num_placement'?
           .num_busy_placement = 1,
            ^~~~~~~~~~~~~~~~~~
            num_placement
   include/drm/ttm/ttm_placement.h:99:12: note: 'num_placement' declared here
           unsigned                num_placement;
                                   ^
   drivers/gpu/drm/xe/xe_bo.c:41:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           .num_busy_placement = 1,
                                 ^
   drivers/gpu/drm/xe/xe_bo.c:39:19: note: previous initialization is here
           .num_placement = 1,
                            ^
   drivers/gpu/drm/xe/xe_bo.c:42:3: error: field designator 'busy_placement' does not refer to any field in type 'struct ttm_placement'; did you mean 'num_placement'?
           .busy_placement = &sys_placement_flags,
            ^~~~~~~~~~~~~~
            num_placement
   include/drm/ttm/ttm_placement.h:99:12: note: 'num_placement' declared here
           unsigned                num_placement;
                                   ^
>> drivers/gpu/drm/xe/xe_bo.c:42:20: warning: incompatible pointer to integer conversion initializing 'unsigned int' with an expression of type 'const struct ttm_place *' [-Wint-conversion]
           .busy_placement = &sys_placement_flags,
                             ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:42:20: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           .busy_placement = &sys_placement_flags,
                             ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:41:24: note: previous initialization is here
           .num_busy_placement = 1,
                                 ^
   drivers/gpu/drm/xe/xe_bo.c:55:3: error: field designator 'num_busy_placement' does not refer to any field in type 'struct ttm_placement'; did you mean 'num_placement'?
           .num_busy_placement = 1,
            ^~~~~~~~~~~~~~~~~~
            num_placement
   include/drm/ttm/ttm_placement.h:99:12: note: 'num_placement' declared here
           unsigned                num_placement;
                                   ^
   drivers/gpu/drm/xe/xe_bo.c:55:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           .num_busy_placement = 1,
                                 ^
   drivers/gpu/drm/xe/xe_bo.c:53:19: note: previous initialization is here
           .num_placement = 1,
                            ^
   drivers/gpu/drm/xe/xe_bo.c:56:3: error: field designator 'busy_placement' does not refer to any field in type 'struct ttm_placement'; did you mean 'num_placement'?
           .busy_placement = &sys_placement_flags,
            ^~~~~~~~~~~~~~
            num_placement
   include/drm/ttm/ttm_placement.h:99:12: note: 'num_placement' declared here
           unsigned                num_placement;
                                   ^
   drivers/gpu/drm/xe/xe_bo.c:56:20: warning: incompatible pointer to integer conversion initializing 'unsigned int' with an expression of type 'const struct ttm_place *' [-Wint-conversion]
           .busy_placement = &sys_placement_flags,
                             ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:56:20: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           .busy_placement = &sys_placement_flags,
                             ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:55:24: note: previous initialization is here
           .num_busy_placement = 1,
                                 ^
   drivers/gpu/drm/xe/xe_bo.c:233:4: error: field designator 'num_busy_placement' does not refer to any field in type 'struct ttm_placement'; did you mean 'num_placement'?
                   .num_busy_placement = c,
                    ^~~~~~~~~~~~~~~~~~
                    num_placement
   include/drm/ttm/ttm_placement.h:99:12: note: 'num_placement' declared here
           unsigned                num_placement;
                                   ^
   drivers/gpu/drm/xe/xe_bo.c:233:25: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
                   .num_busy_placement = c,
                                         ^
   drivers/gpu/drm/xe/xe_bo.c:231:20: note: previous initialization is here
                   .num_placement = c,
                                    ^
   drivers/gpu/drm/xe/xe_bo.c:234:4: error: field designator 'busy_placement' does not refer to any field in type 'struct ttm_placement'; did you mean 'num_placement'?
                   .busy_placement = bo->placements,
                    ^~~~~~~~~~~~~~
                    num_placement
   include/drm/ttm/ttm_placement.h:99:12: note: 'num_placement' declared here
           unsigned                num_placement;
                                   ^
>> drivers/gpu/drm/xe/xe_bo.c:234:21: warning: incompatible pointer to integer conversion initializing 'unsigned int' with an expression of type 'struct ttm_place[3]' [-Wint-conversion]
                   .busy_placement = bo->placements,
                                     ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:234:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
                   .busy_placement = bo->placements,
                                     ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:233:25: note: previous initialization is here
                   .num_busy_placement = c,
                                         ^
   drivers/gpu/drm/xe/xe_bo.c:254:15: error: no member named 'num_busy_placement' in 'struct ttm_placement'; did you mean 'num_placement'?
                           placement->num_busy_placement = 0;
                                      ^~~~~~~~~~~~~~~~~~
                                      num_placement
   include/drm/ttm/ttm_placement.h:99:12: note: 'num_placement' declared here
           unsigned                num_placement;
                                   ^
   drivers/gpu/drm/xe/xe_bo.c:1356:4: error: field designator 'num_busy_placement' does not refer to any field in type 'struct ttm_placement'; did you mean 'num_placement'?
                   .num_busy_placement = 1,
                    ^~~~~~~~~~~~~~~~~~
                    num_placement
   include/drm/ttm/ttm_placement.h:99:12: note: 'num_placement' declared here
           unsigned                num_placement;
                                   ^
   drivers/gpu/drm/xe/xe_bo.c:1356:25: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
                   .num_busy_placement = 1,
                                         ^
   drivers/gpu/drm/xe/xe_bo.c:1354:20: note: previous initialization is here
                   .num_placement = 1,
                                    ^
   drivers/gpu/drm/xe/xe_bo.c:1357:4: error: field designator 'busy_placement' does not refer to any field in type 'struct ttm_placement'; did you mean 'num_placement'?
                   .busy_placement = place,
                    ^~~~~~~~~~~~~~
                    num_placement
   include/drm/ttm/ttm_placement.h:99:12: note: 'num_placement' declared here
           unsigned                num_placement;
                                   ^
   drivers/gpu/drm/xe/xe_bo.c:1357:21: warning: incompatible pointer to integer conversion initializing 'unsigned int' with an expression of type 'struct ttm_place *' [-Wint-conversion]
                   .busy_placement = place,
                                     ^~~~~
   drivers/gpu/drm/xe/xe_bo.c:1357:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
                   .busy_placement = place,
                                     ^~~~~
   drivers/gpu/drm/xe/xe_bo.c:1356:25: note: previous initialization is here
                   .num_busy_placement = 1,
                                         ^
   drivers/gpu/drm/xe/xe_bo.c:2115:12: error: no member named 'num_busy_placement' in 'struct ttm_placement'; did you mean 'num_placement'?
           placement.num_busy_placement = 1;
                     ^~~~~~~~~~~~~~~~~~
                     num_placement
   include/drm/ttm/ttm_placement.h:99:12: note: 'num_placement' declared here
           unsigned                num_placement;
                                   ^
   drivers/gpu/drm/xe/xe_bo.c:2117:12: error: no member named 'busy_placement' in 'struct ttm_placement'; did you mean 'num_placement'?
           placement.busy_placement = &requested;
                     ^~~~~~~~~~~~~~
                     num_placement
   include/drm/ttm/ttm_placement.h:99:12: note: 'num_placement' declared here
           unsigned                num_placement;
                                   ^
   12 warnings and 11 errors generated.


vim +42 drivers/gpu/drm/xe/xe_bo.c

dd08ebf6c3525a Matthew Brost     2023-03-30   37  
dd08ebf6c3525a Matthew Brost     2023-03-30   38  static struct ttm_placement sys_placement = {
dd08ebf6c3525a Matthew Brost     2023-03-30   39  	.num_placement = 1,
dd08ebf6c3525a Matthew Brost     2023-03-30   40  	.placement = &sys_placement_flags,
dd08ebf6c3525a Matthew Brost     2023-03-30   41  	.num_busy_placement = 1,
dd08ebf6c3525a Matthew Brost     2023-03-30  @42  	.busy_placement = &sys_placement_flags,
dd08ebf6c3525a Matthew Brost     2023-03-30   43  };
dd08ebf6c3525a Matthew Brost     2023-03-30   44  
a201c6ee37d63e Thomas Hellström  2023-06-26   45  static const struct ttm_place tt_placement_flags = {
a201c6ee37d63e Thomas Hellström  2023-06-26   46  	.fpfn = 0,
a201c6ee37d63e Thomas Hellström  2023-06-26   47  	.lpfn = 0,
a201c6ee37d63e Thomas Hellström  2023-06-26   48  	.mem_type = XE_PL_TT,
a201c6ee37d63e Thomas Hellström  2023-06-26   49  	.flags = 0,
a201c6ee37d63e Thomas Hellström  2023-06-26   50  };
a201c6ee37d63e Thomas Hellström  2023-06-26   51  
a201c6ee37d63e Thomas Hellström  2023-06-26   52  static struct ttm_placement tt_placement = {
a201c6ee37d63e Thomas Hellström  2023-06-26   53  	.num_placement = 1,
a201c6ee37d63e Thomas Hellström  2023-06-26   54  	.placement = &tt_placement_flags,
a201c6ee37d63e Thomas Hellström  2023-06-26   55  	.num_busy_placement = 1,
a201c6ee37d63e Thomas Hellström  2023-06-26   56  	.busy_placement = &sys_placement_flags,
a201c6ee37d63e Thomas Hellström  2023-06-26   57  };
a201c6ee37d63e Thomas Hellström  2023-06-26   58  
dd08ebf6c3525a Matthew Brost     2023-03-30   59  bool mem_type_is_vram(u32 mem_type)
dd08ebf6c3525a Matthew Brost     2023-03-30   60  {
d8b52a02cb40fe Maarten Lankhorst 2023-01-12   61  	return mem_type >= XE_PL_VRAM0 && mem_type != XE_PL_STOLEN;
d8b52a02cb40fe Maarten Lankhorst 2023-01-12   62  }
d8b52a02cb40fe Maarten Lankhorst 2023-01-12   63  
d8b52a02cb40fe Maarten Lankhorst 2023-01-12   64  static bool resource_is_stolen_vram(struct xe_device *xe, struct ttm_resource *res)
d8b52a02cb40fe Maarten Lankhorst 2023-01-12   65  {
d8b52a02cb40fe Maarten Lankhorst 2023-01-12   66  	return res->mem_type == XE_PL_STOLEN && IS_DGFX(xe);
dd08ebf6c3525a Matthew Brost     2023-03-30   67  }
dd08ebf6c3525a Matthew Brost     2023-03-30   68  
dd08ebf6c3525a Matthew Brost     2023-03-30   69  static bool resource_is_vram(struct ttm_resource *res)
dd08ebf6c3525a Matthew Brost     2023-03-30   70  {
dd08ebf6c3525a Matthew Brost     2023-03-30   71  	return mem_type_is_vram(res->mem_type);
dd08ebf6c3525a Matthew Brost     2023-03-30   72  }
dd08ebf6c3525a Matthew Brost     2023-03-30   73  
dd08ebf6c3525a Matthew Brost     2023-03-30   74  bool xe_bo_is_vram(struct xe_bo *bo)
dd08ebf6c3525a Matthew Brost     2023-03-30   75  {
d8b52a02cb40fe Maarten Lankhorst 2023-01-12   76  	return resource_is_vram(bo->ttm.resource) ||
d8b52a02cb40fe Maarten Lankhorst 2023-01-12   77  		resource_is_stolen_vram(xe_bo_device(bo), bo->ttm.resource);
d8b52a02cb40fe Maarten Lankhorst 2023-01-12   78  }
d8b52a02cb40fe Maarten Lankhorst 2023-01-12   79  
d8b52a02cb40fe Maarten Lankhorst 2023-01-12   80  bool xe_bo_is_stolen(struct xe_bo *bo)
d8b52a02cb40fe Maarten Lankhorst 2023-01-12   81  {
d8b52a02cb40fe Maarten Lankhorst 2023-01-12   82  	return bo->ttm.resource->mem_type == XE_PL_STOLEN;
dd08ebf6c3525a Matthew Brost     2023-03-30   83  }
dd08ebf6c3525a Matthew Brost     2023-03-30   84  
b23ebae7ab4142 Lucas De Marchi   2023-07-26   85  /**
b23ebae7ab4142 Lucas De Marchi   2023-07-26   86   * xe_bo_is_stolen_devmem - check if BO is of stolen type accessed via PCI BAR
b23ebae7ab4142 Lucas De Marchi   2023-07-26   87   * @bo: The BO
b23ebae7ab4142 Lucas De Marchi   2023-07-26   88   *
b23ebae7ab4142 Lucas De Marchi   2023-07-26   89   * The stolen memory is accessed through the PCI BAR for both DGFX and some
b23ebae7ab4142 Lucas De Marchi   2023-07-26   90   * integrated platforms that have a dedicated bit in the PTE for devmem (DM).
b23ebae7ab4142 Lucas De Marchi   2023-07-26   91   *
b23ebae7ab4142 Lucas De Marchi   2023-07-26   92   * Returns: true if it's stolen memory accessed via PCI BAR, false otherwise.
b23ebae7ab4142 Lucas De Marchi   2023-07-26   93   */
b23ebae7ab4142 Lucas De Marchi   2023-07-26   94  bool xe_bo_is_stolen_devmem(struct xe_bo *bo)
b23ebae7ab4142 Lucas De Marchi   2023-07-26   95  {
b23ebae7ab4142 Lucas De Marchi   2023-07-26   96  	return xe_bo_is_stolen(bo) &&
b23ebae7ab4142 Lucas De Marchi   2023-07-26   97  		GRAPHICS_VERx100(xe_bo_device(bo)) >= 1270;
b23ebae7ab4142 Lucas De Marchi   2023-07-26   98  }
b23ebae7ab4142 Lucas De Marchi   2023-07-26   99  
dd08ebf6c3525a Matthew Brost     2023-03-30  100  static bool xe_bo_is_user(struct xe_bo *bo)
dd08ebf6c3525a Matthew Brost     2023-03-30  101  {
dd08ebf6c3525a Matthew Brost     2023-03-30  102  	return bo->flags & XE_BO_CREATE_USER_BIT;
dd08ebf6c3525a Matthew Brost     2023-03-30  103  }
dd08ebf6c3525a Matthew Brost     2023-03-30  104  
fd0975b7cfee7d Brian Welty       2023-09-25  105  static struct xe_migrate *
fd0975b7cfee7d Brian Welty       2023-09-25  106  mem_type_to_migrate(struct xe_device *xe, u32 mem_type)
dd08ebf6c3525a Matthew Brost     2023-03-30  107  {
fd0975b7cfee7d Brian Welty       2023-09-25  108  	struct xe_tile *tile;
fd0975b7cfee7d Brian Welty       2023-09-25  109  
c73acc1eeba5e3 Francois Dugast   2023-09-12  110  	xe_assert(xe, mem_type == XE_PL_STOLEN || mem_type_is_vram(mem_type));
fd0975b7cfee7d Brian Welty       2023-09-25  111  	tile = &xe->tiles[mem_type == XE_PL_STOLEN ? 0 : (mem_type - XE_PL_VRAM0)];
fd0975b7cfee7d Brian Welty       2023-09-25  112  	return tile->migrate;
fd0975b7cfee7d Brian Welty       2023-09-25  113  }
dd08ebf6c3525a Matthew Brost     2023-03-30  114  
fd0975b7cfee7d Brian Welty       2023-09-25  115  static struct xe_mem_region *res_to_mem_region(struct ttm_resource *res)
fd0975b7cfee7d Brian Welty       2023-09-25  116  {
fd0975b7cfee7d Brian Welty       2023-09-25  117  	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
fd0975b7cfee7d Brian Welty       2023-09-25  118  	struct ttm_resource_manager *mgr;
fd0975b7cfee7d Brian Welty       2023-09-25  119  
fd0975b7cfee7d Brian Welty       2023-09-25  120  	xe_assert(xe, resource_is_vram(res));
fd0975b7cfee7d Brian Welty       2023-09-25  121  	mgr = ttm_manager_type(&xe->ttm, res->mem_type);
fd0975b7cfee7d Brian Welty       2023-09-25  122  	return to_xe_ttm_vram_mgr(mgr)->vram;
dd08ebf6c3525a Matthew Brost     2023-03-30  123  }
dd08ebf6c3525a Matthew Brost     2023-03-30  124  
8c54ee8a8606a4 Thomas Hellström  2023-11-23  125  static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
dd08ebf6c3525a Matthew Brost     2023-03-30  126  			   u32 bo_flags, u32 *c)
dd08ebf6c3525a Matthew Brost     2023-03-30  127  {
8049e3954aeaae Brian Welty       2024-01-10  128  	if (bo_flags & XE_BO_CREATE_SYSTEM_BIT) {
8c54ee8a8606a4 Thomas Hellström  2023-11-23  129  		xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
8c54ee8a8606a4 Thomas Hellström  2023-11-23  130  
8c54ee8a8606a4 Thomas Hellström  2023-11-23  131  		bo->placements[*c] = (struct ttm_place) {
dd08ebf6c3525a Matthew Brost     2023-03-30  132  			.mem_type = XE_PL_TT,
dd08ebf6c3525a Matthew Brost     2023-03-30  133  		};
dd08ebf6c3525a Matthew Brost     2023-03-30  134  		*c += 1;
dd08ebf6c3525a Matthew Brost     2023-03-30  135  
dd08ebf6c3525a Matthew Brost     2023-03-30  136  		if (bo->props.preferred_mem_type == XE_BO_PROPS_INVALID)
dd08ebf6c3525a Matthew Brost     2023-03-30  137  			bo->props.preferred_mem_type = XE_PL_TT;
dd08ebf6c3525a Matthew Brost     2023-03-30  138  	}
dd08ebf6c3525a Matthew Brost     2023-03-30  139  }
dd08ebf6c3525a Matthew Brost     2023-03-30  140  
e7dc1341f0dab3 Matthew Auld      2023-03-23  141  static void add_vram(struct xe_device *xe, struct xe_bo *bo,
e7dc1341f0dab3 Matthew Auld      2023-03-23  142  		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
dd08ebf6c3525a Matthew Brost     2023-03-30  143  {
6a024f1bfdfe3b Matthew Auld      2023-03-31  144  	struct ttm_place place = { .mem_type = mem_type };
fd0975b7cfee7d Brian Welty       2023-09-25  145  	struct xe_mem_region *vram;
fd0975b7cfee7d Brian Welty       2023-09-25  146  	u64 io_size;
dd08ebf6c3525a Matthew Brost     2023-03-30  147  
8049e3954aeaae Brian Welty       2024-01-10  148  	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
8049e3954aeaae Brian Welty       2024-01-10  149  
fd0975b7cfee7d Brian Welty       2023-09-25  150  	vram = to_xe_ttm_vram_mgr(ttm_manager_type(&xe->ttm, mem_type))->vram;
fd0975b7cfee7d Brian Welty       2023-09-25  151  	xe_assert(xe, vram && vram->usable_size);
fd0975b7cfee7d Brian Welty       2023-09-25  152  	io_size = vram->io_size;
dd08ebf6c3525a Matthew Brost     2023-03-30  153  
dd08ebf6c3525a Matthew Brost     2023-03-30  154  	/*
dd08ebf6c3525a Matthew Brost     2023-03-30  155  	 * For eviction / restore on suspend / resume objects
dd08ebf6c3525a Matthew Brost     2023-03-30  156  	 * pinned in VRAM must be contiguous
dd08ebf6c3525a Matthew Brost     2023-03-30  157  	 */
6a024f1bfdfe3b Matthew Auld      2023-03-31  158  	if (bo_flags & (XE_BO_CREATE_PINNED_BIT |
6a024f1bfdfe3b Matthew Auld      2023-03-31  159  			XE_BO_CREATE_GGTT_BIT))
6a024f1bfdfe3b Matthew Auld      2023-03-31  160  		place.flags |= TTM_PL_FLAG_CONTIGUOUS;
6a024f1bfdfe3b Matthew Auld      2023-03-31  161  
fd0975b7cfee7d Brian Welty       2023-09-25  162  	if (io_size < vram->usable_size) {
6a024f1bfdfe3b Matthew Auld      2023-03-31  163  		if (bo_flags & XE_BO_NEEDS_CPU_ACCESS) {
6a024f1bfdfe3b Matthew Auld      2023-03-31  164  			place.fpfn = 0;
6a024f1bfdfe3b Matthew Auld      2023-03-31  165  			place.lpfn = io_size >> PAGE_SHIFT;
6a024f1bfdfe3b Matthew Auld      2023-03-31  166  		} else {
6a024f1bfdfe3b Matthew Auld      2023-03-31  167  			place.flags |= TTM_PL_FLAG_TOPDOWN;
6a024f1bfdfe3b Matthew Auld      2023-03-31  168  		}
6a024f1bfdfe3b Matthew Auld      2023-03-31  169  	}
6a024f1bfdfe3b Matthew Auld      2023-03-31  170  	places[*c] = place;
dd08ebf6c3525a Matthew Brost     2023-03-30  171  	*c += 1;
dd08ebf6c3525a Matthew Brost     2023-03-30  172  
dd08ebf6c3525a Matthew Brost     2023-03-30  173  	if (bo->props.preferred_mem_type == XE_BO_PROPS_INVALID)
e7dc1341f0dab3 Matthew Auld      2023-03-23  174  		bo->props.preferred_mem_type = mem_type;
dd08ebf6c3525a Matthew Brost     2023-03-30  175  }
dd08ebf6c3525a Matthew Brost     2023-03-30  176  
e7dc1341f0dab3 Matthew Auld      2023-03-23  177  static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
8c54ee8a8606a4 Thomas Hellström  2023-11-23  178  			 u32 bo_flags, u32 *c)
dd08ebf6c3525a Matthew Brost     2023-03-30  179  {
e7dc1341f0dab3 Matthew Auld      2023-03-23  180  	if (bo->props.preferred_gt == XE_GT1) {
e7dc1341f0dab3 Matthew Auld      2023-03-23  181  		if (bo_flags & XE_BO_CREATE_VRAM1_BIT)
8c54ee8a8606a4 Thomas Hellström  2023-11-23  182  			add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM1, c);
e7dc1341f0dab3 Matthew Auld      2023-03-23  183  		if (bo_flags & XE_BO_CREATE_VRAM0_BIT)
8c54ee8a8606a4 Thomas Hellström  2023-11-23  184  			add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM0, c);
e7dc1341f0dab3 Matthew Auld      2023-03-23  185  	} else {
e7dc1341f0dab3 Matthew Auld      2023-03-23  186  		if (bo_flags & XE_BO_CREATE_VRAM0_BIT)
8c54ee8a8606a4 Thomas Hellström  2023-11-23  187  			add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM0, c);
e7dc1341f0dab3 Matthew Auld      2023-03-23  188  		if (bo_flags & XE_BO_CREATE_VRAM1_BIT)
8c54ee8a8606a4 Thomas Hellström  2023-11-23  189  			add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM1, c);
dd08ebf6c3525a Matthew Brost     2023-03-30  190  	}
dd08ebf6c3525a Matthew Brost     2023-03-30  191  }
dd08ebf6c3525a Matthew Brost     2023-03-30  192  
d8b52a02cb40fe Maarten Lankhorst 2023-01-12  193  static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
8c54ee8a8606a4 Thomas Hellström  2023-11-23  194  			   u32 bo_flags, u32 *c)
d8b52a02cb40fe Maarten Lankhorst 2023-01-12  195  {
8049e3954aeaae Brian Welty       2024-01-10  196  	if (bo_flags & XE_BO_CREATE_STOLEN_BIT) {
8c54ee8a8606a4 Thomas Hellström  2023-11-23  197  		xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
8c54ee8a8606a4 Thomas Hellström  2023-11-23  198  
8c54ee8a8606a4 Thomas Hellström  2023-11-23  199  		bo->placements[*c] = (struct ttm_place) {
d8b52a02cb40fe Maarten Lankhorst 2023-01-12  200  			.mem_type = XE_PL_STOLEN,
d8b52a02cb40fe Maarten Lankhorst 2023-01-12  201  			.flags = bo_flags & (XE_BO_CREATE_PINNED_BIT |
d8b52a02cb40fe Maarten Lankhorst 2023-01-12  202  					     XE_BO_CREATE_GGTT_BIT) ?
d8b52a02cb40fe Maarten Lankhorst 2023-01-12  203  				TTM_PL_FLAG_CONTIGUOUS : 0,
d8b52a02cb40fe Maarten Lankhorst 2023-01-12  204  		};
d8b52a02cb40fe Maarten Lankhorst 2023-01-12  205  		*c += 1;
d8b52a02cb40fe Maarten Lankhorst 2023-01-12  206  	}
d8b52a02cb40fe Maarten Lankhorst 2023-01-12  207  }
d8b52a02cb40fe Maarten Lankhorst 2023-01-12  208  
dd08ebf6c3525a Matthew Brost     2023-03-30  209  static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
dd08ebf6c3525a Matthew Brost     2023-03-30  210  				       u32 bo_flags)
dd08ebf6c3525a Matthew Brost     2023-03-30  211  {
dd08ebf6c3525a Matthew Brost     2023-03-30  212  	u32 c = 0;
dd08ebf6c3525a Matthew Brost     2023-03-30  213  
dd08ebf6c3525a Matthew Brost     2023-03-30  214  	bo->props.preferred_mem_type = XE_BO_PROPS_INVALID;
dd08ebf6c3525a Matthew Brost     2023-03-30  215  
dd08ebf6c3525a Matthew Brost     2023-03-30  216  	/* The order of placements should indicate preferred location */
dd08ebf6c3525a Matthew Brost     2023-03-30  217  
d5dc73dbd148ef Francois Dugast   2023-11-14  218  	if (bo->props.preferred_mem_class == DRM_XE_MEM_REGION_CLASS_SYSMEM) {
8c54ee8a8606a4 Thomas Hellström  2023-11-23  219  		try_add_system(xe, bo, bo_flags, &c);
8c54ee8a8606a4 Thomas Hellström  2023-11-23  220  		try_add_vram(xe, bo, bo_flags, &c);
dd08ebf6c3525a Matthew Brost     2023-03-30  221  	} else {
8c54ee8a8606a4 Thomas Hellström  2023-11-23  222  		try_add_vram(xe, bo, bo_flags, &c);
8c54ee8a8606a4 Thomas Hellström  2023-11-23  223  		try_add_system(xe, bo, bo_flags, &c);
dd08ebf6c3525a Matthew Brost     2023-03-30  224  	}
8c54ee8a8606a4 Thomas Hellström  2023-11-23  225  	try_add_stolen(xe, bo, bo_flags, &c);
dd08ebf6c3525a Matthew Brost     2023-03-30  226  
dd08ebf6c3525a Matthew Brost     2023-03-30  227  	if (!c)
dd08ebf6c3525a Matthew Brost     2023-03-30  228  		return -EINVAL;
dd08ebf6c3525a Matthew Brost     2023-03-30  229  
dd08ebf6c3525a Matthew Brost     2023-03-30  230  	bo->placement = (struct ttm_placement) {
dd08ebf6c3525a Matthew Brost     2023-03-30  231  		.num_placement = c,
8c54ee8a8606a4 Thomas Hellström  2023-11-23  232  		.placement = bo->placements,
dd08ebf6c3525a Matthew Brost     2023-03-30  233  		.num_busy_placement = c,
8c54ee8a8606a4 Thomas Hellström  2023-11-23 @234  		.busy_placement = bo->placements,
dd08ebf6c3525a Matthew Brost     2023-03-30  235  	};
dd08ebf6c3525a Matthew Brost     2023-03-30  236  
dd08ebf6c3525a Matthew Brost     2023-03-30  237  	return 0;
dd08ebf6c3525a Matthew Brost     2023-03-30  238  }
dd08ebf6c3525a Matthew Brost     2023-03-30  239  

:::::: The code at line 42 was first introduced by commit
:::::: dd08ebf6c3525a7ea2186e636df064ea47281987 drm/xe: Introduce a new DRM driver for Intel GPUs

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
