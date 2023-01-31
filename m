Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09890640;
	Tue, 31 Jan 2023 05:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675141661; x=1706677661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=34z+6kRXUbFr/9eQ+vAivH1RVhZIaxh+OjtYFgiOp2Q=;
  b=dl3BZBHwcuFxLQlMxubAivUk7weqNe6y077cmwYEueF5eOqfYeU6I8kR
   ggt63PFjcb8jEFMgA2z+HtYtUN6F+Reuk4/srIFR/NR7anUpzUGuheqtJ
   4OyHsP08TXKBD+QpNFlQwZBa72lXGOGvyyBAcYJuP5QkQ5BPbdOXpCNO+
   5pvBDHt+P3MGQI1CID7IoexT2z5Ig2kBHIVGpmsOXWaa7BFu+TnFOIeQq
   XcAg80g6GLMpajg4UUGwcgySDsHsh+OQKPk0KtSe84HkLW8BmcMpIVAY2
   AvCcDInOOEL4E4RIMY7WpxS7EpG3+aMGHIP3YNiw9o7bqjD/iIFaqR/0H
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="392300275"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="392300275"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 21:07:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="993137537"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="993137537"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Jan 2023 21:07:37 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMiro-0004C6-2R;
	Tue, 31 Jan 2023 05:07:36 +0000
Date: Tue, 31 Jan 2023 13:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Ben Widawsky <ben.widawsky@intel.com>,
	Dan Williams <dan.j.williams@intel.com>, linux-cxl@vger.kernel.org
Subject: [cxl:for-6.3/cxl-ram-region 17/17] ld.lld: error: undefined symbol:
 cxl_add_to_region
Message-ID: <202301311303.f3BvWCnS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git for-6.3/cxl-ram-region
head:   f71922e583ef6b6e17575c87e496b17f91193d37
commit: f71922e583ef6b6e17575c87e496b17f91193d37 [17/17] cxl/region: Add region autodiscovery
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230131/202301311303.f3BvWCnS-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/commit/?id=f71922e583ef6b6e17575c87e496b17f91193d37
        git remote add cxl https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git
        git fetch --no-tags cxl for-6.3/cxl-ram-region
        git checkout f71922e583ef6b6e17575c87e496b17f91193d37
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: cxl_add_to_region
   >>> referenced by port.c:45 (drivers/cxl/port.c:45)
   >>>               drivers/cxl/port.o:(discover_region) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
