Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3D97B
	for <llvm@lists.linux.dev>; Sun, 20 Feb 2022 16:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645372964; x=1676908964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9NwTRpNDu/tHD2XIwBr3TAhromGmgxkpOIaxlQGO8Cw=;
  b=DtudGcMmsz3YdPtnzjrcfmCEI3uN1dhy/v04mmWlo8t6o71IYGDMP0yF
   8MAhKueWmVqscOdpk9W2U0K6dEsdXyoGBNvTa0uYoL2k8zwhiR7+lRktV
   U67F2C0lpW3WcUyezWFQa/iP7WiCSAC7WGSG3kUi1P96b5M77Jn1EZVs3
   9JkqHBDZLDeVA7owEaHYprYUgucdQY2VKRiIYqng9VddqcCRS8Pfj+X2d
   7UJNEtIJI3fJhy5kvSmDs9oZfQG5vTuBAUp+RNoiQzuC9wyt+4PzYMwQL
   EsoqtT90AhPzka5PWzFU9CuhfgrpsK43oVyp4MKhedAmuKWtp71JZy6JW
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10264"; a="231353986"
X-IronPort-AV: E=Sophos;i="5.88,383,1635231600"; 
   d="scan'208";a="231353986"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2022 08:02:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,383,1635231600"; 
   d="scan'208";a="682973476"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Feb 2022 08:02:42 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nLofZ-0000RQ-GN; Sun, 20 Feb 2022 16:02:41 +0000
Date: Mon, 21 Feb 2022 00:02:29 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [peterz-queue:x86/wip.ibt 19/31]
 arch/x86/kernel/alternative.c:761:16: error: expected string literal in
 'asm'
Message-ID: <202202202357.ldfBr75W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/wip.ibt
head:   fecdb8a84191710ffe01c9492fceb34a15f1576a
commit: 97e04204b3c4f0515f956be22a19229878b9253e [19/31] x86/ibt: Annotate text references
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220220/202202202357.ldfBr75W-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=97e04204b3c4f0515f956be22a19229878b9253e
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/wip.ibt
        git checkout 97e04204b3c4f0515f956be22a19229878b9253e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/x86/kernel/alternative.c:716:2: error: expected ')'
           ANNOTATE_NOENDBR
           ^
   arch/x86/kernel/alternative.c:712:5: note: to match this '('
   asm (
       ^
>> arch/x86/kernel/alternative.c:761:16: error: expected string literal in 'asm'
           asm volatile (ANNOTATE_NOENDBR
                         ^
   2 errors generated.


vim +/asm +761 arch/x86/kernel/alternative.c

   743	
   744	static void __init int3_selftest(void)
   745	{
   746		static __initdata struct notifier_block int3_exception_nb = {
   747			.notifier_call	= int3_exception_notify,
   748			.priority	= INT_MAX-1, /* last */
   749		};
   750		unsigned int val = 0;
   751	
   752		BUG_ON(register_die_notifier(&int3_exception_nb));
   753	
   754		/*
   755		 * Basically: int3_magic(&val); but really complicated :-)
   756		 *
   757		 * Stick the address of the INT3 instruction into int3_selftest_ip,
   758		 * then trigger the INT3, padded with NOPs to match a CALL instruction
   759		 * length.
   760		 */
 > 761		asm volatile (ANNOTATE_NOENDBR
   762			      "1: int3; nop; nop; nop; nop\n\t"
   763			      ".pushsection .init.data,\"aw\"\n\t"
   764			      ".align " __ASM_SEL(4, 8) "\n\t"
   765			      ".type int3_selftest_ip, @object\n\t"
   766			      ".size int3_selftest_ip, " __ASM_SEL(4, 8) "\n\t"
   767			      "int3_selftest_ip:\n\t"
   768			      __ASM_SEL(.long, .quad) " 1b\n\t"
   769			      ".popsection\n\t"
   770			      : ASM_CALL_CONSTRAINT
   771			      : __ASM_SEL_RAW(a, D) (&val)
   772			      : "memory");
   773	
   774		BUG_ON(val != 1);
   775	
   776		unregister_die_notifier(&int3_exception_nb);
   777	}
   778	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
