Received: from mgamail.intel.com (unknown [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E3146B0;
	Mon, 31 Jul 2023 07:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690789686; x=1722325686;
  h=date:from:cc:subject:message-id:mime-version;
  bh=HCvszp3PepRz3FfNrB9mTLBzmFtZs7Y/fWUZs4VAW74=;
  b=d5ZDvVG4Yw+AhjWuL2V0xYi1TbLbTwjlzrJtDjUKXWb6rf9eMJSreqdR
   nv12Cu1uGoPQDNGB1P8im7Ux3oxq54IP3HldhjdKf2iEOWNQYAhv0o8ug
   Yyil6q/NBsV4r4WrHLrs0epUnYowuOdgpjnTHUdQIj86WiZvByPZyYeNl
   wJeidzTsSMkFZiJkVQ5eU4+GEmtkWXd1JMscQRZXqupRhJ5Cl5GKWNwb1
   /OH/hHFo+lasZQ7M1N3tBhFKEuK2enGFBfVfOxfKSiBSiMVL3iyBOGhxa
   ChSzUhzjaEd+1JMGL0Qi2vF+Wjz99mJ6wZ8n/gkdi9LYFLtf+PvOYbrf7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="399895198"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="399895198"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 00:48:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="757863671"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="757863671"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 31 Jul 2023 00:48:03 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQNdL-00050P-0L;
	Mon, 31 Jul 2023 07:48:03 +0000
Date: Mon, 31 Jul 2023 15:47:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [csky-linux:qspinlock_v10 8/11] ld.lld: error:
 vmlinux.a(init/main.o):(function rcu_lock_acquire: .text+0x5fc): relocation
 R_RISCV_HI20 out of range: 524289 is not in [-524288, 524287]; references
 '.Ltmp6'
Message-ID: <202307311545.GcmkuXIC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Guo Ren <guoren@linux.alibaba.com>

tree:   https://github.com/c-sky/csky-linux qspinlock_v10
head:   c6c7aa7ef6b82649e2726b4b1eeb8118c8c889f3
commit: 5c447554aadb75a2636b8b7d1e99bc9ebc6f5377 [8/11] riscv: qspinlock: Introduce combo spinlock
config: riscv-randconfig-r025-20230731 (https://download.01.org/0day-ci/archive/20230731/202307311545.GcmkuXIC-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307311545.GcmkuXIC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307311545.GcmkuXIC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/main.o):(function rcu_lock_acquire: .text+0x5fc): relocation R_RISCV_HI20 out of range: 524289 is not in [-524288, 524287]; references '.Ltmp6'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
