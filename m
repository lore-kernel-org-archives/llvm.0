Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8DD168
	for <llvm@lists.linux.dev>; Mon, 27 Dec 2021 18:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640629174; x=1672165174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rxr3TkxmMtTGd+6XnuBidibJcM2pGrMRnCs9BwlaB08=;
  b=I8uq4Xza3LK6UBvaGEcH3wXokNO6bU33i0Qd+3vTo0CAKCRI+eJi88C7
   RCdS3uzcyKXrQu0TDbHYoadUW9JUiUBgDWHSTWWkwYm+86DHbb00i2St0
   SzfTFPDF672ezpTU8a9RfGnnV180jWsTIJhLM/bmyPWvi9W39sOEEnLrm
   fOv8WH3keoX3WceUs6TnHpBtCC2Inb1IJgDbAuLQXB1DeIzR5/9Cu+Vg4
   VGc1FsAVq+Tdb3pLEPBLcLYBZLt8GmIbcrXIstYOzyx6XuXHt5rQXFmb1
   zc5XEBFHd9TCW8MFS3lefvo1IrM7xljWVkWFC7nfASW7XwEa/SuiG2OM1
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10210"; a="241205528"
X-IronPort-AV: E=Sophos;i="5.88,240,1635231600"; 
   d="scan'208";a="241205528"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2021 10:19:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,240,1635231600"; 
   d="scan'208";a="686363041"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Dec 2021 10:19:32 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n1uaq-0006gD-6W; Mon, 27 Dec 2021 18:19:32 +0000
Date: Tue, 28 Dec 2021 02:18:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jolsa-perf:kprobe/multi 4/13] include/linux/kprobes.h:76:21: error:
 field has incomplete type 'struct ftrace_ops'
Message-ID: <202112280215.yJhYdrvd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git kprobe/multi
head:   bc59262730d5cfc95d6cae84f247d2e8690a309b
commit: 9ea9f7bc2b16659a9932cc80aed62216856c111e [4/13] kprobe: Add support to register multiple ftrace kprobes
config: arm64-randconfig-r033-20211227 (https://download.01.org/0day-ci/archive/20211228/202112280215.yJhYdrvd-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 511726c64d3b6cca66f7c54d457d586aa3129f67)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=9ea9f7bc2b16659a9932cc80aed62216856c111e
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf kprobe/multi
        git checkout 9ea9f7bc2b16659a9932cc80aed62216856c111e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:15:
   In file included from include/linux/kvm_host.h:39:
   In file included from arch/arm64/include/asm/kvm_host.h:21:
   In file included from arch/arm64/include/asm/arch_gicv3.h:17:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
>> include/linux/kprobes.h:76:21: error: field has incomplete type 'struct ftrace_ops'
                   struct ftrace_ops ops;
                                     ^
   include/linux/ftrace.h:332:8: note: forward declaration of 'struct ftrace_ops'
   struct ftrace_ops;
          ^
   1 error generated.
   make[2]: *** [scripts/Makefile.build:121: arch/arm64/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1197: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +76 include/linux/kprobes.h

    48	
    49	struct kprobe;
    50	struct pt_regs;
    51	struct kretprobe;
    52	struct kretprobe_instance;
    53	typedef int (*kprobe_pre_handler_t) (struct kprobe *, struct pt_regs *);
    54	typedef void (*kprobe_post_handler_t) (struct kprobe *, struct pt_regs *,
    55					       unsigned long flags);
    56	typedef int (*kretprobe_handler_t) (struct kretprobe_instance *,
    57					    struct pt_regs *);
    58	
    59	struct kprobe {
    60		struct hlist_node hlist;
    61	
    62		/* list of kprobes for multi-handler support */
    63		struct list_head list;
    64	
    65		/*count the number of times this probe was temporarily disarmed */
    66		unsigned long nmissed;
    67	
    68		/* location of the probe point */
    69		kprobe_opcode_t *addr;
    70	
    71		/* location of the multi probe points */
    72		struct {
    73			const char **symbols;
    74			kprobe_opcode_t **addrs;
    75			unsigned int cnt;
  > 76			struct ftrace_ops ops;
    77		} multi;
    78	
    79		/* Allow user to indicate symbol name of the probe point */
    80		const char *symbol_name;
    81	
    82		/* Offset into the symbol */
    83		unsigned int offset;
    84	
    85		/* traced function address */
    86		unsigned long func_addr;
    87	
    88		/* Called before addr is executed. */
    89		kprobe_pre_handler_t pre_handler;
    90	
    91		/* Called after addr is executed, unless... */
    92		kprobe_post_handler_t post_handler;
    93	
    94		/* Saved opcode (which has been replaced with breakpoint) */
    95		kprobe_opcode_t opcode;
    96	
    97		/* copy of the original instruction */
    98		struct arch_specific_insn ainsn;
    99	
   100		/*
   101		 * Indicates various status flags.
   102		 * Protected by kprobe_mutex after this kprobe is registered.
   103		 */
   104		u32 flags;
   105	};
   106	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
