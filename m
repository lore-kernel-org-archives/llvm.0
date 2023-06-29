Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF571848D;
	Thu, 29 Jun 2023 08:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688025925; x=1719561925;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Hcb2M6Bb4ZcAv3IeqR45Lpxo/ozuWy0A9CJqBTrH4NI=;
  b=iqYsrY44QL/GNGtJ05lwjy7kS0uhXA1PKVIXBPUlM0Cr/uRln6sCdEgl
   GrnEfYCvn+NKxAAxegpJCVxnQ9XZC/DdnkkylmV570jSfPEvL2kYMVr8K
   5LmuzvN8lAlAu+lZFPSrLkv3gfT4AqmuRAz+U9msTP/iLrOhTd4vRabQN
   Iv61XlJfcOaGxE0nmS29UJtzYjNoWZ7grZVHDr8Z0S5la8K7QbhvjRbpU
   sIEmXYM0PR+QrtrA6MJYh4paROz/mGFXuEecDJG9nY29sG4x8f2uuBmyC
   sYXxpVgJcJoxhvRczI3RzQ2IByvPFKTNGtYm0QC804WB7MjZ18cShQufP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="428067177"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="428067177"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 01:05:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="830441665"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="830441665"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2023 01:05:16 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEmeR-000Dyj-2k;
	Thu, 29 Jun 2023 08:05:15 +0000
Date: Thu, 29 Jun 2023 16:04:22 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-4.14.y 5611/9999]
 drivers/gpu/drm/i915/i915_gem_stolen.o: warning: objtool:
 gen6_get_stolen_reserved()+0x9a: can't find switch jump table
Message-ID: <202306291636.PKz8aSbv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Chris Wilson <chris@chris-wilson.co.uk>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Zhenyu Wang <zhenyuw@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

Hi Chris,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.14.y
head:   60a6e3043cc8b918c989707a5eba5fd6830a08a4
commit: 1e066477433b1a6451abda0307c13a06a23cdaa2 [5611/9999] drm/i915: Force VT'd workarounds when running as a guest OS
config: x86_64-randconfig-x016-20230628 (https://download.01.org/0day-ci/archive/20230629/202306291636.PKz8aSbv-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230629/202306291636.PKz8aSbv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306291636.PKz8aSbv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/i915_gem_stolen.c:31:
   In file included from drivers/gpu/drm/i915/i915_drv.h:63:
   In file included from drivers/gpu/drm/i915/intel_uc.h:31:
   In file included from drivers/gpu/drm/i915/i915_vma.h:34:
   drivers/gpu/drm/i915/i915_gem_object.h:289:1: warning: attribute declaration must precede definition [-Wignored-attributes]
   __deprecated
   ^
   include/linux/compiler-gcc.h:106:37: note: expanded from macro '__deprecated'
   #define __deprecated    __attribute__((deprecated))
                                          ^
   include/drm/drm_gem.h:247:20: note: previous definition is here
   static inline void drm_gem_object_reference(struct drm_gem_object *obj)
                      ^
   In file included from drivers/gpu/drm/i915/i915_gem_stolen.c:31:
   In file included from drivers/gpu/drm/i915/i915_drv.h:63:
   In file included from drivers/gpu/drm/i915/intel_uc.h:31:
   In file included from drivers/gpu/drm/i915/i915_vma.h:34:
   drivers/gpu/drm/i915/i915_gem_object.h:299:1: warning: attribute declaration must precede definition [-Wignored-attributes]
   __deprecated
   ^
   include/linux/compiler-gcc.h:106:37: note: expanded from macro '__deprecated'
   #define __deprecated    __attribute__((deprecated))
                                          ^
   include/drm/drm_gem.h:285:20: note: previous definition is here
   static inline void drm_gem_object_unreference(struct drm_gem_object *obj)
                      ^
   In file included from drivers/gpu/drm/i915/i915_gem_stolen.c:31:
   In file included from drivers/gpu/drm/i915/i915_drv.h:63:
   In file included from drivers/gpu/drm/i915/intel_uc.h:31:
   In file included from drivers/gpu/drm/i915/i915_vma.h:34:
   drivers/gpu/drm/i915/i915_gem_object.h:302:1: warning: attribute declaration must precede definition [-Wignored-attributes]
   __deprecated
   ^
   include/linux/compiler-gcc.h:106:37: note: expanded from macro '__deprecated'
   #define __deprecated    __attribute__((deprecated))
                                          ^
   include/drm/drm_gem.h:273:1: note: previous definition is here
   drm_gem_object_unreference_unlocked(struct drm_gem_object *obj)
   ^
   In file included from drivers/gpu/drm/i915/i915_gem_stolen.c:31:
   drivers/gpu/drm/i915/i915_drv.h:3591:9: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
           return i915_reset_backoff(error) | i915_terminally_wedged(error);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                            ||
   drivers/gpu/drm/i915/i915_drv.h:3591:9: note: cast one or both operands to int to silence this warning
   4 warnings generated.
>> drivers/gpu/drm/i915/i915_gem_stolen.o: warning: objtool: gen6_get_stolen_reserved()+0x9a: can't find switch jump table

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
