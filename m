Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7CD48D0
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 13:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646747247; x=1678283247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=acAPgLMnth5IGuQnibPrNHXDwjpfPkwqpcYPxc9EvbU=;
  b=jlTFG2wrtzlBBP4nuKu++839k9T9o/Em0SptlJw62Di0rFEBUb5yoHR5
   GlpOaWCiAuODWYV2Da0iXrv9mkCiZg+QmGbjJEWZ5+8qx/+ABm0kaGOWQ
   XTbO8eOLOJroN6eayk6hEl3gaEcj/s+OKnyzRXuL6XSEG9yq8S6hH8YtE
   MrWkk6YWWN6cFDafjlo7uZZVZOdOxFwm2oC307Mac2TThMpVdzUT3+6uc
   YuPFNHVyG/0L0cpS+04hUuMapk3rgSsH4OBeIpWQVPUj9GkNAcqnck68k
   X0ZXx+Mmj2CmMTJsgR6kltdT1AVyAeSPMqQbPaVTXTMUK0zzn0Q++C4rF
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="279398124"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="279398124"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 05:47:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="687922652"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 08 Mar 2022 05:47:25 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nRaBQ-0001U6-I2; Tue, 08 Mar 2022 13:47:24 +0000
Date: Tue, 8 Mar 2022 21:46:32 +0800
From: kernel test robot <lkp@intel.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 5498/11353] arch/arm64/kernel/elfcore.c:25:12:
 warning: stack frame size (2160) exceeds limit (2048) in
 'mte_dump_tag_range'
Message-ID: <202203082106.zo0jBw7M-lkp@intel.com>
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
head:   cb153b68ff91cbc434f3de70ac549e110543e1bb
commit: 6dd8b1a0b6cb3ed93d24110e02e67ff9d006610a [5498/11353] arm64: mte: Dump the MTE tags in the core file
config: arm64-buildonly-randconfig-r001-20220308 (https://download.01.org/0day-ci/archive/20220308/202203082106.zo0jBw7M-lkp@intel.com/config)
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

>> arch/arm64/kernel/elfcore.c:25:12: warning: stack frame size (2160) exceeds limit (2048) in 'mte_dump_tag_range' [-Wframe-larger-than]
   static int mte_dump_tag_range(struct coredump_params *cprm,
              ^
   1 warning generated.


vim +/mte_dump_tag_range +25 arch/arm64/kernel/elfcore.c

    23	
    24	/* Derived from dump_user_range(); start/end must be page-aligned */
  > 25	static int mte_dump_tag_range(struct coredump_params *cprm,
    26				      unsigned long start, unsigned long end)
    27	{
    28		unsigned long addr;
    29	
    30		for (addr = start; addr < end; addr += PAGE_SIZE) {
    31			char tags[MTE_PAGE_TAG_STORAGE];
    32			struct page *page = get_dump_page(addr);
    33	
    34			/*
    35			 * get_dump_page() returns NULL when encountering an empty
    36			 * page table entry that would otherwise have been filled with
    37			 * the zero page. Skip the equivalent tag dump which would
    38			 * have been all zeros.
    39			 */
    40			if (!page) {
    41				dump_skip(cprm, MTE_PAGE_TAG_STORAGE);
    42				continue;
    43			}
    44	
    45			/*
    46			 * Pages mapped in user space as !pte_access_permitted() (e.g.
    47			 * PROT_EXEC only) may not have the PG_mte_tagged flag set.
    48			 */
    49			if (!test_bit(PG_mte_tagged, &page->flags)) {
    50				put_page(page);
    51				dump_skip(cprm, MTE_PAGE_TAG_STORAGE);
    52				continue;
    53			}
    54	
    55			mte_save_page_tags(page_address(page), tags);
    56			put_page(page);
    57			if (!dump_emit(cprm, tags, MTE_PAGE_TAG_STORAGE))
    58				return 0;
    59		}
    60	
    61		return 1;
    62	}
    63	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
