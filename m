Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411F5185E;
	Fri, 28 Jul 2023 02:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690513061; x=1722049061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LBtm+Y96cKGSFcVGQHClffuXdeJJpbEzjiPKqnDfi9M=;
  b=FWKSIEmStYION4oSo9wwztsFgRkQhhTfO2v9TXvoQp0xAGLFTltDWL3Y
   IcDVG3s8LSdKfKOOKJuU7QmTpTbSeedPmL7zjKkAjpfeIPlBQvdYP8LVA
   9aNAvGY/BiQ7yKSG1YsrKbocFUoJpH5f1fTxuC/ciuuN5U04PNFdlfOmK
   PQkL305E9u9j9Nr51lwb6uzr0jP1CkdZ2LmgrX8JRIz9Ha61iVypSwvrA
   1hqPdqPBPtfK2pLppqb323Nbg2ZMVS+BRbQxbeLYWkH0V6gKS2kdr4eB9
   8aQxu5ygrd1jFSulvrrbc25MLUmziMT86UJi7QXwiMuEMoraklLmaLrqK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="358512527"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="358512527"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 19:57:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="762443096"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="762443096"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 27 Jul 2023 19:57:35 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPDfa-0002ox-2q;
	Fri, 28 Jul 2023 02:57:34 +0000
Date: Fri, 28 Jul 2023 10:57:07 +0800
From: kernel test robot <lkp@intel.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [mtd:nand/next 31/32] drivers/mtd/nand/raw/meson_nand.c:244:59:
 error: initializer element is not a compile-time constant
Message-ID: <202307281007.MMuVjmJ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
head:   6680d8b67921fc732a59792dec6d3f94c031451c
commit: 0e1db39336d8be4ddeb9f0d99720056f3ff41310 [31/32] mtd: rawnand: meson: support for 512B ECC step size
config: x86_64-buildonly-randconfig-r003-20230727 (https://download.01.org/0day-ci/archive/20230728/202307281007.MMuVjmJ9-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281007.MMuVjmJ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307281007.MMuVjmJ9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mtd/nand/raw/meson_nand.c:244:59: error: initializer element is not a compile-time constant
   static const struct nand_ecc_step_info axg_stepinfo[] = { axg_stepinfo_1024, axg_stepinfo_512 };
                                                             ^~~~~~~~~~~~~~~~~
   1 error generated.


vim +244 drivers/mtd/nand/raw/meson_nand.c

   243	
 > 244	static const struct nand_ecc_step_info axg_stepinfo[] = { axg_stepinfo_1024, axg_stepinfo_512 };
   245	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
