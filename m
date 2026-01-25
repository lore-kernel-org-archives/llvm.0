Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663193EBF03;
	Sun, 25 Jan 2026 05:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769317314; cv=none; b=D8kmUHk9p2YLBNUvcQTtfISOps+XnF5DvsTwYifTMje6Yq/AMLOoZLhnp5tlLWo15VBEcEGztpedG3Tf2YfQA189AsSxZAfEx8aP8YzY+FA7xSWynMUHRzmr0GF7XE5hsq/EHauENkbVTlW4BBjalVwm8JKuknl+9m27gEhzDJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769317314; c=relaxed/simple;
	bh=YS9bfHVI4PNR3mHvFKuEa7oUg3RtWVInuVlQiUgCCrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PaXDCX+AxIbMv2tsL1R/DGgVqO/CwUhlRppD6JoTfHA04cK0BYWs2MZCuXnsBO4zFSjSZT5gjw91bfSr2qMwsZV/Gzbxp7Je4cUqGy2Cu9MfTpsSQFfEC2tnmUXO3gikZg3GTKOQqVjYNulqRAN57rwm78W2TEdD2RDy6FyAykA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H6o2E344; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H6o2E344"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769317311; x=1800853311;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YS9bfHVI4PNR3mHvFKuEa7oUg3RtWVInuVlQiUgCCrU=;
  b=H6o2E344ru68Dby7nz575H6iTw85GjQT8CoZERbAeJ23aeVQUVXUAUti
   HVTYJYKve2XDh5gzzVelBHAgl75BYwVbemkhb4giZm4kF1UMotlEKtsVH
   hUUu6UN9b2I3y77xxDjn3QztTXEYI012dVgNIWtixpid4+1Rby1wx6PeR
   0ie9HmS/hCgQRzckBd6DtXjWFbh2++ONs3/+eNvZkip1fURdz2zUcbeV/
   Bc2WxNpPNfXEe9KEs1qG0BukZqSV7IzAdGD67ZTKhEv8IkspCpmFhiTzj
   3C7MpP4EIlcQyhwHEwbOyYfWA7Aoq6FYzwlizOJuk/p8H+jpGYoWLPpte
   g==;
X-CSE-ConnectionGUID: jj2NsLCgRFuC+YiGJXbPAw==
X-CSE-MsgGUID: xqQbV6z/QwWzJGEwCYMdTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="80824116"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="80824116"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 21:01:51 -0800
X-CSE-ConnectionGUID: q1R99ZiYSa2qN/Dqxwe4xQ==
X-CSE-MsgGUID: ZBUhPABtQOScykTBLZHjKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="211888036"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Jan 2026 21:01:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjsFv-00000000VnG-0hYe;
	Sun, 25 Jan 2026 05:01:47 +0000
Date: Sun, 25 Jan 2026 13:00:59 +0800
From: kernel test robot <lkp@intel.com>
To: Hui Zhu <hui.zhu@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next v3 08/12] mm: memcontrol: Add BPF struct_ops
 for memory controller
Message-ID: <202601251210.TjCYrxg9-lkp@intel.com>
References: <863b91cb85097f137bc741e7cb686ff78d9bb95e.1769157382.git.zhuhui@kylinos.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <863b91cb85097f137bc741e7cb686ff78d9bb95e.1769157382.git.zhuhui@kylinos.cn>

Hi Hui,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]
[cannot apply to akpm-mm/mm-everything bpf-next/net bpf/master linus/master v6.19-rc6 next-20260123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hui-Zhu/bpf-move-bpf_struct_ops_link-into-bpf-h/20260123-170445
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/863b91cb85097f137bc741e7cb686ff78d9bb95e.1769157382.git.zhuhui%40kylinos.cn
patch subject: [RFC PATCH bpf-next v3 08/12] mm: memcontrol: Add BPF struct_ops for memory controller
config: hexagon-randconfig-002-20260125 (https://download.01.org/0day-ci/archive/20260125/202601251210.TjCYrxg9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601251210.TjCYrxg9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601251210.TjCYrxg9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:61:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:96:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:32:
>> include/linux/memcontrol.h:644:62: error: expected ';' after return statement
     644 | bpf_memcg_get_high_delay(struct mem_cgroup *memcg) { return 0 }
         |                                                              ^
         |                                                              ;
>> include/linux/memcontrol.h:645:15: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     645 | static inline bpf_memcg_below_low(struct mem_cgroup *memcg) { return false }
         | ~~~~~~~~~~~~~ ^
         | int
   include/linux/memcontrol.h:645:75: error: expected ';' after return statement
     645 | static inline bpf_memcg_below_low(struct mem_cgroup *memcg) { return false }
         |                                                                           ^
         |                                                                           ;
   include/linux/memcontrol.h:646:15: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     646 | static inline bpf_memcg_below_min(struct mem_cgroup *memcg) { return false }
         | ~~~~~~~~~~~~~ ^
         | int
   include/linux/memcontrol.h:646:75: error: expected ';' after return statement
     646 | static inline bpf_memcg_below_min(struct mem_cgroup *memcg) { return false }
         |                                                                           ^
         |                                                                           ;
   5 errors generated.
   make[3]: *** [scripts/Makefile.build:182: kernel/sched/rq-offsets.s] Error 1 shuffle=710836874
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1315: prepare0] Error 2 shuffle=710836874
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=710836874
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=710836874
   make: Target 'prepare' not remade because of errors.


vim +644 include/linux/memcontrol.h

   642	
   643	static inline unsigned long
 > 644	bpf_memcg_get_high_delay(struct mem_cgroup *memcg) { return 0 }
 > 645	static inline bpf_memcg_below_low(struct mem_cgroup *memcg) { return false }
   646	static inline bpf_memcg_below_min(struct mem_cgroup *memcg) { return false }
   647	static inline void memcontrol_bpf_online(struct mem_cgroup *memcg) { }
   648	static inline void memcontrol_bpf_offline(struct mem_cgroup *memcg) { }
   649	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
