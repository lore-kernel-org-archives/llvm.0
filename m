Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1105E1C27;
	Wed, 23 Aug 2023 04:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692765682; x=1724301682;
  h=date:from:cc:subject:message-id:mime-version;
  bh=msJl5xXtvHr79byCfyCTBqGMYKheWkaPezn66pdsRUg=;
  b=QnVzTBDIjjloU7F6UiPvFkIcY+j+3MyrK/fQl5eM9KxbH2CfF6Vfr15/
   CQKT/f2GA8aHyKcVlK5Gx5JiOeHBXdqe+iEtddptxfCz6UWK20MTpgdM6
   GwYtGzni8E8WzUx6OwRDS8VZwDBVTMYWHiKoq4vOSctpV2WjSgCcYBfQd
   T7R4owhZjON6oo3fETyBYpIo6msWMS+2rHdQ6tfZ2+a366hf0L36Eg5YA
   sXesDWqGw2YZNi2smiEACBBvSQ83fbiGYb/gl3Ei4MOihehEy8VOgiO5u
   TVMXhmLO3zVZF0172jCnkHVGUPS0zyvaEeNZrvBb2VZOeDnB9tOb+Apbz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="460429470"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="460429470"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 21:41:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="739603781"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="739603781"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 22 Aug 2023 21:41:20 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYfgF-0000qq-0w;
	Wed, 23 Aug 2023 04:41:19 +0000
Date: Wed, 23 Aug 2023 12:40:31 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.15.y 601/9999]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.o: warning: objtool:
 dce_i2c_submit_command_sw()+0xa36: unreachable instruction
Message-ID: <202308231252.PC2IPZl5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Borislav Petkov <bp@suse.de>
CC: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   f6f7927ac664ba23447f8dd3c3dfe2f4ee39272f
commit: cc3011cdbe5f834b0e9873b841d1be02be9a1524 [601/9999] x86/retbleed: Add fine grained Kconfig knobs
config: x86_64-randconfig-004-20230822 (https://download.01.org/0day-ci/archive/20230823/202308231252.PC2IPZl5-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308231252.PC2IPZl5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308231252.PC2IPZl5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.o: warning: objtool: dce_i2c_submit_command_sw()+0xa36: unreachable instruction


objdump-func vmlinux.o dce_i2c_submit_command_sw:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
