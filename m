Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8C52D4B6C;
	Tue,  2 Sep 2025 12:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817234; cv=none; b=Sy1e/2ZbDlkzYN39TIQgPTntIrafrkABUTETN+9NGGL2j7WaLf9Nt1HwC6DOqMzVAVACMvaTKr7Udr0n5QjbeyXo3A4edEMrizW2pXcSeGtuVd/rVazkmMuQ5ZV03lJxbUg0A5w7qsC5NnmvsAZzxN4ERjf9hiK8MyXH1o79HlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817234; c=relaxed/simple;
	bh=NEJK4G6YL2LNIJ4N/EQ/2yXbIcRULbZqJJAqf1ZPdb0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Rnk2ZWjcRpwB6I3LD5QCbnQC7mi9y6WgT3n92JlBZ+sf2kDZABGR12ibD0Sf7FBbaNi1XfETVh1g1hJkzdlZvvYMbBUcaHU8oexgSpfwjfgrkUw+M/H8Mmxe+r/afLpWqGpgJ4Ci94e3DAnLOyOoB+5bF8kRJEt+kgIAs8KmAAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+7RInFI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+7RInFI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F18FCC4CEED;
	Tue,  2 Sep 2025 12:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756817232;
	bh=NEJK4G6YL2LNIJ4N/EQ/2yXbIcRULbZqJJAqf1ZPdb0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=H+7RInFIxdyaSnphVnAOK96zKFX3vCsWJHRvbmao97pOt1JXKZF9/4Jkq8ZnKWRpg
	 2MnjTdjMFMMuQxnBasRO9Q2ulxlrWg0SH4vuWzpLXjcnW4tHBi1Gsg0w82gzIGBymB
	 9HCe3o9h+g5+JxwuKLHIt0p+cNgEdNFelJsy8CwsJpPtP9O0IAsHaWMWcY1/2vuLSF
	 yURW0TVzyieyACHWyq420pKtAxqXW40k6hSAvS7NdSjh02pLZUUCudL/dVCOMtbYVp
	 rdLu+29q8ThlUe9YYbNR/mOkEzDEkQMN0NJ+Z+3LQ9OEzXkpaBNYqyUBA9GSIgWWGg
	 pu45ZytYZ4P+g==
Date: Tue, 2 Sep 2025 21:47:10 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/6] tracing: wprobe: Add watchpoint probe event
 based on hardware breakpoint
Message-Id: <20250902214710.f0e5e9cc3293826f86f8f856@kernel.org>
In-Reply-To: <202509021603.hCevXAL5-lkp@intel.com>
References: <175673788575.478080.17611922836391707019.stgit@devnote2>
	<202509021603.hCevXAL5-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 2 Sep 2025 16:58:21 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Masami,
> 
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on trace/for-next]
> [also build test ERROR on tip/x86/core perf-tools-next/perf-tools-next tip/perf/core perf-tools/perf-tools peterz-queue/sched/core linus/master v6.17-rc4 next-20250902]
> [cannot apply to acme/perf/core]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Masami-Hiramatsu-Google/tracing-wprobe-Add-watchpoint-probe-event-based-on-hardware-breakpoint/20250901-225207
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
> patch link:    https://lore.kernel.org/r/175673788575.478080.17611922836391707019.stgit%40devnote2
> patch subject: [RFC PATCH 1/6] tracing: wprobe: Add watchpoint probe event based on hardware breakpoint
> config: i386-buildonly-randconfig-001-20250902 (https://download.01.org/0day-ci/archive/20250902/202509021603.hCevXAL5-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021603.hCevXAL5-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509021603.hCevXAL5-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> kernel/trace/trace_wprobe.c:562:20: error: use of undeclared identifier '__free_trace_probe_log_clear'; did you mean 'trace_probe_log_clear'?
>      562 |         const char *tplog __free(trace_probe_log_clear) = NULL;

Oops, this series is based on probes/for-next, which already merged [1]
which provides this free function. Sorry for confusion.

[1] https://lore.kernel.org/all/175509538609.193596.16646724647358218778.stgit@devnote2/

>          |                           ^
>    include/linux/cleanup.h:213:33: note: expanded from macro '__free'
>      213 | #define __free(_name)   __cleanup(__free_##_name)
>          |                                   ^
>    <scratch space>:55:1: note: expanded from here
>       55 | __free_trace_probe_log_clear
>          | ^
>    kernel/trace/trace_probe.h:584:6: note: 'trace_probe_log_clear' declared here
>      584 | void trace_probe_log_clear(void);
>          |      ^
> >> kernel/trace/trace_wprobe.c:562:20: error: 'cleanup' function 'trace_probe_log_clear' must take 1 parameter
>      562 |         const char *tplog __free(trace_probe_log_clear) = NULL;
>          |                           ^
>    include/linux/cleanup.h:213:33: note: expanded from macro '__free'
>      213 | #define __free(_name)   __cleanup(__free_##_name)
>          |                                   ^
>    <scratch space>:55:1: note: expanded from here
>       55 | __free_trace_probe_log_clear
>          | ^
> >> kernel/trace/trace_wprobe.c:574:8: error: assigning to 'const char *' from incompatible type 'void'
>      574 |         tplog = trace_probe_log_init("wprobe", argc, argv);
>          |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    3 errors generated.
> 
> 
> vim +562 kernel/trace/trace_wprobe.c
> 
>    549	
>    550	static int __trace_wprobe_create(int argc, const char *argv[])
>    551	{
>    552		/*
>    553		 * Argument syntax:
>    554		 *  b[:[GRP/][EVENT]] SPEC
>    555		 *
>    556		 * SPEC:
>    557		 *  [r|w|rw]@[ADDR|SYMBOL[+OFFS]][:LEN]
>    558		 */
>    559		struct traceprobe_parse_context *ctx __free(traceprobe_parse_context) = NULL;
>    560		struct trace_wprobe *tw __free(free_trace_wprobe) = NULL;
>    561		const char *event = NULL, *group = WPROBE_EVENT_SYSTEM;
>  > 562		const char *tplog __free(trace_probe_log_clear) = NULL;
>    563		char *symbol = NULL;
>    564		unsigned long addr;
>    565		int len, type, i;
>    566		int ret = 0;
>    567	
>    568		if (argv[0][0] != 'w')
>    569			return -ECANCELED;
>    570	
>    571		if (argc < 2)
>    572			return -EINVAL;
>    573	
>  > 574		tplog = trace_probe_log_init("wprobe", argc, argv);
>    575	
>    576		if (argv[0][1] != '\0') {
>    577			if (argv[0][1] != ':') {
>    578				trace_probe_log_set_index(0);
>    579				trace_probe_log_err(1, BAD_MAXACT_TYPE);
>    580				/* Invalid format */
>    581				return -EINVAL;
>    582			}
>    583			event = &argv[0][2];
>    584		}
>    585	
>    586		trace_probe_log_set_index(1);
>    587		ret = parse_address_spec(argv[1], &addr, &type, &len, &symbol);
>    588		if (ret < 0)
>    589			return ret;
>    590	
>    591		if (!event)
>    592			event = symbol ? symbol : "wprobe";
>    593	
>    594		argc -= 2; argv += 2;
>    595		tw = alloc_trace_wprobe(group, event, symbol, addr, len, type, argc);
>    596		if (IS_ERR(tw))
>    597			return PTR_ERR(tw);
>    598	
>    599		ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
>    600		if (!ctx)
>    601			return -ENOMEM;
>    602	
>    603		ctx->flags = TPARG_FL_KERNEL | TPARG_FL_WPROBE;
>    604	
>    605		/* parse arguments */
>    606		for (i = 0; i < argc; i++) {
>    607			trace_probe_log_set_index(i + 2);
>    608			ctx->offset = 0;
>    609			ret = traceprobe_parse_probe_arg(&tw->tp, i, argv[i], ctx);
>    610			if (ret)
>    611				return ret;	/* This can be -ENOMEM */
>    612		}
>    613	
>    614		ret = traceprobe_set_print_fmt(&tw->tp, PROBE_PRINT_NORMAL);
>    615		if (ret < 0)
>    616			return ret;
>    617	
>    618		ret = register_trace_wprobe_event(tw);
>    619		if (!ret)
>    620			tw = NULL; /* To avoid free */
>    621	
>    622		return ret;
>    623	}
>    624	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
