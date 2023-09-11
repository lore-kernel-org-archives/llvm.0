Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683EF5699;
	Mon, 11 Sep 2023 23:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694473315; x=1726009315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SJjqIEs3BpehUYyropfNGyc1F1+vwavmpmiIpcemogE=;
  b=f+UePbcwjAtSvy875p8zG8sXo/OIiPuTrUk0FkJ0xs/gOIVKa/ACLVvX
   AAHY1bpUb4szEE2DW0T485WEwRmzSyFoAvyUTATdoDp/vOl6NnaZG+6JT
   OebM0sdnwDkk3hxp69yq6eFQEQ4DnENS6luZ7fEbUXF7YI75BEvKPxqaw
   Or9ZOnra9+wXpIqrPcQ4tn7PnZvXZbxkCGOH6GHT095OmshPS7ayY2er5
   6Vx39syoxoT+E0RVtRGiIxGH57Lhcjd9GIQbYMZsMu5OfgkFBZtAV11zP
   EJv7W0D4Bb9wDflxRjg1L/kEGtoqe6ITNwiKOSJTwcZKYqaO97OQvQVQA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="382039406"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="382039406"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 16:01:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="720162063"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="720162063"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Sep 2023 16:01:53 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfpuh-0006qU-0e;
	Mon, 11 Sep 2023 23:01:51 +0000
Date: Tue, 12 Sep 2023 07:01:15 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:pr/186 9/9] drivers/gpu/drm/apple/dcp.c:455:2: warning:
 add explicit braces to avoid dangling else
Message-ID: <202309120640.fKUAz3Jc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux pr/186
head:   4030a6363f99fa38544b1556016ce71676406070
commit: 4030a6363f99fa38544b1556016ce71676406070 [9/9] drm: apple: Update supported firmware versions to 12.3 and 13.5
config: arm64-randconfig-r006-20230912 (https://download.01.org/0day-ci/archive/20230912/202309120640.fKUAz3Jc-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309120640.fKUAz3Jc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309120640.fKUAz3Jc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/apple/dcp.c:455:2: warning: add explicit braces to avoid dangling else [-Wdangling-else]
           else if (strncmp(compat_str, "13.5.0", sizeof(compat_str)) == 0)
           ^
   1 warning generated.


vim +455 drivers/gpu/drm/apple/dcp.c

   427	
   428	static enum dcp_firmware_version dcp_check_firmware_version(struct device *dev)
   429	{
   430		char compat_str[DCP_FW_VERSION_STR_LEN];
   431		char fw_str[DCP_FW_VERSION_STR_LEN];
   432		int ret;
   433	
   434		/* firmware version is just informative */
   435		dcp_read_fw_version(dev, "apple,firmware-version", fw_str);
   436	
   437		ret = dcp_read_fw_version(dev, "apple,firmware-compat", compat_str);
   438		if (ret < 0) {
   439			dev_err(dev, "Could not read 'apple,firmware-compat': %d\n", ret);
   440			return DCP_FIRMWARE_UNKNOWN;
   441		}
   442	
   443		if (strncmp(compat_str, "12.3.0", sizeof(compat_str)) == 0)
   444			return DCP_FIRMWARE_V_12_3;
   445		/*
   446		 * m1n1 reports firmware version 13.5 as compatible with 13.3. This is
   447		 * only true for the iomfb endpoint. The interface for the dptx-port
   448		 * endpoint changed between 13.3 and 13.5. The driver will only support
   449		 * firmware 13.5. Check the actual firmware version for compat version
   450		 * 13.3 until m1n1 reports 13.5 as "firmware-compat".
   451		 */
   452		else if (strncmp(compat_str, "13.3.0", sizeof(compat_str)) == 0)
   453			if (strncmp(fw_str, "13.5.0", sizeof(compat_str)) == 0)
   454				return DCP_FIRMWARE_V_13_5;
 > 455		else if (strncmp(compat_str, "13.5.0", sizeof(compat_str)) == 0)
   456			return DCP_FIRMWARE_V_13_5;
   457	
   458		dev_err(dev, "DCP firmware-compat %s (FW: %s) is not supported\n",
   459			compat_str, fw_str);
   460	
   461		return DCP_FIRMWARE_UNKNOWN;
   462	}
   463	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
