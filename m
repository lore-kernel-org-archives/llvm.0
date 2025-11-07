Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527D0299944;
	Fri,  7 Nov 2025 00:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762475677; cv=none; b=LX+w2SDtAfC7EC61FXuWBnqv/EqWC7L6jkxClH8lN/JsrLKbUcLoo/sDiAswJ8cDGC5vhN4uwZu6XzeuaEALknk1zCM0Led+jtTnbMQsoDQLsQbU83+qCwCOyfgvJDCTvR8Akpx5/tumcpkoA2T34mCErJFLEBE4YyfTAn4cHjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762475677; c=relaxed/simple;
	bh=SxsZcUVmYS9fVQ8O8ksqVm2X0A2OOGkEcYkfkaDaLm8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l7TAdmgFoqTvRsuo9EJ1N036+AJD0XzrGCcyEvmFFKgYskyxnm1tfqhEtiZPcJt8bPy2vP5mELXspNHkPBdQZYeDIaNvp3BxI9qzGVhy4ZwdUK2cOnwsnUfSKWFVUt+jtgL+qjBagIyGuDnYLpIxZDdQfd2K6I3Zrr8jbCC39oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SurwLjHw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SurwLjHw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762475675; x=1794011675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SxsZcUVmYS9fVQ8O8ksqVm2X0A2OOGkEcYkfkaDaLm8=;
  b=SurwLjHwGIAFNwWxotyx5xNerDAh/8zVlUAS6AkWjPfLuB/xIfKn9qex
   XbDXgX8cdPH8BoFPN7Ov9d2OhgI5ISGi9Yla7BrlDlYkp2V03B1MFFA4i
   ppxPUqqje2IPS2B0YeiRIc++/rbG6/f7qzeNRUyhqkXRXnYJT3fTtNQux
   QwZRFuiO6r4JsIaNeCMdel1t4dTa3enyVP1RmNxIZ8qIgSt6eqzM2w3Da
   O2QELsOoTS8QokFpve35Y3QKWe65e4HNFodoTFc62PahOu1ETYQo9SWT9
   TBnVeCdcs3p5/Nkhzutj3w9TmHZ8nzqTWkVkPcRvMvI3i0DOFppnwms2b
   g==;
X-CSE-ConnectionGUID: BkAknBEkT1eX4bNVlaustg==
X-CSE-MsgGUID: nO80uCuFRO6xDwuGDrBxow==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="63834109"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="63834109"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 16:34:35 -0800
X-CSE-ConnectionGUID: k9YqiQxBT3OMgY3zl9l0pg==
X-CSE-MsgGUID: ddCyBOvpTzGCyK681S1TsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="187156781"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 06 Nov 2025 16:34:34 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHAQx-000UVU-0j;
	Fri, 07 Nov 2025 00:34:31 +0000
Date: Fri, 7 Nov 2025 08:33:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:override 2/2] kernel/trace/bpf_trace.c:2567:2: error:
 call to undeclared function 'ftrace_partial_regs_fix'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202511070802.KRBV6NYS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git override
head:   6896dcc84fb29329853621bd3850dd3c19cdacd1
commit: 6896dcc84fb29329853621bd3850dd3c19cdacd1 [2/2] fix
config: riscv-randconfig-001-20251107 (https://download.01.org/0day-ci/archive/20251107/202511070802.KRBV6NYS-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251107/202511070802.KRBV6NYS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511070802.KRBV6NYS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/bpf_trace.c:2567:2: error: call to undeclared function 'ftrace_partial_regs_fix'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2567 |         ftrace_partial_regs_fix(fregs, bpf_kprobe_multi_pt_regs_ptr());
         |         ^
   kernel/trace/bpf_trace.c:2567:2: note: did you mean 'ftrace_partial_regs'?
   arch/riscv/include/asm/ftrace.h:210:1: note: 'ftrace_partial_regs' declared here
     210 | ftrace_partial_regs(const struct ftrace_regs *fregs, struct pt_regs *regs)
         | ^
   1 error generated.


vim +/ftrace_partial_regs_fix +2567 kernel/trace/bpf_trace.c

  2531	
  2532	static int
  2533	kprobe_multi_link_prog_run(struct bpf_kprobe_multi_link *link,
  2534				   unsigned long entry_ip, struct ftrace_regs *fregs,
  2535				   bool is_return, void *data)
  2536	{
  2537		struct bpf_kprobe_multi_run_ctx run_ctx = {
  2538			.session_ctx = {
  2539				.is_return = is_return,
  2540				.data = data,
  2541			},
  2542			.link = link,
  2543			.entry_ip = entry_ip,
  2544		};
  2545		struct bpf_run_ctx *old_run_ctx;
  2546		struct pt_regs *regs;
  2547		int err;
  2548	
  2549		/*
  2550		 * graph tracer framework ensures we won't migrate, so there is no need
  2551		 * to use migrate_disable for bpf_prog_run again. The check here just for
  2552		 * __this_cpu_inc_return.
  2553		 */
  2554		cant_sleep();
  2555	
  2556		if (unlikely(__this_cpu_inc_return(bpf_prog_active) != 1)) {
  2557			bpf_prog_inc_misses_counter(link->link.prog);
  2558			err = 1;
  2559			goto out;
  2560		}
  2561	
  2562		rcu_read_lock();
  2563		regs = ftrace_partial_regs(fregs, bpf_kprobe_multi_pt_regs_ptr());
  2564		old_run_ctx = bpf_set_run_ctx(&run_ctx.session_ctx.run_ctx);
  2565		err = bpf_prog_run(link->link.prog, regs);
  2566		bpf_reset_run_ctx(old_run_ctx);
> 2567		ftrace_partial_regs_fix(fregs, bpf_kprobe_multi_pt_regs_ptr());
  2568		rcu_read_unlock();
  2569	
  2570	 out:
  2571		__this_cpu_dec(bpf_prog_active);
  2572		return err;
  2573	}
  2574	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
