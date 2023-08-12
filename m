Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4869F63C9;
	Sat, 12 Aug 2023 12:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691842336; x=1723378336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KVO4hsD/RslKKAku1fAA6oMnkGGznWFu+8b9a6iCYto=;
  b=GT5WQxrfYj+Xv4B1kaVxr73uASO/Pp+Hh1Sw86NmrbcDpG2hm+/wxXvE
   sUz86h/fTJIEXzQ7wr0W7ZKxhzwnb9dq0+15jiu4A0R+QPDeXMLwsTtAO
   luunj/b+fBdkINlJvoe9F4SBF7Zqwyq0oxeIGPbWvdCJs/qQ5V5lfizog
   EdZams+JKbdjeoREyrR/O8XNVxq89vPwQPVOxhiXFgv7b48TgP7W+JW0I
   HQMgIYkX3xQ22c2a0e40MD5k0CEx/o51AjAyF+Ej6HZj/hW9ha68FXh6H
   V8WRk9BDJwI3Q7bbcbQeF7INDPuYnBgEngpXcn3N/39Gosn5IRQ2P87H6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="458193438"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="458193438"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 05:12:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="682814020"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="682814020"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 Aug 2023 05:12:13 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUnTZ-0008ZE-02;
	Sat, 12 Aug 2023 12:12:13 +0000
Date: Sat, 12 Aug 2023 20:12:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-ftrace-regs 4/8]
 arch/riscv/kernel/probes/rethook.h:6:6: error: conflicting types for
 'arch_rethook_prepare'
Message-ID: <202308122010.4qEiutvg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-ftrace-regs
head:   0403b5414401a0aa4ad3baf00cc543dc01608a6b
commit: f8fc919bb672d73f7cfee02b249965933b1adebf [4/8] fprobe: rethook: Use ftrace_regs in fprobe exit handler and rethook
config: riscv-randconfig-r025-20230812 (https://download.01.org/0day-ci/archive/20230812/202308122010.4qEiutvg-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308122010.4qEiutvg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308122010.4qEiutvg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/probes/rethook.c:8:
>> arch/riscv/kernel/probes/rethook.h:6:6: error: conflicting types for 'arch_rethook_prepare'
       6 | void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount);
         |      ^
   include/linux/rethook.h:73:6: note: previous declaration is here
      73 | void arch_rethook_prepare(struct rethook_node *node, struct ftrace_regs *regs, bool mcount);
         |      ^
>> arch/riscv/kernel/probes/rethook.c:13:36: error: incompatible pointer types passing 'struct pt_regs *' to parameter of type 'struct ftrace_regs *' [-Werror,-Wincompatible-pointer-types]
      13 |         return rethook_trampoline_handler(regs, regs->s0);
         |                                           ^~~~
   include/linux/rethook.h:92:62: note: passing argument to parameter 'regs' here
      92 | unsigned long rethook_trampoline_handler(struct ftrace_regs *regs,
         |                                                              ^
>> arch/riscv/kernel/probes/rethook.c:18:6: error: conflicting types for 'arch_rethook_prepare'
      18 | void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount)
         |      ^
   include/linux/rethook.h:73:6: note: previous declaration is here
      73 | void arch_rethook_prepare(struct rethook_node *node, struct ftrace_regs *regs, bool mcount);
         |      ^
   3 errors generated.


vim +/arch_rethook_prepare +6 arch/riscv/kernel/probes/rethook.h

b57c2f12409845 Binglei Wang 2022-10-25  4  
b57c2f12409845 Binglei Wang 2022-10-25  5  unsigned long arch_rethook_trampoline_callback(struct pt_regs *regs);
b57c2f12409845 Binglei Wang 2022-10-25 @6  void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount);
b57c2f12409845 Binglei Wang 2022-10-25  7  

:::::: The code at line 6 was first introduced by commit
:::::: b57c2f124098459a4acc15d5044f87cba31c87f0 riscv: add riscv rethook implementation

:::::: TO: Binglei Wang <l3b2w1@gmail.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
