Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E84221D3F4;
	Tue, 21 Oct 2025 01:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761009300; cv=none; b=eRtgzAgMAAxiU4lHC2wbfvYYtL4UeT9hLfk99yXm78d37jIJJMK/khNZAE44s6O3RjMknSC4OR7zJ/fDyGfobbDDb1tduMpqtUdT0N8PLnpGcaW9cIokYDYW6242rfkeRQ/Zg/1A+k52uvHKLpVVh6mRrtMXKxu1WZNNobrUUvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761009300; c=relaxed/simple;
	bh=fB6TGAnC43AiA3oTJNwl3JtVWE3dqUl0GY2SfaU931o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTMoTz807ylQZo9+MUmFjpHqAhaw+SQnlDA0k7dP6qWLbRzDOUBR9auXqIiztgIS58B69DHg1lFMdMZdnXnrWwNbAZw6tFLrUiEdOZzu+p5ZtaZWGlr/XyOQ3BSjpmS2bMzNjSo1hPDZYCsl6LYr9otVczfGOFBgMlnXyTbj0Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aITqHrKr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aITqHrKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761009300; x=1792545300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fB6TGAnC43AiA3oTJNwl3JtVWE3dqUl0GY2SfaU931o=;
  b=aITqHrKrOVdnTrJ08pYKltHKdkdKJujPFYrdPLZq5w0806g1km3EZlOl
   4ZT7y+e8dAR8YutAN4b02hKzu/36OenFL8hfAdpwOFuyr62aQOWbnSd0B
   x/RMAIW9SM9dvaylKhpThC0txFWz8GGu+6Azh9LGpNa1yhp+9S6detoBy
   IylMkdBbPgg8k8AVdzlYa3vNiJfSE7V+9LzJyqeukg4UF27bVsWc7jVWn
   D3Xh22dqxvYPUbVVD97YtNs1Tuxw1z4HguqVqYcApQt+36oMBj8pvsnux
   ScOplU8hXRGcE7xpC9KRbGmOkzRqAQLEF2aiY777WgYkJtBClUn2+phAf
   A==;
X-CSE-ConnectionGUID: sFzrjgJZSbyv+MKsL73CxQ==
X-CSE-MsgGUID: rOiZ/78XRIaX31QP0Ui0Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="85755219"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="85755219"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 18:14:59 -0700
X-CSE-ConnectionGUID: DmuESj5fQj2MA7NBtwBKWg==
X-CSE-MsgGUID: 1FUJSFG7QqSCGvfMO7IOdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="183412976"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 20 Oct 2025 18:14:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vB0xd-000AKb-2d;
	Tue, 21 Oct 2025 01:14:50 +0000
Date: Tue, 21 Oct 2025 09:14:00 +0800
From: kernel test robot <lkp@intel.com>
To: Donglin Peng <dolinux.peng@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 2/5] btf: sort BTF types by kind and name to
 enable binary search
Message-ID: <202510210844.PWg6O19s-lkp@intel.com>
References: <20251020093941.548058-3-dolinux.peng@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020093941.548058-3-dolinux.peng@gmail.com>

Hi Donglin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/net]
[also build test ERROR on bpf-next/master bpf/master linus/master v6.18-rc2 next-20251020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Donglin-Peng/btf-search-local-BTF-before-base-BTF/20251020-174656
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git net
patch link:    https://lore.kernel.org/r/20251020093941.548058-3-dolinux.peng%40gmail.com
patch subject: [RFC PATCH v2 2/5] btf: sort BTF types by kind and name to enable binary search
config: i386-buildonly-randconfig-003-20251021 (https://download.01.org/0day-ci/archive/20251021/202510210844.PWg6O19s-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510210844.PWg6O19s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510210844.PWg6O19s-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:61:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:29:
>> include/linux/btf.h:703:1: error: expected identifier or '('
     703 | {}
         | ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:182: kernel/sched/rq-offsets.s] Error 1 shuffle=3611665597
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2 shuffle=3611665597
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3611665597
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3611665597
   make: Target 'prepare' not remade because of errors.


vim +703 include/linux/btf.h

   642	
   643	static inline const char *btf_name_by_offset(const struct btf *btf,
   644						     u32 offset)
   645	{
   646		return NULL;
   647	}
   648	static inline u32 *btf_kfunc_id_set_contains(const struct btf *btf,
   649						     u32 kfunc_btf_id,
   650						     struct bpf_prog *prog)
   651	
   652	{
   653		return NULL;
   654	}
   655	static inline int register_btf_kfunc_id_set(enum bpf_prog_type prog_type,
   656						    const struct btf_kfunc_id_set *s)
   657	{
   658		return 0;
   659	}
   660	static inline s32 btf_find_dtor_kfunc(struct btf *btf, u32 btf_id)
   661	{
   662		return -ENOENT;
   663	}
   664	static inline int register_btf_id_dtor_kfuncs(const struct btf_id_dtor_kfunc *dtors,
   665						      u32 add_cnt, struct module *owner)
   666	{
   667		return 0;
   668	}
   669	static inline struct btf_struct_meta *btf_find_struct_meta(const struct btf *btf, u32 btf_id)
   670	{
   671		return NULL;
   672	}
   673	static inline bool
   674	btf_is_prog_ctx_type(struct bpf_verifier_log *log, const struct btf *btf,
   675			     const struct btf_type *t, enum bpf_prog_type prog_type,
   676			     int arg)
   677	{
   678		return false;
   679	}
   680	static inline int get_kern_ctx_btf_id(struct bpf_verifier_log *log,
   681					      enum bpf_prog_type prog_type) {
   682		return -EINVAL;
   683	}
   684	static inline bool btf_types_are_same(const struct btf *btf1, u32 id1,
   685					      const struct btf *btf2, u32 id2)
   686	{
   687		return false;
   688	}
   689	static inline int btf_check_iter_arg(struct btf *btf, const struct btf_type *func, int arg_idx)
   690	{
   691		return -EOPNOTSUPP;
   692	}
   693	static inline int btf_compare_type_kinds_names(const void *a, const void *b, void *priv)
   694	{
   695		return -EOPNOTSUPP;
   696	}
   697	static inline s32 find_btf_by_name_kind(const struct btf *btf, int start_id, const char *type_name,
   698				  u32 kind)
   699	{
   700		return -EOPNOTSUPP;
   701	}
   702	static inline void btf_check_sorted(struct btf *btf, int start_id);
 > 703	{}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
