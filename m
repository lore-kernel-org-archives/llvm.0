Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4C5AD53;
	Fri,  1 Sep 2023 21:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693605480; x=1725141480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z6bf84tzbrLsDM0RPZJX0e6E8kQdELx/DmLBhSM7FtU=;
  b=knvctWNtNwflkhHY9Pijkj/aGrhZhoz8L7yx1ZZN6Ek/qm+N2KbNY9aY
   f5RSeAFL8UwDSN9vzzOUvPtc8Boogog+GO+oTNau4l5urJ9KZBZLMO675
   7oaEKpSqy2t5hKk3OKCte0emQWOVJAJVjR3TmtUYsN700QlmAGRYVaVZQ
   JZtfT4WGOkg6URu/mvRaJfSx3xV+9exllrdwZ38ECIb5JmWUZLwf4x3GO
   SEWXfoiI12LL9hSoymbVmVwM8E6eSoxA4ZlbqWjkQjca7sSk8mEhOTjxT
   NxvzJbghbP9fAEK9Gyjmh7GZ6mvdl1roPN1TXtt8ToFdy8jR3TcFTzrKt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="376246086"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="376246086"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 14:57:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070886471"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="1070886471"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Sep 2023 14:57:56 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcC9K-0001g5-0P;
	Fri, 01 Sep 2023 21:57:54 +0000
Date: Sat, 2 Sep 2023 05:57:17 +0800
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [linux-next:master 13230/13643]
 arch/riscv/errata/andes/errata.c:46:14: warning: result of comparison of
 constant 9223372036854811205 with expression of type 'unsigned long' is
 always true
Message-ID: <202309020548.rbrIJu6S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a47fc304d2b678db1a5d760a7d644dac9b067752
commit: f2863f30d1b05e5ecf61c063609cb974954d47f8 [13230/13643] riscv: errata: Add Andes alternative ports
config: riscv-randconfig-r015-20230902 (https://download.01.org/0day-ci/archive/20230902/202309020548.rbrIJu6S-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309020548.rbrIJu6S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309020548.rbrIJu6S-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/errata/andes/errata.c:29:16: error: variable has incomplete type 'struct sbiret'
      29 |         struct sbiret ret;
         |                       ^
   arch/riscv/errata/andes/errata.c:29:9: note: forward declaration of 'struct sbiret'
      29 |         struct sbiret ret;
         |                ^
   arch/riscv/errata/andes/errata.c:35:8: error: call to undeclared function 'sbi_ecall'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      35 |         ret = sbi_ecall(ANDESTECH_SBI_EXT_ANDES, ANDES_SBI_EXT_IOCP_SW_WORKAROUND,
         |               ^
>> arch/riscv/errata/andes/errata.c:46:14: warning: result of comparison of constant 9223372036854811205 with expression of type 'unsigned long' is always true [-Wtautological-constant-out-of-range-compare]
      46 |         if (arch_id != ANDESTECH_AX45MP_MARCHID || impid != ANDESTECH_AX45MP_MIMPID)
         |             ~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +46 arch/riscv/errata/andes/errata.c

    40	
    41	static bool errata_probe_iocp(unsigned int stage, unsigned long arch_id, unsigned long impid)
    42	{
    43		if (!IS_ENABLED(CONFIG_ERRATA_ANDES_CMO))
    44			return false;
    45	
  > 46		if (arch_id != ANDESTECH_AX45MP_MARCHID || impid != ANDESTECH_AX45MP_MIMPID)
    47			return false;
    48	
    49		if (!ax45mp_iocp_sw_workaround())
    50			return false;
    51	
    52		/* Set this just to make core cbo code happy */
    53		riscv_cbom_block_size = 1;
    54		riscv_noncoherent_supported();
    55	
    56		return true;
    57	}
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
