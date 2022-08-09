Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBFA15A6
	for <llvm@lists.linux.dev>; Tue,  9 Aug 2022 01:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660007979; x=1691543979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WoPvHOGgTEbEzj89e3IV+8HwssBW/QiZ2hqSwPgyHkQ=;
  b=aV2E3PRlY45dSmJkXFc2SIi3KhnaryYO26k4KGSIhUUqO8ygmyfldhTH
   grJ7/7GeT2ynDNT5k17It6lmR9gmY2AijBaHGBFBXZO4uw9JWA+7qmDOv
   6a9EoHgo/9px4r2tfhmqjzxM++uq7z8w3RV6xW1Q1CJXLa+SDFDfc2vlK
   4kOc5gtqDWBtuBVIQ8Ta/E2I/6gskXzav6D+tj2UdwEmRlaQApO3cIRb4
   w2U/LYvO6Ei0W+E+xASl90uzfm6ZzNPrpXK1i1ln+VfCkkaWWnOF25ShD
   256LMk0Gz9LrBky+URkHSlUOe8BQdyzmhhtRPQ1OE5EZsiTruXxdVBewL
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="316653370"
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; 
   d="scan'208";a="316653370"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2022 18:19:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; 
   d="scan'208";a="633135119"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Aug 2022 18:19:37 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLDuC-000MdV-2Q;
	Tue, 09 Aug 2022 01:19:36 +0000
Date: Tue, 9 Aug 2022 09:18:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH bpf-next 11/17] bpf: Add support to create tracing
 multi link
Message-ID: <202208090940.BaqRbrvE-lkp@intel.com>
References: <20220808140626.422731-12-jolsa@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220808140626.422731-12-jolsa@kernel.org>

Hi Jiri,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf/master]
[also build test WARNING on next-20220808]
[cannot apply to bpf-next/master rostedt-trace/for-next linus/master v5.19]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Olsa/bpf-Add-tracing-multi-link/20220808-221246
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
config: hexagon-randconfig-r002-20220808 (https://download.01.org/0day-ci/archive/20220809/202208090940.BaqRbrvE-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c16f49e680e78a8df8ffc125e001217fb8be8e0b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jiri-Olsa/bpf-Add-tracing-multi-link/20220808-221246
        git checkout c16f49e680e78a8df8ffc125e001217fb8be8e0b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/time/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from kernel/time/time.c:33:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
>> include/linux/trace_events.h:797:5: warning: no previous prototype for function 'bpf_tracing_multi_attach' [-Wmissing-prototypes]
   int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
       ^
   include/linux/trace_events.h:797:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
   ^
   static 
   1 warning generated.
--
   In file included from kernel/time/hrtimer.c:30:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
>> include/linux/trace_events.h:797:5: warning: no previous prototype for function 'bpf_tracing_multi_attach' [-Wmissing-prototypes]
   int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
       ^
   include/linux/trace_events.h:797:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
   ^
   static 
   kernel/time/hrtimer.c:120:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
                                     ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:118:27: note: previous initialization is here
           [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
                                     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:121:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
                                     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:118:27: note: previous initialization is here
           [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
                                     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
                                     ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:118:27: note: previous initialization is here
           [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
                                     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:17: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [CLOCK_TAI]             = HRTIMER_BASE_TAI,
                                     ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:118:27: note: previous initialization is here
           [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
                                     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:147:20: warning: unused function 'is_migration_base' [-Wunused-function]
   static inline bool is_migration_base(struct hrtimer_clock_base *base)
                      ^
   kernel/time/hrtimer.c:1873:20: warning: unused function '__hrtimer_peek_ahead_timers' [-Wunused-function]
   static inline void __hrtimer_peek_ahead_timers(void)
                      ^
   7 warnings generated.


vim +/bpf_tracing_multi_attach +797 include/linux/trace_events.h

   764	
   765	static inline int
   766	perf_event_query_prog_array(struct perf_event *event, void __user *info)
   767	{
   768		return -EOPNOTSUPP;
   769	}
   770	static inline int bpf_probe_register(struct bpf_raw_event_map *btp, struct bpf_prog *p)
   771	{
   772		return -EOPNOTSUPP;
   773	}
   774	static inline int bpf_probe_unregister(struct bpf_raw_event_map *btp, struct bpf_prog *p)
   775	{
   776		return -EOPNOTSUPP;
   777	}
   778	static inline struct bpf_raw_event_map *bpf_get_raw_tracepoint(const char *name)
   779	{
   780		return NULL;
   781	}
   782	static inline void bpf_put_raw_tracepoint(struct bpf_raw_event_map *btp)
   783	{
   784	}
   785	static inline int bpf_get_perf_event_info(const struct perf_event *event,
   786						  u32 *prog_id, u32 *fd_type,
   787						  const char **buf, u64 *probe_offset,
   788						  u64 *probe_addr)
   789	{
   790		return -EOPNOTSUPP;
   791	}
   792	static inline int
   793	bpf_kprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   794	{
   795		return -EOPNOTSUPP;
   796	}
 > 797	int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
   798	{
   799		return -EOPNOTSUPP;
   800	}
   801	#endif
   802	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
