Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AE6DDB6;
	Tue,  5 Sep 2023 21:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693947939; x=1725483939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IBk3jWkSB6IkWhIB59H8H92tQuag812O3k9HULfxJO4=;
  b=Yc1/lyUOtoVgeuyJvdL7E+1qBPx5A6eg7IpncDAoO1FoZXDqBzCMkjBM
   2gRMEa/LE1B5lV+J2OzT9cFaD0QAwZNsMjiUs+1hNzvawRM2c4oXLrILS
   huHrie7yL2Dqq6pgkc8cjkqc9hF1vp5kIV1taQohOLskLbzH3VY4PQ68P
   b4iQ8xpt+QCuth2HsetZzdK9w3jjt4HBKCqyc62VgKoEOncXERfNUlRJL
   7mJu3VTdcKEHXA/jdIPcRGF4uO5s5GVpRNwHenMi0LhOJi+41Su2cjXsz
   fTbIG1gaISTOm9flwUGsSNTSQqmpcjPICbPGXnPonly3uOL5WAB2pEVh9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="407900198"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="407900198"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 14:05:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="884453106"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="884453106"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 05 Sep 2023 14:05:25 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qddEq-00024x-07;
	Tue, 05 Sep 2023 21:05:32 +0000
Date: Wed, 6 Sep 2023 05:05:16 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@xilinx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Manish Narani <manish.narani@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:master 674/1123] ERROR: modpost:
 "dwc3_host_wakeup_capable" [drivers/usb/host/xhci-plat-hcd.ko] undefined!
Message-ID: <202309060410.ZOXwilaG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx master
head:   cb1f2dbc7e487361688257fccf78bf3f3ce0e9ed
commit: 22f32ef388442066b0fd5a9f03d63102f09825bf [674/1123] usb: xhci-plat: Add remote wakeup support
config: x86_64-randconfig-074-20230905 (https://download.01.org/0day-ci/archive/20230906/202309060410.ZOXwilaG-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309060410.ZOXwilaG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060410.ZOXwilaG-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dwc3_host_wakeup_capable" [drivers/usb/host/xhci-plat-hcd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
