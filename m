Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02531C0DE4;
	Fri, 27 Sep 2024 14:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727448341; cv=none; b=tuzQrSi8prb7P+31aW2jRHWeUVSPRvHNV76KmusHX8ghEcMnTdHIF5TJbN3ju7GHw/R3oGTECTPLYBen6OPboPndm1+/fDYvnLt54oxImsTJaSiHdHFcY6OTTfRlD11Llus33uFlnuw8eD6yiORpOtStlz9abtp/lRSdA1/q/+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727448341; c=relaxed/simple;
	bh=4NOrCTeau9vnTJagOo76M5VLvL4NYyvgx/AHngz0/JI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r91+cGLUu5+nCweKI6yzpZdwL6p5uFPdqsdiS52Dc04rgMxlpRzrUL/mdxAnR6cfw60wv+XGhKsCNaQol1rbnPCO2MV85S4FKp+ruatCcUK1PWawOYX5+5zT7Vs3pBt+TfCdo9D7K5Zu+GV/o8VY/WEHB+UzzECQ3Wr8fOolTvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EaOAaHQR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EaOAaHQR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727448339; x=1758984339;
  h=date:from:cc:subject:message-id:mime-version;
  bh=4NOrCTeau9vnTJagOo76M5VLvL4NYyvgx/AHngz0/JI=;
  b=EaOAaHQRm6EhCCKVwJnNDBnIZpuC3FDJNdoxlbAM9WGMJYtrDDor0Xg0
   a6sbIqX5jPv7M+8lvTLMS7B3hTS7ZpH96l3i8U8+9c6OJAVRZksbUPYKv
   XHsF/vJLc5acDIcA4sC8N7TQTSyWte7OOGlTCubFGkC0sjonRspmcWqCj
   jEcG+umLlDqHdT0jf852ulIkvTeT98qhL2FpObVQjyCv4pvxb0oLqmxRh
   AvB5SgITCpch8qeMLF3k75upTkC2N0Q+N/hEqmHWorroBw69zLqolG7ei
   XwyxvKQNoK6+GckKSlfrSwOj4osLon4/v72SVr7KEOzLBC1MWRWMdib+5
   Q==;
X-CSE-ConnectionGUID: zoPR8VgFS/6mK5BIEeam8Q==
X-CSE-MsgGUID: JVmjuzZCS26kfFwxQLrKFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="30383257"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="30383257"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 07:45:28 -0700
X-CSE-ConnectionGUID: 8n7ihUhnSyaQvTm5xxKFgg==
X-CSE-MsgGUID: 8WfjbmOeTmq9yYnv1iGdcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="110047254"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Sep 2024 07:45:27 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suCDk-000MFo-0J;
	Fri, 27 Sep 2024 14:45:24 +0000
Date: Fri, 27 Sep 2024 22:44:53 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [namhyung-perf:bpf/slab-iter-v1 1/3] kernel/bpf/slab_iter.c:120:27:
 warning: bitwise operation between different enumeration types ('enum
 bpf_reg_type' and 'enum bpf_type_flag')
Message-ID: <202409272235.FTZRgKoS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Namhyung Kim <namhyung@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/namhyung/linux-perf.git bpf/slab-iter-v1
head:   4b00a1c2a4965bcd16815d5ec9a53bf967db5c27
commit: f64d383ac99d6adf90fbe971d24cf7cb3fa36753 [1/3] bpf: Add slab iterator
config: arm-randconfig-001-20240927 (https://download.01.org/0day-ci/archive/20240927/202409272235.FTZRgKoS-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409272235.FTZRgKoS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409272235.FTZRgKoS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/bpf/slab_iter.c:3:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/bpf/slab_iter.c:120:27: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     120 |                   PTR_TO_BTF_ID_OR_NULL | PTR_TRUSTED },
         |                   ~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   2 warnings generated.


vim +120 kernel/bpf/slab_iter.c

   > 3	#include <linux/bpf.h>
     4	#include <linux/btf_ids.h>
     5	#include <linux/slab.h>
     6	#include <linux/kernel.h>
     7	#include <linux/seq_file.h>
     8	
     9	#include "../../mm/slab.h" /* kmem_cache, slab_caches and slab_mutex */
    10	
    11	struct bpf_iter__slab {
    12		__bpf_md_ptr(struct bpf_iter_meta *, meta);
    13		__bpf_md_ptr(struct kmem_cache *, s);
    14	};
    15	
    16	static void *slab_iter_seq_start(struct seq_file *seq, loff_t *pos)
    17	{
    18		loff_t cnt = 0;
    19		struct kmem_cache *s = NULL;
    20	
    21		mutex_lock(&slab_mutex);
    22	
    23		/*
    24		 * Find an entry at the given position in the slab_caches list instead
    25		 * of keeping a reference (of the last visited entry, if any) out of
    26		 * slab_mutex. It might miss something if one is deleted in the middle
    27		 * while it releases the lock.  But it should be rare and there's not
    28		 * much we can do about it.
    29		 */
    30		list_for_each_entry(s, &slab_caches, list) {
    31			if (cnt == *pos)
    32				break;
    33	
    34			cnt++;
    35		}
    36	
    37		if (cnt != *pos)
    38			return NULL;
    39	
    40		++*pos;
    41		return s;
    42	}
    43	
    44	static void slab_iter_seq_stop(struct seq_file *seq, void *v)
    45	{
    46		struct bpf_iter_meta meta;
    47		struct bpf_iter__slab ctx = {
    48			.meta = &meta,
    49			.s = v,
    50		};
    51		struct bpf_prog *prog;
    52	
    53		meta.seq = seq;
    54		prog = bpf_iter_get_info(&meta, true);
    55		if (prog)
    56			bpf_iter_run_prog(prog, &ctx);
    57	
    58		mutex_unlock(&slab_mutex);
    59	}
    60	
    61	static void *slab_iter_seq_next(struct seq_file *seq, void *v, loff_t *pos)
    62	{
    63		struct kmem_cache *s = v;
    64	
    65		++*pos;
    66	
    67		if (list_last_entry(&slab_caches, struct kmem_cache, list) == s)
    68			return NULL;
    69	
    70		return list_next_entry(s, list);
    71	}
    72	
    73	static int slab_iter_seq_show(struct seq_file *seq, void *v)
    74	{
    75		struct bpf_iter_meta meta;
    76		struct bpf_iter__slab ctx = {
    77			.meta = &meta,
    78			.s = v,
    79		};
    80		struct bpf_prog *prog;
    81		int ret = 0;
    82	
    83		meta.seq = seq;
    84		prog = bpf_iter_get_info(&meta, false);
    85		if (prog)
    86			ret = bpf_iter_run_prog(prog, &ctx);
    87	
    88		return ret;
    89	}
    90	
    91	static const struct seq_operations slab_iter_seq_ops = {
    92		.start  = slab_iter_seq_start,
    93		.next   = slab_iter_seq_next,
    94		.stop   = slab_iter_seq_stop,
    95		.show   = slab_iter_seq_show,
    96	};
    97	
    98	BTF_ID_LIST_GLOBAL_SINGLE(bpf_slab_btf_id, struct, kmem_cache)
    99	
   100	static const struct bpf_iter_seq_info slab_iter_seq_info = {
   101		.seq_ops		= &slab_iter_seq_ops,
   102	};
   103	
   104	static void bpf_iter_slab_show_fdinfo(const struct bpf_iter_aux_info *aux,
   105					      struct seq_file *seq)
   106	{
   107		seq_puts(seq, "slab iter\n");
   108	}
   109	
   110	DEFINE_BPF_ITER_FUNC(slab, struct bpf_iter_meta *meta,
   111			     struct kmem_cache *s)
   112	
   113	static struct bpf_iter_reg bpf_slab_reg_info = {
   114		.target			= "slab",
   115		.feature		= BPF_ITER_RESCHED,
   116		.show_fdinfo		= bpf_iter_slab_show_fdinfo,
   117		.ctx_arg_info_size	= 1,
   118		.ctx_arg_info		= {
   119			{ offsetof(struct bpf_iter__slab, s),
 > 120			  PTR_TO_BTF_ID_OR_NULL | PTR_TRUSTED },
   121		},
   122		.seq_info		= &slab_iter_seq_info,
   123	};
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
