Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885A935EEF;
	Tue,  9 Jan 2024 10:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="am1JuW5h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704794939; x=1736330939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JPXZc89KqoRuUtgmDmmzcqTmfoV0XfWp7XW/iX1D6eA=;
  b=am1JuW5htAWlaZDUmP/WtblihrUKYfMvRrNSiXYVoWikT3eRBaaWkj6h
   zj8j7gDURk66NTC8vpS6qRe2rp/qorBVmfnjI49JBFOAvqXd5ynIRbe7j
   E0VMjFECRndB5Gkhyo6VK9B8YQcJnj+pG8XC16AsLDUjml8KhVuSlHDmq
   ytKxI/oGCfBu4Olqzi4rme65g6McNo26QpUrgSIy2SZU93G20seRKBtdv
   a12GO5AupqZIgYppBJwT6GpgS9m+zwRDNGoOu6LE1m4tz017G9cH1wi00
   Vd1oPkMfSclM5D8Atb8tCB3dQva4WreTwJJHhIoQ+Vxtj7GIgR+DbCXDU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="464548957"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="464548957"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 02:08:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="954963818"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="954963818"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 09 Jan 2024 02:08:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rN92V-0005iU-2H;
	Tue, 09 Jan 2024 10:08:55 +0000
Date: Tue, 9 Jan 2024 18:08:52 +0800
From: kernel test robot <lkp@intel.com>
To: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [iwlwifi-next:egrumbac_fixes_6.5 54/69] ld.lld: error: undefined
 symbol: iwl_cfg_gl_a0_fm_a0
Message-ID: <202401091728.rbPqoHhA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git egrumbac_fixes_6.5
head:   9a1b32d1e9cff80526cab2834f9dfd7609d9c627
commit: 38ffad1e8048085517946d1230f7e249b6c0db72 [54/69] MVM_CORE80
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240109/202401091728.rbPqoHhA-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240109/202401091728.rbPqoHhA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401091728.rbPqoHhA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: iwl_cfg_gl_a0_fm_a0
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(iwl_dev_info_table)
--
>> ld.lld: error: undefined symbol: iwl_mvm_mac_testmode_cmd
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(iwl_mvm_hw_ops)
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(iwl_mvm_mld_hw_ops)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
