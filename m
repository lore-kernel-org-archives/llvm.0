Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAA91FBD
	for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 10:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645786563; x=1677322563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tMoqH+rPR+6XyBiTRdR0Aw8yteOgkImT1eKOrjJWSsw=;
  b=Ngsvq+Q6I9Qve8z/9/YmiYEwtD62SO0dqoKhDHQGYAQKFVLAe2z2lmAG
   BaEkLSdDx9WfRTjuWuHHuIcF1oW4UeKoK0tWHqnFqrYqoNec3qzc7OpD6
   utFiC2ZiQeD33n4BLom9mYy4ocM9ViJvQNncyOmWZVtak3eAkNAweMim5
   Riv7NEsru+EHu1kgKPqj5TeOSVNei5ABHHJrMjOL84LhPSZ8sc5VbAaSl
   cmeQh8X1OFCy/QJaHm4ZsVF1Z5aGo9ervh1x0h0bbWBmm4+LINb6K9EK2
   E4KarlKxoOu99N6zSOBBNfHaydLEkK4kTf+strQGWNZUDZiwAi33tHToV
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="233099925"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; 
   d="scan'208";a="233099925"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2022 02:56:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; 
   d="scan'208";a="592415859"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 25 Feb 2022 02:56:00 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nNYGW-0004DH-9R; Fri, 25 Feb 2022 10:56:00 +0000
Date: Fri, 25 Feb 2022 18:55:52 +0800
From: kernel test robot <lkp@intel.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 5670/8646] arch/arm64/kernel/elfcore.c:110:5:
 warning: stack frame size (2160) exceeds limit (2048) in
 'elf_core_write_extra_data'
Message-ID: <202202251856.h276CacJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   44948bd49d878dad6c9707e34f4a06df73c3a800
commit: 6dd8b1a0b6cb3ed93d24110e02e67ff9d006610a [5670/8646] arm64: mte: Dump the MTE tags in the core file
config: arm64-randconfig-r026-20220225 (https://download.01.org/0day-ci/archive/20220225/202202251856.h276CacJ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6dd8b1a0b6cb3ed93d24110e02e67ff9d006610a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6dd8b1a0b6cb3ed93d24110e02e67ff9d006610a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/elfcore.c:110:5: warning: stack frame size (2160) exceeds limit (2048) in 'elf_core_write_extra_data' [-Wframe-larger-than]
   int elf_core_write_extra_data(struct coredump_params *cprm)
       ^
   1 warning generated.


vim +/elf_core_write_extra_data +110 arch/arm64/kernel/elfcore.c

   109	
 > 110	int elf_core_write_extra_data(struct coredump_params *cprm)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
