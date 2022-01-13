Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241C329CA
	for <llvm@lists.linux.dev>; Thu, 13 Jan 2022 02:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642041032; x=1673577032;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ptGCdNvJC49/MVhbNqWkKdE3f9l58y2Cm+SugWgtOrc=;
  b=XI9rKJWLHuSN4W/Pkg7x19P1v0+KXHOwRoFEUPi5cJg8sdvjdrgencF3
   7mpunVF99Qw/0MvOMs7LfbcXsdw37QBLeU4s6olQbo/hQ3diCOctZjPB8
   nuU8CZBhBTxtvNqW4RolLY0mf5V0lD6T/wcxIEpQgFKgL9Kxx90bR+xQ+
   LBBzk+4/q78/qA4VLr9M4JR1gtPnIjt3B5Fwz63MO6aseiB798/4nrv3d
   0NCIVQmUpJCbLqJ4SEgtf8kEZe/H0aJBD1OrEEOSq7nxO2BbrCNexdDfo
   Gua2doyAIcU104lhxECfm4zZC2YsIHMC/PjY37TD/BD1l3ODrUlhaEpgr
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="223893886"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="223893886"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 18:30:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="475143264"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Jan 2022 18:30:29 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n7psi-0006jv-HS; Thu, 13 Jan 2022 02:30:28 +0000
Date: Thu, 13 Jan 2022 10:29:38 +0800
From: kernel test robot <lkp@intel.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 4/6] fprobe: Add exit_handler support
Message-ID: <202201131009.oKKmEVVq-lkp@intel.com>
References: <164191326189.806991.3684466615191467367.stgit@devnote2>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164191326189.806991.3684466615191467367.stgit@devnote2>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Masami,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on rostedt-trace/for-next]
[also build test WARNING on bpf-next/master bpf/master linus/master v5.16 next-20220112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Masami-Hiramatsu/fprobe-Add-ftrace-based-probe-APIs/20220112-000050
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git for-next
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20220113/202201131009.oKKmEVVq-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/c0e0471b58c3c9122bbff7523f97a363558284eb
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Masami-Hiramatsu/fprobe-Add-ftrace-based-probe-APIs/20220112-000050
        git checkout c0e0471b58c3c9122bbff7523f97a363558284eb
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/rethook.c:14:23: warning: no previous prototype for function 'arch_rethook_trampoline_callback' [-Wmissing-prototypes]
   __used __visible void arch_rethook_trampoline_callback(struct pt_regs *regs)
                         ^
   arch/x86/kernel/rethook.c:14:18: note: declare 'static' if the function is not intended to be used outside of this translation unit
   __used __visible void arch_rethook_trampoline_callback(struct pt_regs *regs)
                    ^
                    static 
   1 warning generated.


vim +/arch_rethook_trampoline_callback +14 arch/x86/kernel/rethook.c

3727c0ee2be25cf Masami Hiramatsu 2022-01-12  10  
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  11  /*
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  12   * Called from arch_rethook_trampoline
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  13   */
3727c0ee2be25cf Masami Hiramatsu 2022-01-12 @14  __used __visible void arch_rethook_trampoline_callback(struct pt_regs *regs)
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  15  {
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  16  	unsigned long *frame_pointer;
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  17  
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  18  	/* fixup registers */
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  19  	regs->cs = __KERNEL_CS;
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  20  #ifdef CONFIG_X86_32
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  21  	regs->gs = 0;
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  22  #endif
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  23  	regs->ip = (unsigned long)&arch_rethook_trampoline;
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  24  	regs->orig_ax = ~0UL;
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  25  	regs->sp += sizeof(long);
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  26  	frame_pointer = &regs->sp + 1;
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  27  
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  28  	/*
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  29  	 * The return address at 'frame_pointer' is recovered by the
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  30  	 * arch_rethook_fixup_return() which called from this
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  31  	 * rethook_trampoline_handler().
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  32  	 */
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  33  	rethook_trampoline_handler(regs, (unsigned long)frame_pointer);
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  34  
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  35  	/*
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  36  	 * Copy FLAGS to 'pt_regs::sp' so that arch_rethook_trapmoline()
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  37  	 * can do RET right after POPF.
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  38  	 */
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  39  	regs->sp = regs->flags;
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  40  }
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  41  NOKPROBE_SYMBOL(arch_rethook_trampoline_callback);
3727c0ee2be25cf Masami Hiramatsu 2022-01-12  42  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
