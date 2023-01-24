Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175618F6A;
	Tue, 24 Jan 2023 21:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674597085; x=1706133085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6yqOdH/2HoadqY1VxzYmOkpFkB8rIyff+f2r+IfhnRM=;
  b=nvvDwmFnhCyeI7WhMgj8JdWAWzwNxVpIdTMKQi3tuibGkzrMjxzAH0in
   Z0SkGUY18IWcQFLYbQVdq3pxxCmc4dfE3g3yAEILrpmaL7XyM/Gu8270i
   ISLpWrkYyqe8vcJlYGdlFcRnaJYjxVhZGjs/hQxyY/oQuXPHA3K7o1dfY
   8YVoll5hxqqAgB39Wc/XhvgJzRgRtSmSTZRSSmpsm/f5VtdBbyBYMZZWM
   tGslmNemJ2B1u2YNVex2zbjDooQM7a+OFN1KS7XxlmzlKNmZWD3IeRmAC
   yGnFVLB6Mm4NE3I8C47Xu58KS3iKQq4NrW94MBQP9vGMdNfbOynu7Sxhf
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="325089346"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="325089346"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 13:51:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="804769364"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="804769364"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2023 13:51:23 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKRCM-0006o8-0n;
	Tue, 24 Jan 2023 21:51:22 +0000
Date: Wed, 25 Jan 2023 05:50:25 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6983/7678] ERROR: modpost:
 "ethtool_aggregate_pause_stats"
 [drivers/net/ethernet/mscc/mscc_ocelot_switch_lib.ko] undefined!
Message-ID: <202301250515.IMqsaFXE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a54df7622717a40ddec95fd98086aff8ba7839a6
commit: ab3f97a9610a8d90dc9934517e82c3272d4e98a0 [6983/7678] net: mscc: ocelot: export ethtool MAC Merge stats for Felix VSC9959
config: hexagon-randconfig-r022-20230123 (https://download.01.org/0day-ci/archive/20230125/202301250515.IMqsaFXE-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ab3f97a9610a8d90dc9934517e82c3272d4e98a0
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ab3f97a9610a8d90dc9934517e82c3272d4e98a0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "ethtool_aggregate_pause_stats" [drivers/net/ethernet/mscc/mscc_ocelot_switch_lib.ko] undefined!
>> ERROR: modpost: "ethtool_aggregate_rmon_stats" [drivers/net/ethernet/mscc/mscc_ocelot_switch_lib.ko] undefined!
>> ERROR: modpost: "ethtool_aggregate_ctrl_stats" [drivers/net/ethernet/mscc/mscc_ocelot_switch_lib.ko] undefined!
>> ERROR: modpost: "ethtool_aggregate_mac_stats" [drivers/net/ethernet/mscc/mscc_ocelot_switch_lib.ko] undefined!
>> ERROR: modpost: "ethtool_aggregate_phy_stats" [drivers/net/ethernet/mscc/mscc_ocelot_switch_lib.ko] undefined!
ERROR: modpost: "vpss_enable_clock" [drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.ko] undefined!
ERROR: modpost: "vpss_select_ccdc_source" [drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
