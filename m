Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8297D21B9D2;
	Sat, 31 Jan 2026 04:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769835590; cv=none; b=iNnP+7WsuAhv2Kn3nAEUJVP0kfwIgM7gbt2AHCEzRkFTFZoD50AWxu9EutJZOLCE9LQAzQ6idO/t3ejp/tc48YPWzBkoCnX5NDeIBSNy4WIbgTKMJIN8TfsMwHbUTp4fO77jcqi5pkozEYWqMZlFQAa2byib4zqEkc9jVNZKZbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769835590; c=relaxed/simple;
	bh=v2F1JgVuufK6gXhn3X6V98ucPa1gw7ZhQmdiNKSHnMI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TycSjvRKSsMuvW1UpNLFhXBXvxjINOZ5feIXLIcDL04bvKEdcClPcHvOn/R8AqoPAyd7+/tw2TaIf1pXzM5BYxApsRcftte/HwlkLY3kGLBV8z4SLfD99nD5lFwZIhIeCM083burXhniRbPCFMSET4SOcYuFA/C5Aj0WpqxsfoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TmKzfQX2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TmKzfQX2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769835588; x=1801371588;
  h=date:from:to:cc:subject:message-id;
  bh=v2F1JgVuufK6gXhn3X6V98ucPa1gw7ZhQmdiNKSHnMI=;
  b=TmKzfQX2V3t2NtGw6DfuOVYAUPhitKwtoj7FJdd9veHGyU8R6yCoEm3L
   yJH9QKbnVD3aFhXcVeGpAjdtcrYtDA+mXPrx86QGXmCQ/355RZJiIm1em
   0nc0gaoFzoL6cHFmoMC/vm5LqgNo1X1tkd3bUfdE1DDq49rz6pqYDQaBo
   k3olRZZY7j/nXKSZeMHQRAHgpJeW2SjGX/o+lYlCk3pUU0MfCvxjAAyQA
   3jer7vGZB1f7JWUfP9WI4RZkgAqmo84fO64LaEQS5i3kG3RukZQ+wPSLX
   6yv1H1q4Hbf8wfoeJUaBmx1AUNCaK4xuy1iHYA/ot1vD6D0Vnn54jqV7s
   Q==;
X-CSE-ConnectionGUID: RFVmAlnIQiyktgc887hN2w==
X-CSE-MsgGUID: so6zxBWYRha4FYCYI0n27Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="70979630"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="70979630"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 20:59:47 -0800
X-CSE-ConnectionGUID: dZ5XAXVySH+GUU6g9AntCw==
X-CSE-MsgGUID: ZuIg/L0SQXmuDHLXIBLkMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="209256031"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Jan 2026 20:59:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm35D-00000000dee-1mqS;
	Sat, 31 Jan 2026 04:59:43 +0000
Date: Sat, 31 Jan 2026 12:59:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_9 6/12]
 include/linux/trace_events.h:834:5: warning: no previous prototype for
 function 'bpf_tracing_multi_attach'
Message-ID: <202601311253.RFAVL9Uf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_9
head:   4a1d38e3df06743886a06b547187aec8023ef27d
commit: 43cf4edef3aa5c2d42fff08ce0a553010aae6a11 [6/12] bpf: Add support to create tracing multi link
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260131/202601311253.RFAVL9Uf-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311253.RFAVL9Uf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311253.RFAVL9Uf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:61:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:96:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:35:
   include/linux/bpf.h:1550:51: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1550 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^
   include/linux/bpf.h:1556:53: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1556 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:61:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:96:
   In file included from include/trace/syscall.h:7:
>> include/linux/trace_events.h:834:5: warning: no previous prototype for function 'bpf_tracing_multi_attach' [-Wmissing-prototypes]
     834 | int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
         |     ^
   include/linux/trace_events.h:834:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     834 | int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
         | ^
         | static 
   3 warnings generated.
--
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:61:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:96:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:35:
   include/linux/bpf.h:1550:51: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1550 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^
   include/linux/bpf.h:1556:53: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1556 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:61:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:96:
   In file included from include/trace/syscall.h:7:
>> include/linux/trace_events.h:834:5: warning: no previous prototype for function 'bpf_tracing_multi_attach' [-Wmissing-prototypes]
     834 | int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
         |     ^
   include/linux/trace_events.h:834:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     834 | int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
         | ^
         | static 
   3 warnings generated.


vim +/bpf_tracing_multi_attach +834 include/linux/trace_events.h

   795	
   796	static inline int
   797	perf_event_query_prog_array(struct perf_event *event, void __user *info)
   798	{
   799		return -EOPNOTSUPP;
   800	}
   801	struct bpf_raw_tp_link;
   802	static inline int bpf_probe_register(struct bpf_raw_event_map *btp, struct bpf_raw_tp_link *link)
   803	{
   804		return -EOPNOTSUPP;
   805	}
   806	static inline int bpf_probe_unregister(struct bpf_raw_event_map *btp, struct bpf_raw_tp_link *link)
   807	{
   808		return -EOPNOTSUPP;
   809	}
   810	static inline struct bpf_raw_event_map *bpf_get_raw_tracepoint(const char *name)
   811	{
   812		return NULL;
   813	}
   814	static inline void bpf_put_raw_tracepoint(struct bpf_raw_event_map *btp)
   815	{
   816	}
   817	static inline int bpf_get_perf_event_info(const struct perf_event *event,
   818						  u32 *prog_id, u32 *fd_type,
   819						  const char **buf, u64 *probe_offset,
   820						  u64 *probe_addr, unsigned long *missed)
   821	{
   822		return -EOPNOTSUPP;
   823	}
   824	static inline int
   825	bpf_kprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   826	{
   827		return -EOPNOTSUPP;
   828	}
   829	static inline int
   830	bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   831	{
   832		return -EOPNOTSUPP;
   833	}
 > 834	int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
   835	{
   836		return -EOPNOTSUPP;
   837	}
   838	#endif
   839	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
