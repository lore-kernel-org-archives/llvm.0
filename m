Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0011FA0;
	Sat,  5 Aug 2023 18:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691258935; x=1722794935;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SlIWjz5NxHrgtMwRNUVUa4FFSQMpSktfbAOtU0tYsqo=;
  b=QdozlGgfr3zXf8Vp4MhCagB1I+Lf9yERp0BvNQm4kzptSBIFxlUwPhok
   8iFg+cTRzykZpB61K5kSMoakHuO3Bhv/wlswA3xjhq1bw+3eEHWaUiQ6Y
   yqQoOxdY3hGAmL6GxKEIoRFkBoEBOvUd0wOyPKWEolbhXSi8ntHdyNzjM
   T0Gq+PEzk9cgtfqSWlauWm3J4JJl0vQ6HOS6xE5oQjC/Ij5xE2y2afQXp
   2jtcm230YkDJgave4Y5Abgs8brFVe3LnDyfm+k/P5KD4Lwh58y2Jd6fv6
   4r+PNErPj30mTcmc5jKrma+IsVjxkGTBi0NlR3iQchETe/LmYJBbjadkO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="349920742"
X-IronPort-AV: E=Sophos;i="6.01,258,1684825200"; 
   d="scan'208";a="349920742"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 11:08:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="854158159"
X-IronPort-AV: E=Sophos;i="6.01,258,1684825200"; 
   d="scan'208";a="854158159"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Aug 2023 11:08:45 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSLhk-0003om-2m;
	Sat, 05 Aug 2023 18:08:44 +0000
Date: Sun, 6 Aug 2023 02:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/5] fprobe: rethook: Use fprobe_regs in fprobe exit
 handler and rethook
Message-ID: <202308060258.tcSDAfJA-lkp@intel.com>
References: <169124749229.186149.1426658495303367593.stgit@devnote2>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169124749229.186149.1426658495303367593.stgit@devnote2>

Hi Masami,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]
[also build test ERROR on bpf/master tip/x86/core linus/master v6.5-rc4 next-20230804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masami-Hiramatsu-Google/fprobe-Use-fprobe_regs-in-fprobe-entry-handler/20230805-230025
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/169124749229.186149.1426658495303367593.stgit%40devnote2
patch subject: [RFC PATCH 2/5] fprobe: rethook: Use fprobe_regs in fprobe exit handler and rethook
config: i386-randconfig-r014-20230805 (https://download.01.org/0day-ci/archive/20230806/202308060258.tcSDAfJA-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230806/202308060258.tcSDAfJA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308060258.tcSDAfJA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/kprobes.c:2146:25: error: call to undeclared function 'ftrace_get_regs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct pt_regs *regs = ftrace_get_regs(fregs);
                                  ^
>> kernel/kprobes.c:2146:18: error: incompatible integer to pointer conversion initializing 'struct pt_regs *' with an expression of type 'int' [-Wint-conversion]
           struct pt_regs *regs = ftrace_get_regs(fregs);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> arch/x86/kernel/rethook.c:111:25: error: call to undeclared function 'ftrace_get_regs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct pt_regs *regs = ftrace_get_regs(fregs);
                                  ^
>> arch/x86/kernel/rethook.c:111:18: error: incompatible integer to pointer conversion initializing 'struct pt_regs *' with an expression of type 'int' [-Wint-conversion]
           struct pt_regs *regs = ftrace_get_regs(fregs);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/rethook.c:121:25: error: call to undeclared function 'ftrace_get_regs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct pt_regs *regs = ftrace_get_regs(fregs);
                                  ^
   arch/x86/kernel/rethook.c:121:18: error: incompatible integer to pointer conversion initializing 'struct pt_regs *' with an expression of type 'int' [-Wint-conversion]
           struct pt_regs *regs = ftrace_get_regs(fregs);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.
--
>> kernel/trace/rethook.c:298:2: error: call to undeclared function 'ftrace_regs_set_instruction_pointer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ftrace_regs_set_instruction_pointer(fregs, correct_ret_addr);
           ^
   1 error generated.


vim +/ftrace_get_regs +2146 kernel/kprobes.c

  2140	
  2141	static void kretprobe_rethook_handler(struct rethook_node *rh, void *data,
  2142					      unsigned long ret_addr,
  2143					      struct ftrace_regs *fregs)
  2144	{
  2145		struct kretprobe *rp = (struct kretprobe *)data;
> 2146		struct pt_regs *regs = ftrace_get_regs(fregs);
  2147		struct kretprobe_instance *ri;
  2148		struct kprobe_ctlblk *kcb;
  2149	
  2150		/* This is bug because this depends on HAVE_PT_REGS_COMPAT_FTRACE_REGS */
  2151		if (WARN_ON_ONCE(!regs))
  2152			return;
  2153	
  2154		/* The data must NOT be null. This means rethook data structure is broken. */
  2155		if (WARN_ON_ONCE(!data) || !rp->handler)
  2156			return;
  2157	
  2158		__this_cpu_write(current_kprobe, &rp->kp);
  2159		kcb = get_kprobe_ctlblk();
  2160		kcb->kprobe_status = KPROBE_HIT_ACTIVE;
  2161	
  2162		ri = container_of(rh, struct kretprobe_instance, node);
  2163		rp->handler(ri, regs);
  2164	
  2165		__this_cpu_write(current_kprobe, NULL);
  2166	}
  2167	NOKPROBE_SYMBOL(kretprobe_rethook_handler);
  2168	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
