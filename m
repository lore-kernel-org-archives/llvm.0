Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42791549C;
	Sat,  9 Dec 2023 15:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OlHcjfoT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702134762; x=1733670762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=isbJj9CjBTzRm7hEFdY1j3/auaZodLMtI72o5we22tM=;
  b=OlHcjfoTdT1fKT1KOZnNLiF+ozriXzqPcAR2D/WImcifiwZJ+ookNtFQ
   rGmZEi/sKC70BOd/qdH6Fe5RBM1u/El51H9d4p/ukSgLfZ1y59Jyey4qD
   bDr/6RdkBi71aPjg1yBus2cwFCVuuqjRssjEMQgPpndI36zcoQOdJUJ6X
   k0JJFa7eZs8uiqtjCPYJlX9Nhjex5vT+akRVFXlcLI5eG6gscT6xXs+8X
   7/ZKTmr+oJBtVf4+9gtyOhfRAy5Wk5gRitsHzfXAhz//o4YhQ5ZgD5Lii
   Lhy+f+pU9NP8JxG2saYXBqPCjgZLjdtwcuCCV809cFbEYujQYWEy0V9rV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="374676431"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="374676431"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 07:12:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="863218312"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="863218312"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Dec 2023 07:12:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBz0P-000FTV-1u;
	Sat, 09 Dec 2023 15:12:37 +0000
Date: Sat, 9 Dec 2023 23:11:54 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [drm-xe:drm-xe-next 897/1053]
 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:55:10: error:
 call to undeclared function 'readq'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202312092339.jUV164nY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   1fc141d1f445b8e5ab4ff14645b0482dd98460b9
commit: 0931b43873794c814a4a6fe1868b61edfe993b67 [897/1053] drm/xe/display: Implement display support
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231209/202312092339.jUV164nY-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312092339.jUV164nY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312092339.jUV164nY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_display.c:16:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:15:
>> drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:55:10: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   *ptr = readq((void __iomem *)(virtual + ofs));
                          ^
   1 error generated.
--
   In file included from drivers/gpu/drm/xe/display/intel_fbdev_fb.c:13:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:15:
>> drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:55:10: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   *ptr = readq((void __iomem *)(virtual + ofs));
                          ^
   drivers/gpu/drm/xe/display/intel_fbdev_fb.c:72:21: error: call to undeclared function 'intel_bo_to_drm_bo'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           drm_gem_object_put(intel_bo_to_drm_bo(obj));
                              ^
   drivers/gpu/drm/xe/display/intel_fbdev_fb.c:72:21: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct drm_gem_object *' [-Wint-conversion]
           drm_gem_object_put(intel_bo_to_drm_bo(obj));
                              ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_gem.h:501:43: note: passing argument to parameter 'obj' here
   drm_gem_object_put(struct drm_gem_object *obj)
                                             ^
   drivers/gpu/drm/xe/display/intel_fbdev_fb.c:101:22: error: call to undeclared function 'intel_bo_to_drm_bo'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           info->screen_size = intel_bo_to_drm_bo(obj)->size;
                               ^
   drivers/gpu/drm/xe/display/intel_fbdev_fb.c:101:47: error: member reference type 'int' is not a pointer
           info->screen_size = intel_bo_to_drm_bo(obj)->size;
                               ~~~~~~~~~~~~~~~~~~~~~~~  ^
   5 errors generated.
--
   In file included from drivers/gpu/drm/xe/display/ext/i915_utils.c:6:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:15:
>> drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:55:10: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   *ptr = readq((void __iomem *)(virtual + ofs));
                          ^
   drivers/gpu/drm/xe/display/ext/i915_utils.c:18:5: warning: no previous prototype for function '__i915_inject_probe_error' [-Wmissing-prototypes]
   int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
       ^
   drivers/gpu/drm/xe/display/ext/i915_utils.c:18:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
   ^
   static 
   1 warning and 1 error generated.
--
   In file included from drivers/gpu/drm/i915/display/intel_atomic_plane.c:46:
   In file included from drivers/gpu/drm/i915/display/intel_display_trace.h:16:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:15:
>> drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:55:10: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   *ptr = readq((void __iomem *)(virtual + ofs));
                          ^
   drivers/gpu/drm/i915/display/intel_atomic_plane.c:1099:30: error: call to undeclared function 'intel_bo_to_drm_bo'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           ret = add_dma_resv_fences(intel_bo_to_drm_bo(old_obj)->resv,
                                                     ^
   drivers/gpu/drm/i915/display/intel_atomic_plane.c:1099:59: error: member reference type 'int' is not a pointer
                           ret = add_dma_resv_fences(intel_bo_to_drm_bo(old_obj)->resv,
                                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~  ^
   3 errors generated.
--
   In file included from drivers/gpu/drm/i915/display/intel_cursor.c:17:
   In file included from drivers/gpu/drm/i915/display/intel_de.h:9:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:15:
>> drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:55:10: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   *ptr = readq((void __iomem *)(virtual + ofs));
                          ^
   In file included from drivers/gpu/drm/i915/display/intel_cursor.c:22:
   drivers/gpu/drm/i915/display/intel_frontbuffer.h:46:21: error: field has incomplete type 'struct i915_active'
           struct i915_active write;
                              ^
   drivers/gpu/drm/i915/display/intel_frontbuffer.h:46:9: note: forward declaration of 'struct i915_active'
           struct i915_active write;
                  ^
   2 errors generated.
--
   In file included from drivers/gpu/drm/i915/display/intel_fb.c:12:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:15:
>> drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:55:10: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   *ptr = readq((void __iomem *)(virtual + ofs));
                          ^
   In file included from drivers/gpu/drm/i915/display/intel_fb.c:18:
   drivers/gpu/drm/i915/display/intel_frontbuffer.h:46:21: error: field has incomplete type 'struct i915_active'
           struct i915_active write;
                              ^
   drivers/gpu/drm/i915/display/intel_frontbuffer.h:46:9: note: forward declaration of 'struct i915_active'
           struct i915_active write;
                  ^
   drivers/gpu/drm/i915/display/intel_fb.c:1667:41: error: call to undeclared function 'intel_bo_to_drm_bo'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (mul_u32_u32(max_size, tile_size) > intel_bo_to_drm_bo(obj)->size) {
                                                  ^
   drivers/gpu/drm/i915/display/intel_fb.c:1667:66: error: member reference type 'int' is not a pointer
           if (mul_u32_u32(max_size, tile_size) > intel_bo_to_drm_bo(obj)->size) {
                                                  ~~~~~~~~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/i915/display/intel_fb.c:1670:67: error: member reference type 'int' is not a pointer
                               mul_u32_u32(max_size, tile_size), intel_bo_to_drm_bo(obj)->size);
                                                                 ~~~~~~~~~~~~~~~~~~~~~~~  ^
   include/drm/drm_print.h:494:60: note: expanded from macro 'drm_dbg_kms'
           drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
                                                                     ^~~~~~~~~~~
   include/drm/drm_print.h:410:39: note: expanded from macro 'drm_dev_dbg'
           __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
                                                ^~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_fb.c:1901:42: error: call to undeclared function 'intel_bo_to_drm_bo'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct drm_i915_private *i915 = to_i915(intel_bo_to_drm_bo(obj)->dev);
                                                   ^
   drivers/gpu/drm/i915/display/intel_fb.c:1901:67: error: member reference type 'int' is not a pointer
           struct drm_i915_private *i915 = to_i915(intel_bo_to_drm_bo(obj)->dev);
                                                   ~~~~~~~~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/i915/display/intel_fb.c:1909:37: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct drm_gem_object *' [-Wint-conversion]
           return drm_gem_handle_create(file, intel_bo_to_drm_bo(obj), handle);
                                              ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_gem.h:508:29: note: passing argument to parameter 'obj' here
                             struct drm_gem_object *obj,
                                                    ^
   drivers/gpu/drm/i915/display/intel_fb.c:1942:29: error: call to undeclared function 'intel_bo_to_drm_bo'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (dma_resv_test_signaled(intel_bo_to_drm_bo(obj)->resv, dma_resv_usage_rw(false)))
                                      ^
   drivers/gpu/drm/i915/display/intel_fb.c:1942:54: error: member reference type 'int' is not a pointer
           if (dma_resv_test_signaled(intel_bo_to_drm_bo(obj)->resv, dma_resv_usage_rw(false)))
                                      ~~~~~~~~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/i915/display/intel_fb.c:1945:56: error: member reference type 'int' is not a pointer
           ret = dma_resv_get_singleton(intel_bo_to_drm_bo(obj)->resv, dma_resv_usage_rw(false),
                                        ~~~~~~~~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/i915/display/intel_fb.c:1972:2: error: call to undeclared function 'i915_gem_object_flush_if_display'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           i915_gem_object_flush_if_display(obj);
           ^
   drivers/gpu/drm/i915/display/intel_fb.c:1987:46: error: call to undeclared function 'intel_bo_to_drm_bo'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct drm_i915_private *dev_priv = to_i915(intel_bo_to_drm_bo(obj)->dev);
                                                       ^
   drivers/gpu/drm/i915/display/intel_fb.c:1987:71: error: member reference type 'int' is not a pointer
           struct drm_i915_private *dev_priv = to_i915(intel_bo_to_drm_bo(obj)->dev);
                                                       ~~~~~~~~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/i915/display/intel_fb.c:2063:14: error: incompatible integer to pointer conversion assigning to 'struct drm_gem_object *' from 'int' [-Wint-conversion]
                   fb->obj[i] = intel_bo_to_drm_bo(obj);
                              ^ ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_fb.c:2116:21: error: call to undeclared function 'intel_bo_to_drm_bo'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           drm_gem_object_put(intel_bo_to_drm_bo(obj));
                              ^
   drivers/gpu/drm/i915/display/intel_fb.c:2116:21: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct drm_gem_object *' [-Wint-conversion]
           drm_gem_object_put(intel_bo_to_drm_bo(obj));
                              ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_gem.h:501:43: note: passing argument to parameter 'obj' here
   drm_gem_object_put(struct drm_gem_object *obj)
                                             ^
   17 errors generated.
--
   In file included from drivers/gpu/drm/i915/display/intel_fbc.c:46:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:15:
>> drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:55:10: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   *ptr = readq((void __iomem *)(virtual + ofs));
                          ^
   In file included from drivers/gpu/drm/i915/display/intel_fbc.c:57:
   drivers/gpu/drm/i915/display/intel_frontbuffer.h:46:21: error: field has incomplete type 'struct i915_active'
           struct i915_active write;
                              ^
   drivers/gpu/drm/i915/display/intel_frontbuffer.h:46:9: note: forward declaration of 'struct i915_active'
           struct i915_active write;
                  ^
   drivers/gpu/drm/i915/display/intel_fbc.c:99:24: error: field has incomplete type 'struct i915_stolen_fb'
           struct i915_stolen_fb compressed_fb, compressed_llb;
                                 ^
   drivers/gpu/drm/i915/display/intel_fbc.c:99:9: note: forward declaration of 'struct i915_stolen_fb'
           struct i915_stolen_fb compressed_fb, compressed_llb;
                  ^
   drivers/gpu/drm/i915/display/intel_fbc.c:99:39: error: field has incomplete type 'struct i915_stolen_fb'
           struct i915_stolen_fb compressed_fb, compressed_llb;
                                                ^
   drivers/gpu/drm/i915/display/intel_fbc.c:99:9: note: forward declaration of 'struct i915_stolen_fb'
           struct i915_stolen_fb compressed_fb, compressed_llb;
                  ^
   drivers/gpu/drm/i915/display/intel_fbc.c:337:34: error: call to undeclared function 'i915_gem_stolen_area_address'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                       range_overflows_end_t(u64, i915_gem_stolen_area_address(i915),
                                                  ^
   drivers/gpu/drm/i915/display/intel_fbc.c:338:8: error: call to undeclared function 'i915_gem_stolen_node_offset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                                             i915_gem_stolen_node_offset(&fbc->compressed_fb),
                                             ^
   drivers/gpu/drm/i915/display/intel_fbc.c:341:34: error: call to undeclared function 'i915_gem_stolen_area_address'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                       range_overflows_end_t(u64, i915_gem_stolen_area_address(i915),
                                                  ^
   drivers/gpu/drm/i915/display/intel_fbc.c:342:8: error: call to undeclared function 'i915_gem_stolen_node_offset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                                             i915_gem_stolen_node_offset(&fbc->compressed_llb),
                                             ^
   drivers/gpu/drm/i915/display/intel_fbc.c:345:10: error: call to undeclared function 'i915_gem_stolen_node_address'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                          i915_gem_stolen_node_address(i915, &fbc->compressed_fb));
                          ^
   drivers/gpu/drm/i915/display/intel_fbc.c:455:10: error: call to undeclared function 'i915_gem_stolen_node_offset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                          i915_gem_stolen_node_offset(&fbc->compressed_fb));
                          ^
   drivers/gpu/drm/i915/display/intel_fbc.c:507:10: error: call to undeclared function 'i915_gem_stolen_node_offset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                          i915_gem_stolen_node_offset(&fbc->compressed_fb));
                          ^
   drivers/gpu/drm/i915/display/intel_fbc.c:614:6: error: call to undeclared function 'intel_gt_support_legacy_fencing'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (intel_gt_support_legacy_fencing(to_gt(i915)))
               ^
   drivers/gpu/drm/i915/display/intel_fbc.c:614:38: error: call to undeclared function 'to_gt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (intel_gt_support_legacy_fencing(to_gt(i915)))
                                               ^
   drivers/gpu/drm/i915/display/intel_fbc.c:722:9: error: call to undeclared function 'i915_gem_stolen_area_size'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   end = i915_gem_stolen_area_size(i915) - 8 * 1024 * 1024;
                         ^
   drivers/gpu/drm/i915/display/intel_fbc.c:757:8: error: call to undeclared function 'i915_gem_stolen_insert_node_in_range'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ret = i915_gem_stolen_insert_node_in_range(i915, &fbc->compressed_fb,
                 ^
   drivers/gpu/drm/i915/display/intel_fbc.c:779:7: error: call to undeclared function 'i915_gem_stolen_node_allocated'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                       i915_gem_stolen_node_allocated(&fbc->compressed_fb));
                       ^
   drivers/gpu/drm/i915/display/intel_fbc.c:781:7: error: call to undeclared function 'i915_gem_stolen_node_allocated'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                       i915_gem_stolen_node_allocated(&fbc->compressed_llb));
                       ^
   drivers/gpu/drm/i915/display/intel_fbc.c:784:9: error: call to undeclared function 'i915_gem_stolen_insert_node'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ret = i915_gem_stolen_insert_node(i915, &fbc->compressed_llb,
                         ^
   drivers/gpu/drm/i915/display/intel_fbc.c:801:7: error: call to undeclared function 'i915_gem_stolen_node_size'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                       i915_gem_stolen_node_size(&fbc->compressed_fb), fbc->limit);
                       ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
   In file included from drivers/gpu/drm/i915/display/intel_fbdev.c:48:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:15:
>> drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:55:10: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   *ptr = readq((void __iomem *)(virtual + ofs));
                          ^
   In file included from drivers/gpu/drm/i915/display/intel_fbdev.c:54:
   drivers/gpu/drm/i915/display/intel_frontbuffer.h:46:21: error: field has incomplete type 'struct i915_active'
           struct i915_active write;
                              ^
   drivers/gpu/drm/i915/display/intel_frontbuffer.h:46:9: note: forward declaration of 'struct i915_active'
           struct i915_active write;
                  ^
   drivers/gpu/drm/i915/display/intel_fbdev.c:335:7: error: call to undeclared function 'intel_bo_to_drm_bo'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   if (intel_bo_to_drm_bo(obj)->size > max_size) {
                       ^
   drivers/gpu/drm/i915/display/intel_fbdev.c:335:32: error: member reference type 'int' is not a pointer
                   if (intel_bo_to_drm_bo(obj)->size > max_size) {
                       ~~~~~~~~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/i915/display/intel_fbdev.c:340:40: error: member reference type 'int' is not a pointer
                           max_size = intel_bo_to_drm_bo(obj)->size;
                                      ~~~~~~~~~~~~~~~~~~~~~~~  ^
   5 errors generated.


vim +/readq +55 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h

    33	
    34	static inline int i915_gem_object_read_from_page(struct xe_bo *bo,
    35						  u32 ofs, u64 *ptr, u32 size)
    36	{
    37		struct ttm_bo_kmap_obj map;
    38		void *virtual;
    39		bool is_iomem;
    40		int ret;
    41	
    42		XE_WARN_ON(size != 8);
    43	
    44		ret = xe_bo_lock(bo, true);
    45		if (ret)
    46			return ret;
    47	
    48		ret = ttm_bo_kmap(&bo->ttm, ofs >> PAGE_SHIFT, 1, &map);
    49		if (ret)
    50			goto out_unlock;
    51	
    52		ofs &= ~PAGE_MASK;
    53		virtual = ttm_kmap_obj_virtual(&map, &is_iomem);
    54		if (is_iomem)
  > 55			*ptr = readq((void __iomem *)(virtual + ofs));
    56		else
    57			*ptr = *(u64 *)(virtual + ofs);
    58	
    59		ttm_bo_kunmap(&map);
    60	out_unlock:
    61		xe_bo_unlock(bo);
    62		return ret;
    63	}
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
