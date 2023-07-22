Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2716D6107;
	Sat, 22 Jul 2023 02:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689993686; x=1721529686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nv48A78zBdFWJq1P/v2lZgZN/ORp1fu6gHegfxa3/2w=;
  b=JpnuQVonnBbhIrr70eIxMP7I1igSHfrS4icaDSLj3yq6wFUi7jWjumn5
   2Ew8fWAGhU1hNSsSVaAIYYuicMlFcogPOWSjrO+jo/boPBc0tP6vFAEBu
   +2d5K856alruok07KGhy2+Xg9NBvDR3nWdrZNsYQ3nNUnEBD9jrUnP+hS
   +t4MmXaNRZprXGPZP8NLIovIQtHhE/qS+iEQYKoJu7t9wORnIFjs/NER/
   U9MJdLD4RVk60/StWWu8ygQSEYx/dVfkJmpIvPWKdc6jCGcNRxMoNhrQb
   1FFIoX2Ce/vypPwMIYUAZeCaE8JQBJz2Wzlmxb1HXCcmCG+/temM9sOmu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="367185692"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="367185692"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 19:41:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="971633084"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="971633084"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 21 Jul 2023 19:41:23 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qN2Ya-0007t7-0v;
	Sat, 22 Jul 2023 02:41:21 +0000
Date: Sat, 22 Jul 2023 10:40:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 75/83]
 drivers/gpu/drm/nouveau/nvif/outp.c:385:1: warning: stack frame size (2104)
 exceeds limit (1024) in 'nvif_outp_edid_get'
Message-ID: <202307221033.lAQnwC1C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   19545cf2c6adc9e9dc95a3edb138d6734142a8ca
commit: 3f3aa58c4bba8b04d7d4d0ceafd52d2cbd19f5fb [75/83] WIPdrm/nouveau/disp/r535: initial support
config: arm-randconfig-r011-20230721 (https://download.01.org/0day-ci/archive/20230722/202307221033.lAQnwC1C-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307221033.lAQnwC1C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307221033.lAQnwC1C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvif/outp.c:385:1: warning: stack frame size (2104) exceeds limit (1024) in 'nvif_outp_edid_get' [-Wframe-larger-than]
     385 | nvif_outp_edid_get(struct nvif_outp *outp, u8 **pedid)
         | ^
   1 warning generated.


vim +/nvif_outp_edid_get +385 drivers/gpu/drm/nouveau/nvif/outp.c

   383	
   384	int
 > 385	nvif_outp_edid_get(struct nvif_outp *outp, u8 **pedid)
   386	{
   387		struct nvif_outp_edid_get_v0 args;
   388		int ret;
   389	
   390		args.version = 0;
   391	
   392		ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_EDID_GET, &args, sizeof(args));
   393		NVIF_ERRON(ret, &outp->object, "[EDID_GET] size:%d", args.size);
   394		if (ret)
   395			return ret;
   396	
   397		*pedid = kmalloc(args.size, GFP_KERNEL);
   398		if (WARN_ON(!*pedid))
   399			return -ENOMEM;
   400	
   401		memcpy(*pedid, args.data, args.size);
   402		return args.size;
   403	}
   404	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
