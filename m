Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D822E30F83;
	Sat,  9 Sep 2023 08:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694249402; x=1725785402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RWuNdnNpCU2tL5B9S/aR2trwz3f1F/WPATo6QAUCWQQ=;
  b=fuboLqeVuOGoFG0W/+Q6a/97bHPlA7AVaU+LYtyUontJ5zrZf8ArFY3Q
   iQfPnctlC1pDiDg1HNSX9EnFK1ZXf0tMQCTuqRuXs5t4jIXbjCL4DsJyo
   tzuF3mXJJGw8xkkELD3FLrhn+sy+g09pWkeXKiJupmM4QK1JX9c/Xuz4Q
   P0U1ANW6MgsrfKG9O8bZm/ixSeubRqOnNoxDHeFD0EXKbeZ4EyFPpzjBg
   iYhTe/cjdprd694LGbLyHaPFR6avZ0tHmy4974FlfIqk1ICjNEbbw72U1
   nujz34XwlkUl3LHrJt68SO/OVyYzF8BPyX4R0Hzw16uDQeYeE2TkyUca5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="375178601"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="375178601"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 01:50:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="832925300"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="832925300"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Sep 2023 01:50:00 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qetfC-0003BH-0W;
	Sat, 09 Sep 2023 08:49:58 +0000
Date: Sat, 9 Sep 2023 16:49:36 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 57/88]
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:399:1: warning: no
 previous prototype for function 'nv50_instmem_dtor'
Message-ID: <202309091636.ezwcyt2o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   dcd62291d3f1ba328303b1617495fa4542117fc1
commit: c3960b6f161b81617f2da25b588b01263a42e43d [57/88] drm/nouveau/imem/tu102-: prepare for GSP-RM
config: arm-randconfig-r024-20230909 (https://download.01.org/0day-ci/archive/20230909/202309091636.ezwcyt2o-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091636.ezwcyt2o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091636.ezwcyt2o-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:399:1: warning: no previous prototype for function 'nv50_instmem_dtor' [-Wmissing-prototypes]
     399 | nv50_instmem_dtor(struct nvkm_instmem *base)
         | ^
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:398:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     398 | void *
         | ^
         | static 
   1 warning generated.


vim +/nv50_instmem_dtor +399 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c

   397	
   398	void *
 > 399	nv50_instmem_dtor(struct nvkm_instmem *base)
   400	{
   401		return nv50_instmem(base);
   402	}
   403	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
