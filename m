Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2C0187866;
	Sat, 28 Sep 2024 23:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727567106; cv=none; b=RyoRZsQ1Dm5Ym+SRhDtYfJh4g/4GVP7BXgLizhGK/k0xa49gh/DqXW7GwlEop+p4bTsX1JcC6orp/Mysc5IDPvT1EQdnQ/ZmO7bbHHBE1OUdv+wl+cnZmhbNI6wDsXPyYrhZ/oaxIWTyDtJ2XG6QTdAOaeaJmDVAOJl3wuJO6Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727567106; c=relaxed/simple;
	bh=YgCVSO3ZRTxKlfiPxsjrBOUIlAsK1mpFKbavERQA9Ac=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WDHeinCkfY/Ul7bWWJTPGDqWtmUVeyO4VuLEWHg3KMJ51xfSy9oIPCHCnOGkTcePJhyZ4B68sRbwh7hbmy027McIwOQ7L3sKFUQsAQfzTLiUDx3vdIhh0RLney2vBGja3DTzpMTyiZPmTJGfIuONgLt5dlTW+08Dcxzpmd0wYX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JxGwdoXd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JxGwdoXd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727567104; x=1759103104;
  h=date:from:cc:subject:message-id:mime-version;
  bh=YgCVSO3ZRTxKlfiPxsjrBOUIlAsK1mpFKbavERQA9Ac=;
  b=JxGwdoXdcdsiGWLTvmy/YM7FKUdDIML+vs8TExL3AZTxhiZpVHqsKA3S
   gh/jXteLwdVAXI0wXnGQG2Pv/USeoN+K0mfFKdr2ILcIYzDj4e68rCzZo
   VcbOewQX9eaTNZQ7HhUSmi0zSCBv5P6fTmZ+nuZycDIPnrPE9i0mqH5RY
   Ho1psUDAxbO7b5p7yDYjJx8/j5ihcxAOZcA8Y1TxMePVCa6ecJESeUzF4
   cHv6BkABDhDutJsGwwyjkWEiyhIRrK42wfxF2YPfpARkBagredehRroA9
   0JFZuZpOOTJGf4/W3Bc5YPAGZFpP2anqlk3Q8mHZhSYc4ZSMAO2wNnJCs
   g==;
X-CSE-ConnectionGUID: IoO2LREDSfi8s7i3GWyh6A==
X-CSE-MsgGUID: /xCb4gFXSgiBRkuHXm3IOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26192340"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="26192340"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 16:45:03 -0700
X-CSE-ConnectionGUID: TvTg/AtPQJa7U+98kEPqyA==
X-CSE-MsgGUID: /S+jGtZ0Rh6bJ7YLwXn2lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="103705534"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Sep 2024 16:45:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suh7U-000Nkx-27;
	Sat, 28 Sep 2024 23:45:00 +0000
Date: Sun, 29 Sep 2024 07:44:34 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [namhyung-perf:bpf/slab-iter-v2 1/3]
 kernel/bpf/kmem_cache_iter.c:120:27: warning: bitwise operation between
 different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag')
Message-ID: <202409290736.noNpvuDF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Namhyung Kim <namhyung@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/namhyung/linux-perf.git bpf/slab-iter-v2
head:   a2e406765c81d7573da08bd136726e5599f9a8c8
commit: ebf6eaa62ac38d0ae392387881d348aaee2694e1 [1/3] bpf: Add kmem_cache iterator
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240929/202409290736.noNpvuDF-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290736.noNpvuDF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290736.noNpvuDF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/bpf/kmem_cache_iter.c:3:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/bpf/kmem_cache_iter.c:120:27: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     120 |                   PTR_TO_BTF_ID_OR_NULL | PTR_TRUSTED },
         |                   ~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   2 warnings generated.


vim +120 kernel/bpf/kmem_cache_iter.c

   109	
   110	DEFINE_BPF_ITER_FUNC(kmem_cache, struct bpf_iter_meta *meta,
   111			     struct kmem_cache *s)
   112	
   113	static struct bpf_iter_reg bpf_kmem_cache_reg_info = {
   114		.target			= "kmem_cache",
   115		.feature		= BPF_ITER_RESCHED,
   116		.show_fdinfo		= bpf_iter_kmem_cache_show_fdinfo,
   117		.ctx_arg_info_size	= 1,
   118		.ctx_arg_info		= {
   119			{ offsetof(struct bpf_iter__kmem_cache, s),
 > 120			  PTR_TO_BTF_ID_OR_NULL | PTR_TRUSTED },
   121		},
   122		.seq_info		= &kmem_cache_iter_seq_info,
   123	};
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
