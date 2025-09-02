Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CF22E9722;
	Tue,  2 Sep 2025 08:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756803543; cv=none; b=hKCtHLqvx5PAIFPYHxF+7XJ3On842B5sRFbdF3sbVrK86f6hcvoH1WcxCi2ZL4OuE8XMJkUum/9cGu7lhvubBcPd+GkdROioB79ZpgYt3j0PW1fa5tYcRyjdCaMjcy0Eo/oZc/hh/91abwrUyKqhzgdOlu/WM1CLYjw++3nM9d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756803543; c=relaxed/simple;
	bh=E0tJv1YsWxC8JRlCadqElwsXjyR2XL0S1r1hIWl35dU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sj5HD1MnEUGwSKGNKJZuRx4qgO7jpu+ITsGM6ioUvF1e9NiCsp2bP/WPni0hfrtQAXkeqtMx7pkRPKsjsHXiGlvZeJEJRBi55GGLf2tjdZiKgcU3X8mSLZCEHSVUeXF7wUwY0IZdvyraqe5eI6bHphq2y5Pqdir5ucRgIzu6bVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BTISIS2Z; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BTISIS2Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756803542; x=1788339542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E0tJv1YsWxC8JRlCadqElwsXjyR2XL0S1r1hIWl35dU=;
  b=BTISIS2ZbbxQ5SHwWP5Oe8//kGxw/8ZBtrKOjS3n9tQr7bMPgGh/Q390
   +ABcc4m3EVz+adNaxH35PyqR1ZOkqEw4wD+rFH0RrbZTdrZcQGWMRURh0
   nRgKNc3c0naUCvHbYSYVQl0DFZPcBKOH1CqvTS8v7NWSLhos3SagMfI1n
   DKwXisbPtIc1aKQYb7+VRIyz2uXucYQICPiQ+Gyp75dJvAoh7hh7knFbs
   +IWLkj9DHo7cIiFFT4Hus4+htOSv8MfLur+n7VHVjCGvclXAS1z+4ivTp
   t0+q3U6pXek6Xug8ooqtAIGuiMwh6Azg/sJ0SabZNGGYGXsxHnove9hxR
   Q==;
X-CSE-ConnectionGUID: /F3ffH1FQGKGngO0wDvk9Q==
X-CSE-MsgGUID: 0fgwrslOT0GwjcFTtEnsig==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="61707143"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="61707143"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 01:59:01 -0700
X-CSE-ConnectionGUID: xMcQEUUqTuWOAHiq6Zo+fw==
X-CSE-MsgGUID: 1Z8J2cGCQ0u6v+9E5LpJQQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 02 Sep 2025 01:59:00 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utMqw-0001j1-0n;
	Tue, 02 Sep 2025 08:58:58 +0000
Date: Tue, 2 Sep 2025 16:58:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/6] tracing: wprobe: Add watchpoint probe event
 based on hardware breakpoint
Message-ID: <202509021603.hCevXAL5-lkp@intel.com>
References: <175673788575.478080.17611922836391707019.stgit@devnote2>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175673788575.478080.17611922836391707019.stgit@devnote2>

Hi Masami,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on trace/for-next]
[also build test ERROR on tip/x86/core perf-tools-next/perf-tools-next tip/perf/core perf-tools/perf-tools peterz-queue/sched/core linus/master v6.17-rc4 next-20250902]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masami-Hiramatsu-Google/tracing-wprobe-Add-watchpoint-probe-event-based-on-hardware-breakpoint/20250901-225207
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/175673788575.478080.17611922836391707019.stgit%40devnote2
patch subject: [RFC PATCH 1/6] tracing: wprobe: Add watchpoint probe event based on hardware breakpoint
config: i386-buildonly-randconfig-001-20250902 (https://download.01.org/0day-ci/archive/20250902/202509021603.hCevXAL5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021603.hCevXAL5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509021603.hCevXAL5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace_wprobe.c:562:20: error: use of undeclared identifier '__free_trace_probe_log_clear'; did you mean 'trace_probe_log_clear'?
     562 |         const char *tplog __free(trace_probe_log_clear) = NULL;
         |                           ^
   include/linux/cleanup.h:213:33: note: expanded from macro '__free'
     213 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:55:1: note: expanded from here
      55 | __free_trace_probe_log_clear
         | ^
   kernel/trace/trace_probe.h:584:6: note: 'trace_probe_log_clear' declared here
     584 | void trace_probe_log_clear(void);
         |      ^
>> kernel/trace/trace_wprobe.c:562:20: error: 'cleanup' function 'trace_probe_log_clear' must take 1 parameter
     562 |         const char *tplog __free(trace_probe_log_clear) = NULL;
         |                           ^
   include/linux/cleanup.h:213:33: note: expanded from macro '__free'
     213 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:55:1: note: expanded from here
      55 | __free_trace_probe_log_clear
         | ^
>> kernel/trace/trace_wprobe.c:574:8: error: assigning to 'const char *' from incompatible type 'void'
     574 |         tplog = trace_probe_log_init("wprobe", argc, argv);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +562 kernel/trace/trace_wprobe.c

   549	
   550	static int __trace_wprobe_create(int argc, const char *argv[])
   551	{
   552		/*
   553		 * Argument syntax:
   554		 *  b[:[GRP/][EVENT]] SPEC
   555		 *
   556		 * SPEC:
   557		 *  [r|w|rw]@[ADDR|SYMBOL[+OFFS]][:LEN]
   558		 */
   559		struct traceprobe_parse_context *ctx __free(traceprobe_parse_context) = NULL;
   560		struct trace_wprobe *tw __free(free_trace_wprobe) = NULL;
   561		const char *event = NULL, *group = WPROBE_EVENT_SYSTEM;
 > 562		const char *tplog __free(trace_probe_log_clear) = NULL;
   563		char *symbol = NULL;
   564		unsigned long addr;
   565		int len, type, i;
   566		int ret = 0;
   567	
   568		if (argv[0][0] != 'w')
   569			return -ECANCELED;
   570	
   571		if (argc < 2)
   572			return -EINVAL;
   573	
 > 574		tplog = trace_probe_log_init("wprobe", argc, argv);
   575	
   576		if (argv[0][1] != '\0') {
   577			if (argv[0][1] != ':') {
   578				trace_probe_log_set_index(0);
   579				trace_probe_log_err(1, BAD_MAXACT_TYPE);
   580				/* Invalid format */
   581				return -EINVAL;
   582			}
   583			event = &argv[0][2];
   584		}
   585	
   586		trace_probe_log_set_index(1);
   587		ret = parse_address_spec(argv[1], &addr, &type, &len, &symbol);
   588		if (ret < 0)
   589			return ret;
   590	
   591		if (!event)
   592			event = symbol ? symbol : "wprobe";
   593	
   594		argc -= 2; argv += 2;
   595		tw = alloc_trace_wprobe(group, event, symbol, addr, len, type, argc);
   596		if (IS_ERR(tw))
   597			return PTR_ERR(tw);
   598	
   599		ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
   600		if (!ctx)
   601			return -ENOMEM;
   602	
   603		ctx->flags = TPARG_FL_KERNEL | TPARG_FL_WPROBE;
   604	
   605		/* parse arguments */
   606		for (i = 0; i < argc; i++) {
   607			trace_probe_log_set_index(i + 2);
   608			ctx->offset = 0;
   609			ret = traceprobe_parse_probe_arg(&tw->tp, i, argv[i], ctx);
   610			if (ret)
   611				return ret;	/* This can be -ENOMEM */
   612		}
   613	
   614		ret = traceprobe_set_print_fmt(&tw->tp, PROBE_PRINT_NORMAL);
   615		if (ret < 0)
   616			return ret;
   617	
   618		ret = register_trace_wprobe_event(tw);
   619		if (!ret)
   620			tw = NULL; /* To avoid free */
   621	
   622		return ret;
   623	}
   624	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
