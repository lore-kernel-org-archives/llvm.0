Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854DD18B0D;
	Mon, 30 Oct 2023 23:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VDED1g57"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698708056; x=1730244056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yNrnpxPFsgIXiClmbT1btaCqS0UxM2o2UdqIv0rCIto=;
  b=VDED1g57/sTYGwJ9Q8m6SiuYA3vn2OSWMbvgk1NlKUMgK+qsn/MR7flT
   ret7L7soBgfeONx+Ah/nAU5GISRhXLxKOV2qA3CSiFurTr9CHtFZUPGt9
   hQjUWitjBXV/bmeNJ1RkSaSIiKNsw7S49xy54+xa+MSj8iFcHFD0Urn6O
   lFSE2mY1qWEQQBZ/YbUAy8HHoU7HPFih55sZxenf4axok/fLdTLuy9m3X
   h5PMGMbWFOPnJdtwX1vg1kzOTuF7IJZdi4k/f+tO+64fVghBvsrNTVpDL
   13zxxqkwyCK04g0uT14yQbUcivndDOd32G2MKpukJxT2t6uuHIWHkMY38
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="387999076"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="387999076"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 16:20:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="8113504"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Oct 2023 16:20:50 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxbYu-000DeN-0d;
	Mon, 30 Oct 2023 23:20:48 +0000
Date: Tue, 31 Oct 2023 07:20:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 12614/16121] fs/bcachefs/fs-common.c:349:5:
 warning: stack frame size (1048) exceeds limit (1024) in 'bch2_rename_trans'
Message-ID: <202310310710.DqPlsmsZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c503e3eec382ac708ee7adf874add37b77c5d312
commit: 1f2d9192502917a190ef9bbf7541960d129d30fe [12614/16121] bcachefs: iter->update_path
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20231031/202310310710.DqPlsmsZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310310710.DqPlsmsZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310310710.DqPlsmsZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/fs-common.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/bcachefs/fs-common.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/bcachefs/fs-common.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from fs/bcachefs/fs-common.c:5:
   In file included from fs/bcachefs/btree_update.h:5:
   fs/bcachefs/btree_iter.h:192:8: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     192 | static inline int btree_trans_restart(struct btree_trans *trans)
         |        ^
   include/linux/compiler_types.h:215:16: note: expanded from macro 'inline'
     215 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^
>> fs/bcachefs/fs-common.c:349:5: warning: stack frame size (1048) exceeds limit (1024) in 'bch2_rename_trans' [-Wframe-larger-than]
     349 | int bch2_rename_trans(struct btree_trans *trans,
         |     ^
   8 warnings generated.


vim +/bch2_rename_trans +349 fs/bcachefs/fs-common.c

9638574229e3ae Kent Overstreet 2019-10-02  348  
9638574229e3ae Kent Overstreet 2019-10-02 @349  int bch2_rename_trans(struct btree_trans *trans,

:::::: The code at line 349 was first introduced by commit
:::::: 9638574229e3ae0175a46a63431149746c777b3a bcachefs: Factor out fs-common.c

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
