Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737EB182C0;
	Sun,  5 Nov 2023 20:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RgtqmvoF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699217961; x=1730753961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sq0ThEPSE6TKYAfIXSyA/F2IzCQu09BlLS+DdJd+Bro=;
  b=RgtqmvoFzOt/EYYwd6wN4dewYYtlxBSrYBZ3J/vG3azX/qEyyzBfgoF+
   UWf1W/VdiODr93RUijg6mZK2+9VuGFmoWN7T+e6hzwxLFJcoQYJRByZEc
   X+DZmvAAnBf9oSa+xChs626DJtUZaRIHGE5bienFlObT2B+/FLvoEL5vf
   hux50K2gRPEpsajcxpMEcqtmQrUzeueAbfaPAJ3hTR99HBpFXn7f9Eb9A
   NYtXR2BgQskAGr/Vmo/CGyuxGVnZrVPKVR4PRw/VUP6C3UA1T185dBArB
   L9GDo6Z6BXckXfO7Mr/sRD/2hSWqrt8wa+BwUA71R3C8Yk2V56ixErcMf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="388992939"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="388992939"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 12:59:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="738620652"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="738620652"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 05 Nov 2023 12:59:18 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzkDE-0005n9-1s;
	Sun, 05 Nov 2023 20:59:16 +0000
Date: Mon, 6 Nov 2023 04:58:57 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/240-isp 22/56]
 drivers/media/platform/apple/isp/isp-v4l2.c:325:20: warning: no previous
 prototype for function 'isp_select_preset'
Message-ID: <202311060443.6p7pc7yW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   b5b7f780ce17699202c057aff11992dbde545241
commit: 565c88c00f8bc78a467faa502c1da262c833ce4a [22/56] media: apple: isp: Working t602x and multiple formats and more fixes
config: powerpc64-allyesconfig (https://download.01.org/0day-ci/archive/20231106/202311060443.6p7pc7yW-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060443.6p7pc7yW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060443.6p7pc7yW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/apple/isp/isp-v4l2.c:325:20: warning: no previous prototype for function 'isp_select_preset' [-Wmissing-prototypes]
     325 | struct isp_preset *isp_select_preset(struct apple_isp *isp, u32 width,
         |                    ^
   drivers/media/platform/apple/isp/isp-v4l2.c:325:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     325 | struct isp_preset *isp_select_preset(struct apple_isp *isp, u32 width,
         | ^
         | static 
   1 warning generated.


vim +/isp_select_preset +325 drivers/media/platform/apple/isp/isp-v4l2.c

   324	
 > 325	struct isp_preset *isp_select_preset(struct apple_isp *isp, u32 width,
   326					     u32 height)
   327	{
   328		struct isp_preset *preset, *best = &isp->presets[0];
   329		int i, score, best_score = INT_MAX;
   330	
   331		/* Default if no dimensions */
   332		if (width == 0 || height == 0)
   333			return &isp->presets[0];
   334	
   335		for (i = 0; i < isp->num_presets; i++) {
   336			preset = &isp->presets[i];
   337			score = abs((int)preset->output_dim.x - (int)width) +
   338			abs((int)preset->output_dim.y - (int)height);
   339			if (score < best_score) {
   340				best = preset;
   341				best_score = score;
   342			}
   343		}
   344	
   345		return best;
   346	}
   347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
