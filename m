Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A0E22DFE5;
	Sat,  8 Feb 2025 16:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739032047; cv=none; b=iNcvnagAkhLkhsish/IGGiVe7mTRI58m59jO3sW6ysFlW95OBuF8ZVgrmW/qvvUaAmzQu6idaqNU7L4h+aFslvPhUMeXxau+5oOACwX80sXmkxbl4jLv8k6XP8/4wEjmQOH/eE0Cdo3U2UmuYoafuOoOGzxd+p+/8yGsthDAu4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739032047; c=relaxed/simple;
	bh=C8hztGbGottthtxFYJuS2HOP21X4ieKOjpwQU9skmfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XV2CWOfYCT4V5Rk2P1+kKU2P5EkXWhZLPcvSapT1Os6PHxfo2LhPazHgdYGtvxetzEZEc4f+4tRxencWOh53715mFPGTYPi1bzAP1UZSfvlA0JNl7j4JX5rywvw36Uc8rqy1KoDDmjdOXsKGKXH6kyPna+OG2tyjWXDIkUQcM8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=axQGG9gl; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="axQGG9gl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739032045; x=1770568045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C8hztGbGottthtxFYJuS2HOP21X4ieKOjpwQU9skmfs=;
  b=axQGG9gl3lysg03ouZ/d2dx5okAaL/dlkUI3wjzrDQC3CPL5luFa/ZEE
   m9rMdjop3dcXl/A/ooRX4JI1oijUzHvBQYWXP+iSZUExiHuwpI7srFOQB
   brAr0D/TD177BG8TJsONK8uqQVohz0YetqeVpCiIlREx5PwYCxy1aukjC
   oGaj0Qt8Abn/PScj8Hc0oHt6dkxl7ALc1kXOnW9e0ZuPkfVazhQuJ0BBv
   ITYJqL3QqfACuSlvumhCvdAfCGms8vElOMXWRX7uAEI/e/HJzNddFUekA
   WIZloBBXk3FzjD2gV4/uZrrJ7wLf/kASti1M86j7GpRy2e/DUv2IYT45I
   g==;
X-CSE-ConnectionGUID: mgn3jyGATMeieXG+onFoEg==
X-CSE-MsgGUID: 0l5m+3oXQcyXLDC+RJzYGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="62136687"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="62136687"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 08:27:25 -0800
X-CSE-ConnectionGUID: Tk9qTRhaR0WELmQSc9S0Rw==
X-CSE-MsgGUID: F7mz4GCGSjy3Zc3F/fOi0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111628198"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Feb 2025 08:27:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgnft-0010Kp-1m;
	Sat, 08 Feb 2025 16:27:21 +0000
Date: Sun, 9 Feb 2025 00:26:38 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/5] drm/scheduler: Add scheduler unit testing
 infrastructure and some basic tests
Message-ID: <202502090019.4tBBMkwC-lkp@intel.com>
References: <20250207143337.60154-3-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207143337.60154-3-tvrtko.ursulin@igalia.com>

Hi Tvrtko,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on linus/master v6.14-rc1 next-20250207]
[cannot apply to drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-Move-some-options-to-separate-new-Kconfig-debug/20250207-223734
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250207143337.60154-3-tvrtko.ursulin%40igalia.com
patch subject: [RFC 2/5] drm/scheduler: Add scheduler unit testing infrastructure and some basic tests
config: i386-buildonly-randconfig-005-20250208 (https://download.01.org/0day-ci/archive/20250209/202502090019.4tBBMkwC-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090019.4tBBMkwC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090019.4tBBMkwC-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: missing MODULE_LICENSE() in drivers/gpu/drm/scheduler/tests/drm_mock_scheduler.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/scheduler/tests/drm_mock_scheduler.o
ERROR: modpost: missing MODULE_LICENSE() in drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "drm_mock_new_scheduler" [drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.ko] undefined!
>> ERROR: modpost: "drm_mock_scheduler_fini" [drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.ko] undefined!
>> ERROR: modpost: "drm_mock_new_sched_entity" [drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.ko] undefined!
>> ERROR: modpost: "drm_mock_new_sched_job" [drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.ko] undefined!
>> ERROR: modpost: "drm_mock_sched_advance" [drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.ko] undefined!
>> ERROR: modpost: "drm_mock_sched_entity_free" [drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
