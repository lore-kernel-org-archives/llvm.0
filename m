Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC5518621;
	Tue, 21 Nov 2023 05:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PVNmtci5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700543217; x=1732079217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=04KqZl1G1+fBQJI3RnSh7y+srxH1479j7GO1vnyZFOk=;
  b=PVNmtci5dE/kUknTnp2Gi8dtB3L9GjhwFAyC+jj05XMW0ym1tefZpa6l
   mp+x3ad+v3y9CAZLczfnFlpvz5TQoAJMkhojLfYUVEYTtBqNnob+TE3rb
   RnR+xa4sC4SkVM6ewEYZkvSa7w2mqqxr/2BMRaYx5O0uTbuREOccK5yFg
   WgDt45+XCeSxloA/5Zu0UVpasp6wQ97x18w4laRbVDn+2V+ON4R/SVwK/
   Z3Wxx22xmtdYk2aSoI2Sv6milmLCPxrCjqZNk5bfAzXCkRWsZ7g2F07r/
   iIinH/8ZaDo2CR2gfKFE143UZ+yTFNAKo2nZe9FGHrIhE/1t6hCdW++Qn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371937455"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="371937455"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 21:06:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="836946216"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="836946216"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 20 Nov 2023 21:06:55 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5IyL-0007KQ-10;
	Tue, 21 Nov 2023 05:06:53 +0000
Date: Tue, 21 Nov 2023 13:06:16 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robertosassu:ima-evm-lsms-v6-devel-v4 22/26]
 security/integrity/evm/evm_main.c:1061:12: warning: no previous prototype
 for function 'init_evm_lsm'
Message-ID: <202311211244.2uqAiAnr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/robertosassu/linux ima-evm-lsms-v6-devel-v4
head:   58605e8f9256d446ad8fa46474f4a402a68715a5
commit: ab43d28d22d09d87c91646df14890fa542f9dc3d [22/26] evm: Move to LSM infrastructure
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231121/202311211244.2uqAiAnr-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311211244.2uqAiAnr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211244.2uqAiAnr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/integrity/evm/evm_main.c:1061:12: warning: no previous prototype for function 'init_evm_lsm' [-Wmissing-prototypes]
   int __init init_evm_lsm(void)
              ^
   security/integrity/evm/evm_main.c:1061:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __init init_evm_lsm(void)
   ^
   static 
   1 warning generated.


vim +/init_evm_lsm +1061 security/integrity/evm/evm_main.c

  1054	
  1055	/*
  1056	 * Since with the LSM_ORDER_LAST there is no guarantee about the ordering
  1057	 * within the .lsm_info.init section, ensure that IMA hooks are before EVM
  1058	 * ones, by letting the 'integrity' LSM call init_evm_lsm() to initialize the
  1059	 * 'ima' and 'evm' LSMs in this sequence.
  1060	 */
> 1061	int __init init_evm_lsm(void)
  1062	{
  1063		security_add_hooks(evm_hooks, ARRAY_SIZE(evm_hooks), &evm_lsmid);
  1064		return 0;
  1065	}
  1066	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
