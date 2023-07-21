Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BFDDDC2;
	Fri, 21 Jul 2023 23:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689981337; x=1721517337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aZjijblPDutR7ZnXoM0LDa2J8w7txVZ3SUuxfOkRH08=;
  b=U0uDy7E1l8lSVrQANMPpq10jfZd6KJ9haB1sayl9EgR1XMyKhREaF2Xw
   m4SabNltO5o+weNu9f+H9W/A3W6W51mCT2qp0aqLeOciWWpzyDQHgGyDo
   CNvZ6anC/GnFv1wGEgwrJEBiP2p4WQWsGjjIVl2GUhd1vOFVHkmY1a1kw
   b4tJvZkiDmNBztl3UAZfeQbhhXSz1hZ94CXny+1EDT32nZTx0xPno237A
   Vo1u+3nkZYepADgdq2KGq7iCl4KEykA2bGgLjg4O8nIXnJezW3nh8QACQ
   GPszfzj5ypslNkA8x6LWL2uBSVKDIy1Bcc1/D6Z8XNjblP4iXUAyo5tOi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="346737630"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="346737630"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 16:15:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="754654501"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="754654501"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 21 Jul 2023 16:15:29 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMzLM-0007kP-1n;
	Fri, 21 Jul 2023 23:15:28 +0000
Date: Sat, 22 Jul 2023 07:15:20 +0800
From: kernel test robot <lkp@intel.com>
To: Fangrui Song <maskray@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [stable:linux-4.19.y 2317/9999] drivers/scsi/nsp32.c:2444:14:
 warning: explicitly assigning value of variable of type 'unsigned char' to
 itself
Message-ID: <202307220717.aQS4EuXw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fangrui,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   94bffc1044d871e2ec89b2621e9a384355832988
commit: 69c122751164c3c343eea205fd5c3e1d5132f967 [2317/9999] Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang cross compilation
config: mips-randconfig-r031-20230720 (https://download.01.org/0day-ci/archive/20230722/202307220717.aQS4EuXw-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220717.aQS4EuXw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307220717.aQS4EuXw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/nsp32.c:593:17: warning: variable 'execph' set but not used [-Wunused-but-set-variable]
     593 |         unsigned short  execph;
         |                         ^
   drivers/scsi/nsp32.c:1794:7: warning: variable 'new_sgtp' set but not used [-Wunused-but-set-variable]
    1794 |         long new_sgtp;
         |              ^
   drivers/scsi/nsp32.c:2232:20: warning: variable 'synct' set but not used [-Wunused-but-set-variable]
    2232 |         nsp32_sync_table *synct;
         |                           ^
   drivers/scsi/nsp32.c:2236:20: warning: variable 'syncnum' set but not used [-Wunused-but-set-variable]
    2236 |         int               syncnum;
         |                           ^
>> drivers/scsi/nsp32.c:2444:14: warning: explicitly assigning value of variable of type 'unsigned char' to itself [-Wself-assign]
    2444 |         offset      = offset;
         |         ~~~~~~      ^ ~~~~~~
   drivers/scsi/nsp32.c:2849:17: warning: variable 'intrdat' set but not used [-Wunused-but-set-variable]
    2849 |         unsigned short intrdat;
         |                        ^
   drivers/scsi/nsp32.c:2920:11: warning: variable 'val' set but not used [-Wunused-but-set-variable]
    2920 |         int ret, val, i;
         |                  ^
   7 warnings generated.


vim +2444 drivers/scsi/nsp32.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  2430  
^1da177e4c3f41 Linus Torvalds 2005-04-16  2431  
^1da177e4c3f41 Linus Torvalds 2005-04-16  2432  /*
^1da177e4c3f41 Linus Torvalds 2005-04-16  2433   * target <-> initiator use entry number speed
^1da177e4c3f41 Linus Torvalds 2005-04-16  2434   */
^1da177e4c3f41 Linus Torvalds 2005-04-16  2435  static void nsp32_set_sync_entry(nsp32_hw_data *data,
^1da177e4c3f41 Linus Torvalds 2005-04-16  2436  				 nsp32_target  *target,
^1da177e4c3f41 Linus Torvalds 2005-04-16  2437  				 int            entry,
^1da177e4c3f41 Linus Torvalds 2005-04-16  2438  				 unsigned char  offset)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2439  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  2440  	unsigned char period, ackwidth, sample_rate;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2441  
^1da177e4c3f41 Linus Torvalds 2005-04-16  2442  	period      = data->synct[entry].period_num;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2443  	ackwidth    = data->synct[entry].ackwidth;
^1da177e4c3f41 Linus Torvalds 2005-04-16 @2444  	offset      = offset;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2445  	sample_rate = data->synct[entry].sample_rate;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2446  
^1da177e4c3f41 Linus Torvalds 2005-04-16  2447  	target->syncreg    = TO_SYNCREG(period, offset);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2448  	target->ackwidth   = ackwidth;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2449  	target->offset     = offset;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2450  	target->sample_reg = sample_rate | SAMPLING_ENABLE;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2451  
^1da177e4c3f41 Linus Torvalds 2005-04-16  2452  	nsp32_dbg(NSP32_DEBUG_SYNC, "set sync");
^1da177e4c3f41 Linus Torvalds 2005-04-16  2453  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  2454  

:::::: The code at line 2444 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
