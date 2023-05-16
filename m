Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202962592;
	Tue, 16 May 2023 03:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684208154; x=1715744154;
  h=date:from:cc:subject:message-id:mime-version;
  bh=uarTqdJ9giU/fOzwDBGhop77AI5xRb+/RDisRhA2s34=;
  b=B5cWkP4SyJ+baRkNFaGRZQoc7M/S/ekdLrq+bhVqAqN6mGqURzsCxCsd
   pkdpp0kR4FMvn75QeRI+ZY6eCBUYV1afwrxe2EAfDLr6JW+GY8N9GxOew
   7lHRnBt0P7Yv/aMqvQXL2MsT0nZse6Fw77rzSQbGEXyHiLT80JB+tyTao
   O6Vcn8j6EoVYKJqjcuM0cMvNOaXine6k/lIE4v1cxwQ68h2uhAqN2iP5v
   1KRh77PR2LlYUh/CdR9HTGn91wKU0MPjXbdvXSbqzaGc7WLtptIuRqeWG
   QjpAhMAX9ewFfoN6e4Yay+C5eenMmtBz4o0MpOIAuJhuew3RykXjY+WUM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="353647692"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="353647692"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 20:35:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="875457693"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="875457693"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 May 2023 20:35:51 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pylTb-0006w2-0G;
	Tue, 16 May 2023 03:35:51 +0000
Date: Tue, 16 May 2023 11:34:52 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [yiliu1765-iommufd:iommufd_nesting 37/58] vmlinux.o: warning:
 objtool: iommufd_hwpt_alloc() falls through to next function kzalloc()
Message-ID: <202305161134.vRI6PuRU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Yi Liu <yi.l.liu@intel.com>
TO: Kevin Tian <kevin.tian@intel.com>

tree:   https://github.com/yiliu1765/iommufd.git iommufd_nesting
head:   f622ef158993b1eb820dbb678c3f41c81310f964
commit: bf07e66eae5960f4b56d78eb98b69dbfcd76ea35 [37/58] iommu/vt-d: Add nested domain allocation
config: x86_64-randconfig-x086-20230515 (https://download.01.org/0day-ci/archive/20230516/202305161134.vRI6PuRU-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/yiliu1765/iommufd/commit/bf07e66eae5960f4b56d78eb98b69dbfcd76ea35
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd iommufd_nesting
        git checkout bf07e66eae5960f4b56d78eb98b69dbfcd76ea35
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305161134.vRI6PuRU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ibt_selftest+0x14: sibling call from callable instruction with modified stack frame
>> vmlinux.o: warning: objtool: iommufd_hwpt_alloc() falls through to next function kzalloc()
   vmlinux.o: warning: objtool: ibt_selftest+0x1e: return with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
