Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A842D8F70;
	Mon, 22 Jul 2024 16:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721664590; cv=none; b=FoZtq3qvMC96LWT6CKUKsMPlVO2WEZHPGYT0mXkIHU8akZWNheEEXnv6cCOmrao1Fq/Iw5l/9ngk0hit4x/DXvaDoy0cm3PHHeicLquIYtXwG4RKwCQp4U+cwAAbQ9E+O17C36qWyTGIn+VTr4MKE4rTswsYFKfsi3KuNEWb95M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721664590; c=relaxed/simple;
	bh=Rc1LvWGuICR7Fwz4Hlxyk9TSB06L7UWQH+UTwPqSZ5w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C6u4ps10udDoisS7vpPQEfKvPZ7YzZGArfSzP4icANa7PEM1BbRuZT+Yi75WdizUYb8LbQml6vdXWRYhiTEpGJ4bI6IwE2EvAZuzDqgdI9i94Hxu/d4XV4GL9AByNuRPnyBDn77RCuUa6mdrAY9Nuflx+1B0EwpRJQMxy5fOxEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GO6rM2Da; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GO6rM2Da"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721664588; x=1753200588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rc1LvWGuICR7Fwz4Hlxyk9TSB06L7UWQH+UTwPqSZ5w=;
  b=GO6rM2DaFJVqrYBYD3yU7blp8yVWgNO/SiyJW30pOUlZ2pTzAxFM79Pt
   f9LmouvB2R8IJz9odkzNHHwDJqCnuFkKdv/Ds1smcwH3iIrSTE0KLhUFT
   OqG5Y8kUSdgR96/dhs/dncei4bXCVM/1XRvcNf+OSEhJZw4MAUwGeaxhY
   eAXoGY3iCU+LLsN+oU9wwytT0myBSxZsrW1c3VdVm3YzjX124Q8eaD/VH
   YgJj/JzxABX2rU0nO/X7T6gEsbktIYMAMsuyEyClFGCR2kOqBuw6fGLIe
   bG67TwTFJ0kvt5MNanaH3fdY3OGT5MVz3eNieRDvH3Jp69PRWMs+TXORl
   w==;
X-CSE-ConnectionGUID: O1g/OYClQgihaQMiiE+5iA==
X-CSE-MsgGUID: uqo5jQ44QyC7dMngKZTZgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="12650490"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="12650490"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 09:09:48 -0700
X-CSE-ConnectionGUID: At1QFl1FR2elPEcK3VkV9A==
X-CSE-MsgGUID: /QJ0pqd9RzSwuOXE2z7fIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="56488450"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Jul 2024 09:09:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVvbc-000lEO-2d;
	Mon, 22 Jul 2024 16:09:44 +0000
Date: Tue, 23 Jul 2024 00:09:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bp 3/4] kernel/trace/bpf_trace.c:3566:9: error: call to
 undeclared function 'hw_breakpoint_modify'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202407230034.oKNTq3kB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bp
head:   b45f92fe92ab4e5bf3568b81df7d7a4c7a52acbe
commit: 4e7d975bf8e514543825578dd810d04770bee181 [3/4] add bpf_bp_modify_address kfunc
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240723/202407230034.oKNTq3kB-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407230034.oKNTq3kB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407230034.oKNTq3kB-lkp@intel.com/

All errors (new ones prefixed by >>):

     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from kernel/trace/bpf_trace.c:9:
   In file included from include/linux/bpf_verifier.h:9:
   In file included from include/linux/filter.h:12:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from kernel/trace/bpf_trace.c:9:
   In file included from include/linux/bpf_verifier.h:9:
   In file included from include/linux/filter.h:12:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   kernel/trace/bpf_trace.c:357:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     357 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:403:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     403 |         .arg1_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:458:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     458 |         .arg1_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:460:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     460 |         .arg3_type      = ARG_PTR_TO_MEM | PTR_MAYBE_NULL | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/trace/bpf_trace.c:502:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     502 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:504:35: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     504 |         .arg4_type      = ARG_PTR_TO_MEM | PTR_MAYBE_NULL | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/trace/bpf_trace.c:519:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     519 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:543:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     543 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:707:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     707 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:1033:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1033 |         .arg3_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:1728:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1728 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:1953:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1953 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:2008:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    2008 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>> kernel/trace/bpf_trace.c:3566:9: error: call to undeclared function 'hw_breakpoint_modify'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3566 |         return hw_breakpoint_modify(event, addr);
         |                ^
   30 warnings and 1 error generated.


vim +/hw_breakpoint_modify +3566 kernel/trace/bpf_trace.c

  3540	
  3541	__bpf_kfunc int bpf_bp_modify_addr(const struct bpf_map *map, u64 flags, unsigned long addr)
  3542	{
  3543		struct bpf_array *array = container_of(map, struct bpf_array, map);
  3544		unsigned int cpu = smp_processor_id();
  3545		u64 index = flags & BPF_F_INDEX_MASK;
  3546		struct bpf_event_entry *ee;
  3547		struct perf_event *event;
  3548	
  3549		if (index == BPF_F_CURRENT_CPU)
  3550			index = cpu;
  3551	
  3552		if (unlikely(index >= array->map.max_entries))
  3553			return -E2BIG;
  3554	
  3555		ee = READ_ONCE(array->ptrs[index]);
  3556		if (!ee)
  3557			return -ENOENT;
  3558	
  3559		event = ee->event;
  3560		if (unlikely(event->attr.type != PERF_TYPE_BREAKPOINT))
  3561			return -EINVAL;
  3562	
  3563		if (unlikely(event->oncpu != cpu))
  3564			return -EOPNOTSUPP;
  3565	
> 3566		return hw_breakpoint_modify(event, addr);
  3567	}
  3568	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
