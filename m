Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5594A188938;
	Thu,  2 Jan 2025 08:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735805350; cv=none; b=qz3mDq1bYFkK7DcbANtlx/rAR88SO5wVSMBO5DXpnwS0wbTy/0rSQtPTV/i194+BrwRkWqHUC0xTo9aWl8kWdgj/2x38jwQFN426mjEmNwbuV02967WVG19LvSjGFI2LRtrheqDYBuz0kE3YFDTTaKz+UKMt6yHoii88YT//+0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735805350; c=relaxed/simple;
	bh=gPc1TO5iNUl8Tnxfxb86TDnelKPsPU0+fLvgn3tnwMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J3sfgCCDV12iaP+TPn7I5PA6M28y1xTkIu5/eIQZ5BNS+rwN/lHnEiK9MfNpf2ML8p7b7F+lOHcpfmo8juAs+3PyuRwi1SRlhYFHeLTcatLjxAc8XQngRcvXRLs9/vIJu24Yo2mVdEyegFNQAeU8gILAlophiXM0mUTIVo6glt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PC05P2U+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PC05P2U+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735805348; x=1767341348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gPc1TO5iNUl8Tnxfxb86TDnelKPsPU0+fLvgn3tnwMM=;
  b=PC05P2U+rzGtitQkSMM54oko/QOcK1JOjFslhLMYspdypOez61kiwoTC
   MrHHRWTkXITdbMTcLIEwsHTyxDHjqW5X+B5Ze4WJnoCvqXunitECQ/hTF
   xQYLrp3d0mx3SSBPoNhKNpIhlRc+a9xfS+ghxok30DbzMgphBFdguPjCB
   WaRjZYOP3HE9nE5Rkrbj6RCEZVQn+kw4383D3FjGbUv6D27xNz9d5v6tb
   c3319vA2+PbdAnP1ysmmho9nZBBwnrQ5S3EQt6f9a4uNuoplY04d7Qx7n
   mTo4ROzKEJMCVuw/NLv6Q8RB4Gt9Yhs3mHGLSbEpoKB3TCKZSUsR57u89
   w==;
X-CSE-ConnectionGUID: dlti36StSuutIriU4yJ5Lw==
X-CSE-MsgGUID: Xjv6vuWSTk294dSE0/DoaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="61409977"
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; 
   d="scan'208";a="61409977"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 00:09:08 -0800
X-CSE-ConnectionGUID: C57j57lPSxaM6HSi/975jw==
X-CSE-MsgGUID: O9QHUNRPRNaVzdflOId0kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105492748"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Jan 2025 00:09:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTGGO-0008KN-0H;
	Thu, 02 Jan 2025 08:09:04 +0000
Date: Thu, 2 Jan 2025 16:08:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Schnelle <svens@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jiri Olsa <jolsa@kernel.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [jolsa-perf:tmp 3/5] kernel/trace/trace_functions_graph.c:139:21:
 error: call to undeclared function 'regs_get_kernel_argument'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202501021647.bsP1IyyD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git tmp
head:   e2a63411ac4e1b7b36da9f4c2245570d92842d2e
commit: bbfdb6f3823d9d8d161544701d6e7f829a984ac3 [3/5] ftrace: Add support for function argument to graph tracer
config: mips-bmips_stb_defconfig (https://download.01.org/0day-ci/archive/20250102/202501021647.bsP1IyyD-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501021647.bsP1IyyD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501021647.bsP1IyyD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace_functions_graph.c:139:21: error: call to undeclared function 'regs_get_kernel_argument'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     139 |                         entry->args[i] = ftrace_regs_get_argument(fregs, i);
         |                                          ^
   include/linux/ftrace_regs.h:22:2: note: expanded from macro 'ftrace_regs_get_argument'
      22 |         regs_get_kernel_argument(&arch_ftrace_regs(fregs)->regs, n)
         |         ^
   kernel/trace/trace_functions_graph.c:139:21: note: did you mean 'regs_get_kernel_stack_nth'?
   include/linux/ftrace_regs.h:22:2: note: expanded from macro 'ftrace_regs_get_argument'
      22 |         regs_get_kernel_argument(&arch_ftrace_regs(fregs)->regs, n)
         |         ^
   arch/mips/include/asm/ptrace.h:112:29: note: 'regs_get_kernel_stack_nth' declared here
     112 | static inline unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs,
         |                             ^
   kernel/trace/trace_functions_graph.c:908:16: warning: variable 'func' set but not used [-Wunused-but-set-variable]
     908 |         unsigned long func;
         |                       ^
   1 warning and 1 error generated.


vim +/regs_get_kernel_argument +139 kernel/trace/trace_functions_graph.c

   114	
   115	static void
   116	print_graph_duration(struct trace_array *tr, unsigned long long duration,
   117			     struct trace_seq *s, u32 flags);
   118	
   119	static int __graph_entry(struct trace_array *tr, struct ftrace_graph_ent *trace,
   120				 unsigned int trace_ctx, struct ftrace_regs *fregs)
   121	{
   122		struct ring_buffer_event *event;
   123		struct trace_buffer *buffer = tr->array_buffer.buffer;
   124		struct ftrace_graph_ent_entry *entry;
   125		int size;
   126	
   127		/* If fregs is defined, add FTRACE_REGS_MAX_ARGS long size words */
   128		size = sizeof(*entry) + (FTRACE_REGS_MAX_ARGS * !!fregs * sizeof(long));
   129	
   130		event = trace_buffer_lock_reserve(buffer, TRACE_GRAPH_ENT, size, trace_ctx);
   131		if (!event)
   132			return 0;
   133	
   134		entry = ring_buffer_event_data(event);
   135		entry->graph_ent = *trace;
   136	
   137		if (fregs) {
   138			for (int i = 0; i < FTRACE_REGS_MAX_ARGS; i++)
 > 139				entry->args[i] = ftrace_regs_get_argument(fregs, i);
   140		}
   141	
   142		trace_buffer_unlock_commit_nostack(buffer, event);
   143	
   144		return 1;
   145	}
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
