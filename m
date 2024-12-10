Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB6E4A04;
	Tue, 10 Dec 2024 14:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733842007; cv=none; b=aBVwqSDYHYoMNdtWRxs0vWUr1Jky16HD+q0F3O2WMhvisoh+NBz9rarDIntBlVET+pQLZjQ1aPI6nGK5W2vkebj3rstYQ/a1lEv+UmUpPi7so5uAujEGsqBMSzus62BVlyERTKmdKAIOfP0NIqgkteqWvRDNDudyZkkrWxyIerU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733842007; c=relaxed/simple;
	bh=KEuX9yO3Tlg2T6IyBe07R2Ir2smZ7skmsXi+epUPdVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kHLByDhb+7RfW+BumhiAX3OoDQdb8zkV+Jew/ER/sZscOeKXDZiWvv9xI3CoVBeA+WEkRE/knqGYW3dhIIPD+Uz/li1x/HYT4IfGIamuPpfDd2jhOg/XFek0AO6ILBRsE95tbSQ8mvTMJyRDMomcbDshnP90OR/D8mGGSNsidHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BQOqBtj3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQOqBtj3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733842006; x=1765378006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KEuX9yO3Tlg2T6IyBe07R2Ir2smZ7skmsXi+epUPdVE=;
  b=BQOqBtj36Yba/9ikrBQEfpn8k5/jTm2sGUoTIS/XxN20PRqzG0HfiLQC
   ouESYKza2B2Barj/keV7WHfBAQPmXXybu+KoMGYgte8WEb7B67QDaNAl0
   Mbl8xC3xM48rp3jpeON7wu0yvfpU2IZxIdINBkJaDT/yb/0gmNGURB4MV
   /Fs980TIDA8BBE3T4UjippRzz6n+mZPBeJliRMO4LJ3AHRro+Kanqr250
   hILdlYPFgB5Ip4F7YTr2oE4CalEEz/u/Xe5X3gnuQtpqbKJ5/epmz5zQs
   ru6cT7mMMetB7nyq7doKliyV3K3AqgIod/fjihmQslwCUucBE8h577uAH
   w==;
X-CSE-ConnectionGUID: /Zqp0ytBRrmDmT2GP/sliQ==
X-CSE-MsgGUID: WKH40IUHSHSfvjaXEreZtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33918590"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="33918590"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 06:46:45 -0800
X-CSE-ConnectionGUID: stHi8GtPQyekD/04BO+EOw==
X-CSE-MsgGUID: xndMboYESWm7EQ3rbsisLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="95264820"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Dec 2024 06:46:44 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tL1VZ-0005ft-2V;
	Tue, 10 Dec 2024 14:46:41 +0000
Date: Tue, 10 Dec 2024 22:46:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 2346/2656] fs/bcachefs/str_hash.c:182:5: warning:
 stack frame size (1072) exceeds limit (1024) in '__bch2_str_hash_check_key'
Message-ID: <202412102226.7MkGocdP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1b2ab8149928c1cea2d7eca30cd35bb7fe014053
commit: 2519d3b0d656d1a3106bc2c1f23c178f83570607 [2346/2656] bcachefs: bch2_str_hash_check_key() now checks inode hash info
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241210/202412102226.7MkGocdP-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412102226.7MkGocdP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412102226.7MkGocdP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/str_hash.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/bcachefs/str_hash.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
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
   In file included from fs/bcachefs/str_hash.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
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
   In file included from fs/bcachefs/str_hash.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
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
   fs/bcachefs/str_hash.c:164:2: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     164 |         struct bch_inode_unpacked inode;
         |         ^
>> fs/bcachefs/str_hash.c:182:5: warning: stack frame size (1072) exceeds limit (1024) in '__bch2_str_hash_check_key' [-Wframe-larger-than]
     182 | int __bch2_str_hash_check_key(struct btree_trans *trans,
         |     ^
   9 warnings generated.


vim +/__bch2_str_hash_check_key +182 fs/bcachefs/str_hash.c

   181	
 > 182	int __bch2_str_hash_check_key(struct btree_trans *trans,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
