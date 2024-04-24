Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E65115A49E;
	Wed, 24 Apr 2024 12:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713960078; cv=none; b=kZuPqDS39bBULxjWXbXJ+RxyYkjcXnykDt6ZAP3tUEa4h59AXoWh/JS/7aQgsIih7EXwgrLTq8D7pjmqJUJiYgUsIjPPcfm27ce0I3IosQWDjpPRVftLGgDOD/oG8DKJXegdhxCmlpRqAmu0SBDMum458nkdW92OF4hS8lvAtxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713960078; c=relaxed/simple;
	bh=jggFU/6Ciku9QPdTzUf+iVjR/F4wJH1JBsCqPVuoTns=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bBtt3ZEqwBH0M4Xg0B+fz9EU5FpG0WF/86j0HSiDMEMe+lpeiWPuin7nE/eozekOrEaR/QXwwUjjiu0bpLUByBL4j6EfXrOJ72jLG+aQwjgAyto0VdOHFQj1NLSu1RZMZ54coLCIHt8RcOQ27nE/Vgjae32iB1sOqIvKG4Vb9U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXOXRywF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXOXRywF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713960073; x=1745496073;
  h=date:from:cc:subject:message-id:mime-version;
  bh=jggFU/6Ciku9QPdTzUf+iVjR/F4wJH1JBsCqPVuoTns=;
  b=DXOXRywFENlSvTIZwnxzNH96ED31ZQCgT2cWD2ZDxxopHb4RIbLRvNOG
   YdbQtwrs5U8wYs5Zz1F5EHT6O2Wt0thQkYP5Y+XQqK61Z3dY8oY+hutC6
   MkOb4KYrla81aJeaLdSpjr/06n9yNffroGCA2bphtjaZoK0tk9tujxbDi
   mJMrXuGaX36MLO+CrZv/9XrRFYozEdYoE7ledjnfl2HtDYEnkKP0OOMR7
   saf9Zim+leEELjybZ1TgHa1bQ5+DhfRSU2jf6paZcRDvQQDyE4yO3t64d
   bbqbqaPpYiZHs07KUS2dfnZAj4eqFRgh+DQ0INNhI9bMkc4Mj5jreURXM
   w==;
X-CSE-ConnectionGUID: 6+B8JMeLQu++9rmedJ6JBA==
X-CSE-MsgGUID: Vhw3d7fxQhaA0lKn9PQX+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20201155"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="20201155"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 05:01:12 -0700
X-CSE-ConnectionGUID: bxAEWQugTfKIYdjGUfpiGA==
X-CSE-MsgGUID: BhR5wY/8T/25h0uHk/4IkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="25293775"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Apr 2024 05:01:11 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzbJE-0001Bg-1u;
	Wed, 24 Apr 2024 12:01:08 +0000
Date: Wed, 24 Apr 2024 20:01:01 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next 4/5] bpf: check bpf_dummy_struct_ops program
 params for test runs
Message-ID: <202404241956.HEiRYwWq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20240424012821.595216-5-eddyz87@gmail.com>
References: <20240424012821.595216-5-eddyz87@gmail.com>
TO: Eduard Zingerman <eddyz87@gmail.com>
TO: bpf@vger.kernel.org
TO: ast@kernel.org
CC: andrii@kernel.org
CC: daniel@iogearbox.net
CC: martin.lau@linux.dev
CC: kernel-team@fb.com
CC: yonghong.song@linux.dev
CC: jemarch@gnu.org
CC: thinker.li@gmail.com
CC: Eduard Zingerman <eddyz87@gmail.com>
CC: "Kui-Feng Lee" <sinquersw@gmail.com>

Hi Eduard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Eduard-Zingerman/bpf-mark-bpf_dummy_struct_ops-test_1-parameter-as-nullable/20240424-093035
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20240424012821.595216-5-eddyz87%40gmail.com
patch subject: [PATCH bpf-next 4/5] bpf: check bpf_dummy_struct_ops program params for test runs
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240424/202404241956.HEiRYwWq-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404241956.HEiRYwWq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404241956.HEiRYwWq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bpf_verifier.h:7:
   In file included from include/linux/bpf.h:20:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from net/bpf/bpf_dummy_struct_ops.c:6:
   In file included from include/linux/bpf_verifier.h:9:
   In file included from include/linux/filter.h:12:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from net/bpf/bpf_dummy_struct_ops.c:6:
   In file included from include/linux/bpf_verifier.h:9:
   In file included from include/linux/filter.h:12:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from net/bpf/bpf_dummy_struct_ops.c:6:
   In file included from include/linux/bpf_verifier.h:9:
   In file included from include/linux/filter.h:12:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> net/bpf/bpf_dummy_struct_ops.c:118:31: warning: bitwise operation between different enumeration types ('const enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     118 |                 if (info && (info->reg_type & PTR_MAYBE_NULL))
         |                              ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   18 warnings generated.


vim +118 net/bpf/bpf_dummy_struct_ops.c

    92	
    93	/* There is only one check at the moment:
    94	 * - zero should not be passed for pointer parameters not marked as nullable.
    95	 */
    96	static int check_test_run_args(struct bpf_prog *prog, struct bpf_dummy_ops_test_args *args)
    97	{
    98		const struct btf_type *func_proto = prog->aux->attach_func_proto;
    99	
   100		for (u32 arg_no = 0; arg_no < btf_type_vlen(func_proto) ; ++arg_no) {
   101			const struct btf_param *param = &btf_params(func_proto)[arg_no];
   102			const struct bpf_ctx_arg_aux *info;
   103			const struct btf_type *t;
   104			int offset;
   105	
   106			if (args->args[arg_no] != 0)
   107				continue;
   108	
   109			/* Program is validated already, so there is no need
   110			 * to check if t is NULL.
   111			 */
   112			t = btf_type_skip_modifiers(bpf_dummy_ops_btf, param->type, NULL);
   113			if (!btf_type_is_ptr(t))
   114				continue;
   115	
   116			offset = btf_ctx_arg_offset(bpf_dummy_ops_btf, func_proto, arg_no);
   117			info = find_ctx_arg_info(prog->aux, offset);
 > 118			if (info && (info->reg_type & PTR_MAYBE_NULL))
   119				continue;
   120	
   121			return -EINVAL;
   122		}
   123	
   124		return 0;
   125	}
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
