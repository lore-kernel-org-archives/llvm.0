Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0445B56B82;
	Wed, 22 Nov 2023 15:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NFxnHADT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700667990; x=1732203990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xcGraPTZkkvyKVpMUbcsGGlFrsqMDx3ST4/8EWjkAdg=;
  b=NFxnHADTq6F8Wu1sWMqsgTuodTkkTvqvMgytzskwci+7+h+9ze/nO0On
   jr9fz9nuPnGAZ+0EYHnIbp/bjwyJQPfjuqeXhCx9inaSfAZV2o3Nst1p5
   aaL04QdzTvV/YQTc344KRhbcEkyPdaF+4xPZwvwVCyD7jz+l1tTqckRJX
   uK69TYzdRkRfvNNAuRURPuzzd/CbSE3nGHaXVRbwp3L3NAIIvc/uaSgEY
   2Nu0eKbY/7YqdR5rmpGCGO9TKtUpnxe7G7RVhtdUR2SOrpPKSOYg102p4
   bjEc5U4A5dM/M7xNUGNf+6p3Y5Ya6gUfEt4WisbWM9huoFrcKBuZEYJfT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13623170"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="13623170"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 07:46:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="8510507"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Nov 2023 07:46:27 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5pQn-0000dh-0H;
	Wed, 22 Nov 2023 15:46:25 +0000
Date: Wed, 22 Nov 2023 23:45:53 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: [drm-intel:for-linux-next-gt 1/6]
 drivers/gpu/drm/i915/i915_drm_client.h:81:1: error: non-void function does
 not return a value
Message-ID: <202311222102.LhBe6KCX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm-intel for-linux-next-gt
head:   5032c607e886e0c40749a05d37b835c1757d38ff
commit: e4ae85e364fc652ea15d85b0f3a6da304c9b5ce7 [1/6] drm/i915: Add ability for tracking buffer objects per client
config: x86_64-buildonly-randconfig-006-20231122 (https://download.01.org/0day-ci/archive/20231122/202311222102.LhBe6KCX-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311222102.LhBe6KCX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311222102.LhBe6KCX-lkp@intel.com/

Note: the drm-intel/for-linux-next-gt HEAD 5032c607e886e0c40749a05d37b835c1757d38ff builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/selftests/igt_spinner.c:12:
   In file included from drivers/gpu/drm/i915/selftests/igt_spinner.h:10:
   In file included from drivers/gpu/drm/i915/gem/i915_gem_context.h:12:
   In file included from drivers/gpu/drm/i915/gt/intel_context.h:14:
   In file included from drivers/gpu/drm/i915/i915_drv.h:54:
>> drivers/gpu/drm/i915/i915_drm_client.h:81:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
   }
   ^
   1 error generated.


vim +81 drivers/gpu/drm/i915/i915_drm_client.h

    78	
    79	static inline bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
    80	{
  > 81	}
    82	#endif
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
