Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AAA2D781;
	Sun, 21 Jan 2024 06:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705816988; cv=none; b=UkjL05WofaKp0ujHsJ5YwzhrwpDDs/SBiurjxL9VI2XX6ZYKQb9X+x8fr+nC8N2WMIyLAfiOKAyj9olKAjkaoe8Oq0jZAQTCIEjznvItZ6P0FwavBg9oq9qH66krrZ3sjdp/0x+66mB2VSZCz/8DpVtnjrl8zm6OILQR0qXYYZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705816988; c=relaxed/simple;
	bh=ecgC0lJ7bq69YQExQhc/A6u5cps0ijoLfV05m3vqtKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FgyYBDwLiSkeiBNjVmHU2R3HVn1PjHRi9y61WIi90vvuYHeMkoYgj8ZpWvmnEjitJQs/HtG/x9bgcTxfstolZrbqxYONh5TK1G/5cpjkeF2Mr16HeNPIsOrHFsL3A4m7QcZ7kC4blf1ylfrwlaoDn+mKQyavHUmcpuaPfjrIa4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URszF6mL; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URszF6mL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705816986; x=1737352986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ecgC0lJ7bq69YQExQhc/A6u5cps0ijoLfV05m3vqtKE=;
  b=URszF6mLZRi9djSEaXxNhtmhkQEiuVU/Ok0WoTs0lEhUG/+c5rpDN9L7
   4jfa9m+adMbItXCHtA9HbGWrKNhwZNCkHYIRPa/MZlOz/8A4w3CnWYXjY
   8Wms9M2t7hmthtouhw61ysTGuiG0rmKyHTFa956gMlMS29aN39rPQ78UL
   daXZnyXGOPLdpKLOosf7IU6P+NEqa6KW6uel17ZL8GrWqBOi7o3m9SSGb
   UWOITzKtCoHW9zZKVPR5SN+nkAGrSN9qcwF0HLMhwU9j20M6btMejeHDN
   YJD/pMDQ4N6DeeX5rJDOAUbg6fxIwWmbEZG9tLvBDBvBv0VrHsWMF5VWZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="400652164"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="400652164"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 22:03:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="778306005"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="778306005"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Jan 2024 22:03:03 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRQv6-0005iQ-2Y;
	Sun, 21 Jan 2024 06:03:00 +0000
Date: Sun, 21 Jan 2024 14:02:15 +0800
From: kernel test robot <lkp@intel.com>
To: ckkim <changkon12@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.1.y 22/91]
 drivers/power/reset/odroid-reboot.c:63:6: warning: no previous prototype for
 function 'odroid_card_reset'
Message-ID: <202401211409.lcgvCFFg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   4abe38fb1d55e2c5f10582404c5ff88505060b73
commit: 3aecc1cd0e4093eda45e6a35ec7023b3ef3d8037 [22/91] ODROID-COMMON: power:reset: Add odroid support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240121/202401211409.lcgvCFFg-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d92ce344bf641e6bb025b41b3f1a77dd25e2b3e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401211409.lcgvCFFg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401211409.lcgvCFFg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/power/reset/odroid-reboot.c:63:6: warning: no previous prototype for function 'odroid_card_reset' [-Wmissing-prototypes]
      63 | void odroid_card_reset(void)
         |      ^
   drivers/power/reset/odroid-reboot.c:63:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      63 | void odroid_card_reset(void)
         | ^
         | static 
   drivers/power/reset/odroid-reboot.c:141:3: error: use of undeclared identifier 'arm_pm_restart'
     141 |                 arm_pm_restart = do_odroid_restart;
         |                 ^
   1 warning and 1 error generated.


vim +/odroid_card_reset +63 drivers/power/reset/odroid-reboot.c

    62	
  > 63	void odroid_card_reset(void)
    64	{
    65		int ret = 0;
    66	
    67		if ((sd_vqsw == 0) && (sd_vmmc == 0))
    68			return;
    69	
    70		if (sd_vqen == 0) {
    71			gpio_free(sd_vqsw);
    72			gpio_free(sd_vmmc);
    73			ret = gpio_request_one(sd_vqsw,
    74					GPIOF_OUT_INIT_LOW, "REBOOT");
    75			CHECK_RET(ret);
    76			mdelay(10);
    77			ret = gpio_direction_output(sd_vqsw, 1);
    78			CHECK_RET(ret);
    79			ret = gpio_request_one(sd_vmmc,
    80					GPIOF_OUT_INIT_LOW, "REBOOT");
    81			CHECK_RET(ret);
    82			mdelay(10);
    83			ret = gpio_direction_output(sd_vqsw, 0);
    84			CHECK_RET(ret);
    85			ret = gpio_direction_output(sd_vmmc, 1);
    86			CHECK_RET(ret);
    87			mdelay(5);
    88			gpio_free(sd_vqsw);
    89			gpio_free(sd_vmmc);
    90		} else {
    91			gpio_free(sd_vqsw);
    92			gpio_free(sd_vqen);
    93			gpio_free(sd_vmmc);
    94	
    95			ret = gpio_request_one(sd_vqsw,
    96					GPIOF_OUT_INIT_LOW, "REBOOT");
    97			CHECK_RET(ret);
    98			ret = gpio_request_one(sd_vqen,
    99					GPIOF_OUT_INIT_LOW, "REBOOT");
   100			CHECK_RET(ret);
   101			ret = gpio_request_one(sd_vmmc,
   102					GPIOF_OUT_INIT_LOW, "REBOOT");
   103			CHECK_RET(ret);
   104			mdelay(100);
   105			ret = gpio_direction_input(sd_vqen);
   106			CHECK_RET(ret);
   107			ret = gpio_direction_input(sd_vmmc);
   108			CHECK_RET(ret);
   109			ret = gpio_direction_input(sd_vqsw);
   110			CHECK_RET(ret);
   111			mdelay(5);
   112			gpio_free(sd_vqen);
   113			gpio_free(sd_vmmc);
   114			gpio_free(sd_vqsw);
   115		}
   116	}
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
