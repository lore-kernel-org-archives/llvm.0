Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5D956770;
	Tue,  5 Dec 2023 12:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/I38Hss"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701778129; x=1733314129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OHqJtD5QFJaEVHzSGnv66Ty4ETR4W0f7T3VyjhZXV1s=;
  b=m/I38HsseDL8yFl1rK3fBjPcq3rv/6u62fqp7Gp+IHv4Z+/L98zL2oWY
   THGJHvSSitqyKA7Aj8Gqb0WoCCdI5P+ZTUxW2/YG0bsn8us+Jg8rXcppW
   7AKkXbiON/izsuihdfgcKpcHYJ2nBGjKNm5aO4Nz5gismTtiA7aFz+8WN
   QeRBAEuLy37eanqKL0H/j6kMnnCvr7wWKJttc60IhHMRv67ELw7aCyIGq
   1nXrCBzozCm1s4Zoj5MqhG2huWep64kYl/TkgYopvDK3/1VYEoF9Rhtop
   torMmYmntyLRf7MX91qKwA0Dveah8zdaAruva6sC/zt9ADThKP/Wv7S/4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="374071858"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="374071858"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 04:08:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="841434602"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="841434602"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 05 Dec 2023 04:08:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAUE6-0008wK-1P;
	Tue, 05 Dec 2023 12:08:34 +0000
Date: Tue, 5 Dec 2023 20:07:57 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [esmil:jh7110 38/41] drivers/gpu/drm/verisilicon/vs_dc.c:794:9:
 warning: variable 'ret' set but not used
Message-ID: <202312052047.4wHjgrw7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux jh7110
head:   78d944d20650c3fd11da3a45a55c47922c2b69b7
commit: 0f74e00252e01778747e8f8aafe43a09ff246b82 [38/41] drm/vs: Add KMS crtc&plane
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231205/202312052047.4wHjgrw7-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312052047.4wHjgrw7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312052047.4wHjgrw7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/verisilicon/vs_dc.c:794:9: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           u32 i, ret;
                  ^
   1 warning generated.
--
>> drivers/gpu/drm/verisilicon/vs_crtc.c:217:40: warning: unused variable 'vs_sync_mode_enum_list' [-Wunused-const-variable]
   static const struct drm_prop_enum_list vs_sync_mode_enum_list[] = {
                                          ^
   1 warning generated.


vim +/ret +794 drivers/gpu/drm/verisilicon/vs_dc.c

   789	
   790	static irqreturn_t dc_isr(int irq, void *data)
   791	{
   792		struct vs_dc *dc = data;
   793		struct vs_dc_info *dc_info = dc->hw.info;
 > 794		u32 i, ret;
   795	
   796		ret = dc_hw_get_interrupt(&dc->hw);
   797	
   798		for (i = 0; i < dc_info->panel_num; i++)
   799			vs_crtc_handle_vblank(&dc->crtc[i]->base, dc_hw_check_underflow(&dc->hw));
   800	
   801		return IRQ_HANDLED;
   802	}
   803	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
