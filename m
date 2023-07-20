Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE0D3D99;
	Thu, 20 Jul 2023 06:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689834394; x=1721370394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tm0eku+wswQKXFuRRAZkqYURkdKhnJEHYQlEpkvFySQ=;
  b=gxNaGRQWD+A+q/ME1optqIEPoVtHGOi6gW/xyfsxKmmjqduK31USQtRp
   BNDqcEM+O0+61h2cCybgVR/pskm4OTFAAaiP2wKJ+V6H/LyGq1L3x3LlL
   hzT9mtTvHSK6tq18pCtDvV/yzRP3x5+8S1eHKmzvAExDKkcqHmeaHSLPN
   N04nz06kRRp4c9SCLFzKrELgT4sgxfxp/C0s7EdAqcR2HfjjRdljAgCw2
   0VPVmdCXvnFThAYeaIA6Ym1Sm3rtpqNUH7LHB73+4ILeJ5w6DgyJgVwPh
   w4FbabhpsbWeW25QOvxSMgSS+ZcqceUDq72LSvpo5eKHSBcTwgBIyk8Tq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="346236444"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="346236444"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 23:26:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="848331033"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="848331033"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 19 Jul 2023 23:26:31 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMN7O-0005oZ-1m;
	Thu, 20 Jul 2023 06:26:30 +0000
Date: Thu, 20 Jul 2023 14:25:56 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Boris Brezillon <bbrezillon@kernel.org>
Subject: [drm-misc:for-linux-next 1/2]
 drivers/gpu/drm/drm_gpuva_mgr.c:622:48: warning: format specifies type
 'unsigned long' but the argument has type 'unsigned int'
Message-ID: <202307201438.qQ76Qj5X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   4f66feeab173bd73e71028b8c2e1dcea07e32dd5
commit: e6303f323b1ad9c02ae813fc3dedeaa9dadfd3b0 [1/2] drm: manager to keep track of GPUs VA mappings
config: hexagon-randconfig-r004-20230720 (https://download.01.org/0day-ci/archive/20230720/202307201438.qQ76Qj5X-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307201438.qQ76Qj5X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307201438.qQ76Qj5X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_gpuva_mgr.c:622:48: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     622 |                     "GPUVA address limited to %lu bytes.\n", sizeof(end));
         |                                               ~~~            ^~~~~~~~~~~
         |                                               %u
   include/asm-generic/bug.h:133:29: note: expanded from macro 'WARN'
     133 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                                           ^~~~~~
   include/asm-generic/bug.h:97:48: note: expanded from macro '__WARN_printf'
      97 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
         |                                                              ^~~
   drivers/gpu/drm/drm_gpuva_mgr.c:1079:32: warning: variable 'prev' set but not used [-Wunused-but-set-variable]
    1079 |         struct drm_gpuva *va, *next, *prev = NULL;
         |                                       ^
   2 warnings generated.


vim +622 drivers/gpu/drm/drm_gpuva_mgr.c

   615	
   616	static bool
   617	drm_gpuva_check_overflow(u64 addr, u64 range)
   618	{
   619		u64 end;
   620	
   621		return WARN(check_add_overflow(addr, range, &end),
 > 622			    "GPUVA address limited to %lu bytes.\n", sizeof(end));
   623	}
   624	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
