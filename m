Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521951548F;
	Tue, 21 Nov 2023 02:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M0WqcxlV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700533970; x=1732069970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I0adLWEBneurJj9g7I2Wrt1d9aNHr68JhevZImN9BQo=;
  b=M0WqcxlVW0ID5NgBR9n0MSBV6XnqjnwUt9YKLXzogFRvsXXw/fLbFY+Y
   q2WACpY1muYY+W155jVMNDJ3PlMhbZq6+cMbmTmrpFpqMUKHagFSd7HTR
   yFq35JtVN/mkB7hTZrGXhB1o++JC0pAQN8zJ2Y2uSoMZXvC4Ugd0vJpH5
   Wg1QDbrjIdAE2v3rVPeUZVbLg2DDgFytnab7USei+nvxhpIDarNzFhRmz
   6ziclWzLlZKLn3ZVCyLXEiCwpXTCMXhkNKDdWnWDHB66cntC2/6JO/Ygi
   sypblVKoPCEXESt09p9PF0gLmYw4iHzO9ZPc4ywH21mdHulB4IItkEjrw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371090885"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="371090885"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 18:32:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="939959221"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="939959221"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Nov 2023 18:32:45 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5GZ9-0007CE-1m;
	Tue, 21 Nov 2023 02:32:43 +0000
Date: Tue, 21 Nov 2023 10:32:29 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robertosassu:ima-evm-lsms-v6-devel-v4 20/26]
 security/integrity/ima/ima_main.c:1181:12: warning: no previous prototype
 for function 'init_ima_lsm'
Message-ID: <202311211018.agzm5mHK-lkp@intel.com>
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
commit: 80b2cd5f40c944e0de9fc1840034e825b159fd50 [20/26] ima: Move to LSM infrastructure
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231121/202311211018.agzm5mHK-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311211018.agzm5mHK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211018.agzm5mHK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/integrity/ima/ima_main.c:1181:12: warning: no previous prototype for function 'init_ima_lsm' [-Wmissing-prototypes]
   int __init init_ima_lsm(void)
              ^
   security/integrity/ima/ima_main.c:1181:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __init init_ima_lsm(void)
   ^
   static 
   1 warning generated.


vim +/init_ima_lsm +1181 security/integrity/ima/ima_main.c

  1174	
  1175	/*
  1176	 * Since with the LSM_ORDER_LAST there is no guarantee about the ordering
  1177	 * within the .lsm_info.init section, ensure that IMA hooks are before EVM
  1178	 * ones, by letting the 'integrity' LSM call init_ima_lsm() to initialize the
  1179	 * 'ima' and 'evm' LSMs in this sequence.
  1180	 */
> 1181	int __init init_ima_lsm(void)
  1182	{
  1183		security_add_hooks(ima_hooks, ARRAY_SIZE(ima_hooks), &ima_lsmid);
  1184		return 0;
  1185	}
  1186	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
