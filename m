Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7493015BF
	for <llvm@lists.linux.dev>; Tue,  9 Aug 2022 02:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660013440; x=1691549440;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I3ypbq5qO9/QP8xI848qU1kGecEV9NFHN1pn3575UtE=;
  b=En+nyY2OHqBpJZ8xzSkxUm2scIfAjeLSoIYk8d5J1LXOm6GBWJ25BDjV
   Bu/V8AwHfvp0gZkpwilZLH5xYMTw5y1fdmw+jx1kHswxkTfZnIJ9mFF1/
   joXY0clKmMToafuso5UVvYyDCUCXshb5LDiFV1jrTt3WLQ/mDk5ZEbz3Z
   hLarQuveZbsHK+crbbBjAksuE3qe7RnRy6OywflfL+jDhXV+qHjRQUpJt
   Lmfb9H9HQT9ITM6R6OIMCnqwC65Y2mX+uhwVIeVkj0bCyIv4dW6vlOs+h
   VK1iiEbT1g28nGwcErds2dO4zlbg3S8NIIQpEyqSkI3CV+atFGe94eTkn
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="316665874"
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; 
   d="scan'208";a="316665874"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2022 19:50:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; 
   d="scan'208";a="693985596"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Aug 2022 19:50:38 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLFKH-000Mfp-38;
	Tue, 09 Aug 2022 02:50:37 +0000
Date: Tue, 9 Aug 2022 10:50:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH bpf-next 11/17] bpf: Add support to create tracing
 multi link
Message-ID: <202208091059.te2QbOWA-lkp@intel.com>
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
[auto build test ERROR on bpf/master]
[also build test ERROR on next-20220808]
[cannot apply to bpf-next/master rostedt-trace/for-next linus/master v5.19]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Olsa/bpf-Add-tracing-multi-link/20220808-221246
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
config: x86_64-randconfig-a011-20220808 (https://download.01.org/0day-ci/archive/20220809/202208091059.te2QbOWA-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/i915_trace_points.c:13:
   In file included from include/trace/../../drivers/gpu/drm/i915/i915_trace.h:770:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:21:
>> include/linux/trace_events.h:797:5: error: no previous prototype for function 'bpf_tracing_multi_attach' [-Werror,-Wmissing-prototypes]
   int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
       ^
   include/linux/trace_events.h:797:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
   ^
   static 
   1 error generated.


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
