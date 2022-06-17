Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1EF7F
	for <llvm@lists.linux.dev>; Fri, 17 Jun 2022 09:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655457038; x=1686993038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rjIu0hRj9Au2fBo3hcktlcy1xH2kIhDY7L7DFWn+9ko=;
  b=WNW1wZKgT2r+JMIm1IVqepJIb8CmQdIR7evkG1CqyZyTn8/Wb5WA9KJ3
   CyZKQ4VH4PQ30hlbPLQ4EMSrtM1A0E8RDQmxLO9juPmM84u6/xFCF5lP6
   azzU9Wc4IfsZKwDKU21LZ01hymdW2junLQGZoppVoA71swokAsD0IgJfV
   kXSpoMtxHAbN7wuBblS2eH8Wt4xBwo7zk9JLx/X4BOauIrHH0ZtozT1KK
   D/MsEHNMDmMob+3miFKDl9yrFYCMQp1fO4QlSXVT5FEKpNaQSt7rcLizi
   dnyWDIJLT1RP7Bl+S1msQBq0eEG0cshjUU4WG2OK+CiXVzVfUT3ubWU1s
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="277035240"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="277035240"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2022 02:10:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="688217392"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2022 02:10:36 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o27zv-000PHp-IO;
	Fri, 17 Jun 2022 09:10:35 +0000
Date: Fri, 17 Jun 2022 17:10:13 +0800
From: kernel test robot <lkp@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [Intel-gfx] [PATCH v2 2/3] drm/i915: Update i915 uapi
 documentation
Message-ID: <202206171655.ypHKJ5Tg-lkp@intel.com>
References: <20220617051445.8901-3-niranjana.vishwanathapura@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617051445.8901-3-niranjana.vishwanathapura@intel.com>

Hi Niranjana,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Niranjana-Vishwanathapura/drm-doc-rfc-i915-VM_BIND-feature-design-uapi/20220617-131543
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220617/202206171655.ypHKJ5Tg-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d764aa7fc6b9cc3fbe960019018f5f9e941eb0a6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/036987efcc7c66ca2bc7a2dff4da7716c3459480
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Niranjana-Vishwanathapura/drm-doc-rfc-i915-VM_BIND-feature-design-uapi/20220617-131543
        git checkout 036987efcc7c66ca2bc7a2dff4da7716c3459480
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/i915_driver.c:52:
   In file included from drivers/gpu/drm/i915/display/intel_display_types.h:48:
   In file included from drivers/gpu/drm/i915/i915_vma.h:33:
   In file included from drivers/gpu/drm/i915/gt/intel_ggtt_fencing.h:12:
   In file included from drivers/gpu/drm/i915/i915_active.h:13:
   In file included from drivers/gpu/drm/i915/i915_request.h:34:
   In file included from drivers/gpu/drm/i915/gem/i915_gem_context_types.h:20:
   In file included from drivers/gpu/drm/i915/gt/intel_context_types.h:18:
   In file included from drivers/gpu/drm/i915/gt/intel_engine_types.h:21:
   In file included from drivers/gpu/drm/i915/i915_pmu.h:13:
>> include/uapi/drm/i915_drm.h:1934:2: warning: '/*' within block comment [-Wcomment]
           /** @param: Parameter to set or query */
           ^
   1 warning generated.
--
   In file included from drivers/gpu/drm/i915/gem/i915_gem_context.c:74:
   In file included from drivers/gpu/drm/i915/gt/gen6_ppgtt.h:9:
   In file included from drivers/gpu/drm/i915/gt/intel_gtt.h:28:
   In file included from drivers/gpu/drm/i915/gt/intel_reset.h:13:
   In file included from drivers/gpu/drm/i915/gt/intel_engine_types.h:21:
   In file included from drivers/gpu/drm/i915/i915_pmu.h:13:
>> include/uapi/drm/i915_drm.h:1934:2: warning: '/*' within block comment [-Wcomment]
           /** @param: Parameter to set or query */
           ^
>> drivers/gpu/drm/i915/gem/i915_gem_context.c:177:12: error: no member named 'size' in 'struct drm_i915_gem_context_param'
           if (args->size)
               ~~~~  ^
   drivers/gpu/drm/i915/gem/i915_gem_context.c:370:12: error: no member named 'size' in 'struct drm_i915_gem_context_param'
           if (args->size)
               ~~~~  ^
   drivers/gpu/drm/i915/gem/i915_gem_context.c:749:12: error: no member named 'size' in 'struct drm_i915_gem_context_param'
           if (args->size < sizeof(*user) ||
               ~~~~  ^
   drivers/gpu/drm/i915/gem/i915_gem_context.c:750:24: error: no member named 'size' in 'struct drm_i915_gem_context_param'
               !IS_ALIGNED(args->size - sizeof(*user), sizeof(*user->engines))) {
                           ~~~~  ^
   include/linux/align.h:13:30: note: expanded from macro 'IS_ALIGNED'
   #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) == 0)
                                              ^
   drivers/gpu/drm/i915/gem/i915_gem_context.c:750:24: error: no member named 'size' in 'struct drm_i915_gem_context_param'
               !IS_ALIGNED(args->size - sizeof(*user), sizeof(*user->engines))) {
                           ~~~~  ^
   include/linux/align.h:13:44: note: expanded from macro 'IS_ALIGNED'
   #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) == 0)
                                                            ^
   drivers/gpu/drm/i915/gem/i915_gem_context.c:752:10: error: no member named 'size' in 'struct drm_i915_gem_context_param'
                           args->size);
                           ~~~~  ^
   include/drm/drm_print.h:461:63: note: expanded from macro 'drm_dbg'
           drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
                                                                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_context.c:756:27: error: no member named 'size' in 'struct drm_i915_gem_context_param'
           set.num_engines = (args->size - sizeof(*user)) / sizeof(*user->engines);
                              ~~~~  ^
   drivers/gpu/drm/i915/gem/i915_gem_context.c:821:12: error: no member named 'size' in 'struct drm_i915_gem_context_param'
           if (args->size < sizeof(user_sseu))
               ~~~~  ^
   drivers/gpu/drm/i915/gem/i915_gem_context.c:870:8: error: no member named 'size' in 'struct drm_i915_gem_context_param'
           args->size = sizeof(user_sseu);
           ~~~~  ^
   drivers/gpu/drm/i915/gem/i915_gem_context.c:883:13: error: no member named 'size' in 'struct drm_i915_gem_context_param'
                   if (args->size)
                       ~~~~  ^
   drivers/gpu/drm/i915/gem/i915_gem_context.c:892:13: error: no member named 'size' in 'struct drm_i915_gem_context_param'
                   if (args->size)
                       ~~~~  ^
   drivers/gpu/drm/i915/gem/i915_gem_context.c:905:13: error: no member named 'size' in 'struct drm_i915_gem_context_param'
                   if (args->size)
                       ~~~~  ^
   drivers/gpu/drm/i915/gem/i915_gem_context.c:934:13: error: no member named 'size' in 'struct drm_i915_gem_context_param'
                   if (args->size)
                       ~~~~  ^
   drivers/gpu/drm/i915/gem/i915_gem_context.c:1866:8: error: no member named 'size' in 'struct drm_i915_gem_context_param'
           args->size = 0;
           ~~~~  ^
   drivers/gpu/drm/i915/gem/i915_gem_context.c:1981:12: error: no member named 'size' in 'struct drm_i915_gem_context_param'
           if (args->size < sizeof(user_sseu))
               ~~~~  ^
   drivers/gpu/drm/i915/gem/i915_gem_context.c:2019:8: error: no member named 'size' in 'struct drm_i915_gem_context_param'
           args->size = sizeof(user_sseu);
           ~~~~  ^
   drivers/gpu/drm/i915/gem/i915_gem_context.c:2030:12: error: no member named 'size' in 'struct drm_i915_gem_context_param'
           if (args->size)
               ~~~~  ^
   drivers/gpu/drm/i915/gem/i915_gem_context.c:2067:8: error: no member named 'size' in 'struct drm_i915_gem_context_param'
           args->size = 0;
           ~~~~  ^
   drivers/gpu/drm/i915/gem/i915_gem_context.c:2081:13: error: no member named 'size' in 'struct drm_i915_gem_context_param'
                   if (args->size)
                       ~~~~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.


vim +177 drivers/gpu/drm/i915/gem/i915_gem_context.c

6b736de5746a30 drivers/gpu/drm/i915/i915_gem_context.c     Chris Wilson   2019-04-26  171  
aaa5957c97592b drivers/gpu/drm/i915/gem/i915_gem_context.c Jason Ekstrand 2021-07-08  172  static int validate_priority(struct drm_i915_private *i915,
aaa5957c97592b drivers/gpu/drm/i915/gem/i915_gem_context.c Jason Ekstrand 2021-07-08  173  			     const struct drm_i915_gem_context_param *args)
aaa5957c97592b drivers/gpu/drm/i915/gem/i915_gem_context.c Jason Ekstrand 2021-07-08  174  {
aaa5957c97592b drivers/gpu/drm/i915/gem/i915_gem_context.c Jason Ekstrand 2021-07-08  175  	s64 priority = args->value;
aaa5957c97592b drivers/gpu/drm/i915/gem/i915_gem_context.c Jason Ekstrand 2021-07-08  176  
aaa5957c97592b drivers/gpu/drm/i915/gem/i915_gem_context.c Jason Ekstrand 2021-07-08 @177  	if (args->size)
aaa5957c97592b drivers/gpu/drm/i915/gem/i915_gem_context.c Jason Ekstrand 2021-07-08  178  		return -EINVAL;
aaa5957c97592b drivers/gpu/drm/i915/gem/i915_gem_context.c Jason Ekstrand 2021-07-08  179  
aaa5957c97592b drivers/gpu/drm/i915/gem/i915_gem_context.c Jason Ekstrand 2021-07-08  180  	if (!(i915->caps.scheduler & I915_SCHEDULER_CAP_PRIORITY))
aaa5957c97592b drivers/gpu/drm/i915/gem/i915_gem_context.c Jason Ekstrand 2021-07-08  181  		return -ENODEV;
aaa5957c97592b drivers/gpu/drm/i915/gem/i915_gem_context.c Jason Ekstrand 2021-07-08  182  
aaa5957c97592b drivers/gpu/drm/i915/gem/i915_gem_context.c Jason Ekstrand 2021-07-08  183  	if (priority > I915_CONTEXT_MAX_USER_PRIORITY ||
aaa5957c97592b drivers/gpu/drm/i915/gem/i915_gem_context.c Jason Ekstrand 2021-07-08  184  	    priority < I915_CONTEXT_MIN_USER_PRIORITY)
aaa5957c97592b drivers/gpu/drm/i915/gem/i915_gem_context.c Jason Ekstrand 2021-07-08  185  		return -EINVAL;
aaa5957c97592b drivers/gpu/drm/i915/gem/i915_gem_context.c Jason Ekstrand 2021-07-08  186  
aaa5957c97592b drivers/gpu/drm/i915/gem/i915_gem_context.c Jason Ekstrand 2021-07-08  187  	if (priority > I915_CONTEXT_DEFAULT_PRIORITY &&
aaa5957c97592b drivers/gpu/drm/i915/gem/i915_gem_context.c Jason Ekstrand 2021-07-08  188  	    !capable(CAP_SYS_NICE))
aaa5957c97592b drivers/gpu/drm/i915/gem/i915_gem_context.c Jason Ekstrand 2021-07-08  189  		return -EPERM;
aaa5957c97592b drivers/gpu/drm/i915/gem/i915_gem_context.c Jason Ekstrand 2021-07-08  190  
aaa5957c97592b drivers/gpu/drm/i915/gem/i915_gem_context.c Jason Ekstrand 2021-07-08  191  	return 0;
aaa5957c97592b drivers/gpu/drm/i915/gem/i915_gem_context.c Jason Ekstrand 2021-07-08  192  }
aaa5957c97592b drivers/gpu/drm/i915/gem/i915_gem_context.c Jason Ekstrand 2021-07-08  193  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
