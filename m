Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E9664A;
	Sun, 17 Nov 2024 03:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731815989; cv=none; b=AZS+Sn87qFoRc+CpL8iY/UC80ev/ekYqlwpg0qYBIfXhsE1qRHl7iQELEqRyNGdvTQk2u2unHwBDV51/1SpIj/9yaTrr6S9jRkGNI1PrhKxrMxrtqwpDyf6CVSYWsTA3AA5H4YPhAWKaNEBoBDH6s0Hnc4FH/sP+lhsxWnDJx7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731815989; c=relaxed/simple;
	bh=0XExqimtCuBpWn1t52fr8MRd9ayCtbYlA4u1DMSu/aY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iqk8JS43gceb0soNBAZAMlHF0imyv6ZB1kTdr7uz7cD1T9MPW1/nIzMpEdzsGSgj465xfd8juUSqK0tYUuL/E5GkLykU4aL4LuPbSHwAmWWD2uxJ0jmTj7g76+i9Ezozf7cPwkoEqE+bQNiWbbd2H8onIFvKeqi9Rwgwh5l5ucA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GrteGbpK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GrteGbpK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731815987; x=1763351987;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0XExqimtCuBpWn1t52fr8MRd9ayCtbYlA4u1DMSu/aY=;
  b=GrteGbpK1YN1h5695mqtM5QUZ5KdC0nfZhr2uHdlnfe6kK8edMLXdnKN
   Q9slQMIZGnbRr2wP8MAQQLNn4/43JQLAf8CZn6ZCwRkrt1UaHk4DgAH8Y
   CV3JRZiNm10lRPkpBsJGMEZcU6XKTF9sDEmCDhw0MyGFp62rSRwY8nHZR
   AMI3Cj9Sw9G4xf9/tl94F9Y2TBRszwGSmTNComBH8mCn9meWMtqcOENJ7
   5nSwViA0ChfMuFAqnqSif1GWptT/ZTTayLh+90TGn/8qv2SNzx+8m5U32
   iCVmmgRANATqa5BC1b8V5DFgV+1OVYHY3g/8GJxzjvpl/JcjEn4LbXdfn
   A==;
X-CSE-ConnectionGUID: lzDH83HtT9yVaEUIC1m9qQ==
X-CSE-MsgGUID: 0Y4/5QccQO6nllcpkXKdxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="35711736"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="35711736"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 19:59:47 -0800
X-CSE-ConnectionGUID: wtWR5ftDRAKJEdwmhuJabQ==
X-CSE-MsgGUID: bJdH5G3JTUirlopNieFFaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="88483447"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Nov 2024 19:59:45 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCWRr-0001Of-1d;
	Sun, 17 Nov 2024 03:59:43 +0000
Date: Sun, 17 Nov 2024 11:59:25 +0800
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] btrfs: add delayed ref self tests
Message-ID: <202411171120.TmMiTNlM-lkp@intel.com>
References: <78564483832375111f2d9541678cffa5d3c0c30a.1731614132.git.josef@toxicpanda.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78564483832375111f2d9541678cffa5d3c0c30a.1731614132.git.josef@toxicpanda.com>

Hi Josef,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on next-20241115]
[cannot apply to linus/master v6.12-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josef-Bacik/btrfs-move-select_delayed_ref-and-export-it/20241115-075921
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/78564483832375111f2d9541678cffa5d3c0c30a.1731614132.git.josef%40toxicpanda.com
patch subject: [PATCH 2/2] btrfs: add delayed ref self tests
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20241117/202411171120.TmMiTNlM-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171120.TmMiTNlM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171120.TmMiTNlM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/btrfs/tests/delayed-refs-tests.c:4:
   In file included from fs/btrfs/tests/../transaction.h:15:
   In file included from fs/btrfs/tests/../btrfs_inode.h:15:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/btrfs/tests/delayed-refs-tests.c:4:
   In file included from fs/btrfs/tests/../transaction.h:15:
   In file included from fs/btrfs/tests/../btrfs_inode.h:20:
   In file included from include/trace/events/btrfs.h:8:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/btrfs/tests/delayed-refs-tests.c:4:
   In file included from fs/btrfs/tests/../transaction.h:15:
   In file included from fs/btrfs/tests/../btrfs_inode.h:20:
   In file included from include/trace/events/btrfs.h:8:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/btrfs/tests/delayed-refs-tests.c:4:
   In file included from fs/btrfs/tests/../transaction.h:15:
   In file included from fs/btrfs/tests/../btrfs_inode.h:20:
   In file included from include/trace/events/btrfs.h:8:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> fs/btrfs/tests/delayed-refs-tests.c:979:5: warning: stack frame size (1136) exceeds limit (1024) in 'btrfs_test_delayed_refs' [-Wframe-larger-than]
     979 | int btrfs_test_delayed_refs(u32 sectorsize, u32 nodesize)
         |     ^
   8 warnings generated.


vim +/btrfs_test_delayed_refs +979 fs/btrfs/tests/delayed-refs-tests.c

   978	
 > 979	int btrfs_test_delayed_refs(u32 sectorsize, u32 nodesize)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
