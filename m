Received: from mgamail.intel.com (unknown [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE13A1078B;
	Fri, 28 Jul 2023 08:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690534284; x=1722070284;
  h=date:from:cc:subject:message-id:mime-version;
  bh=b2tPsltTweufZDgMJm+penQjExJcjyWQr90C1EOUjP0=;
  b=W/6SDH3/7eaHbnLFE8DXvxa8wVmrZLkLVp1Bov7yczlPqJBnuOgL4bxf
   tL6RjEdtkeAB1VlpXFv+EzgJsdC9V+ePw/2PPZdYloGiUmOUJ2pga5rlJ
   6pjcCPUIUTsad/xo6ehIrlFakDv0FeWByZtrFnEdI5LnIXO8IIB4piHtv
   CoUtmkvcpVzf5UAldHZAS1av3KgQyYUyqOiU/78xdeZvh/aQPKDPb49+8
   AnXD5k02ROwQj1h5uZO+NLF1bkeWKinCCbme+6eDpsfUcPBhnewOR1F6U
   A0180+TpBAXV8k9VNV7hp1sz4chNc4dai8mSCCW0w/uEwck0Fv5iytp+U
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="432357811"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="432357811"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 01:51:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="973984863"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="973984863"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 28 Jul 2023 01:51:22 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPJBi-00032x-24;
	Fri, 28 Jul 2023 08:51:10 +0000
Date: Fri, 28 Jul 2023 16:50:51 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [djwong-xfs:xfile-page-caching 168/193] ld.lld: error:
 vmlinux.a(drivers/mtd/nand/raw/brcmnand/iproc_nand.o):(function
 iproc_nand_probe: .text+0x44): relocation R_RISCV_HI20 out of range: 533176
 is not in [-524288, 524287]; references '.L.str.1'
Message-ID: <202307281617.ywHSLH3K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   108710339db1b82e4eaa181882d043d9cf0fc86c
commit: c299379c312a98e3915c9c1e79646b1d76fb79a6 [168/193] xfs: validate explicit directory data buffer owners
config: riscv-randconfig-r035-20230727 (https://download.01.org/0day-ci/archive/20230728/202307281617.ywHSLH3K-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281617.ywHSLH3K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307281617.ywHSLH3K-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(drivers/mtd/nand/raw/brcmnand/iproc_nand.o):(function iproc_nand_probe: .text+0x44): relocation R_RISCV_HI20 out of range: 533176 is not in [-524288, 524287]; references '.L.str.1'
   >>> referenced by iproc_nand.c:0 (drivers/mtd/nand/raw/brcmnand/iproc_nand.c:0)
   >>> defined in vmlinux.a(drivers/mtd/nand/raw/brcmnand/iproc_nand.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
