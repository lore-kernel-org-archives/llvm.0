Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE83773530;
	Sun, 28 Apr 2024 18:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714327906; cv=none; b=J2YAQZiJokhbe6pyMizT9W0h78KHhisxhuepIb5QHto7pT7RCqn4yHNjQbhjIh4PPbx4OyKjaI/HInuzMBUVRRlPJDoGeSQV8SIDMNFw/K15t22CMdmRczK0AGIXy7U9CQUf1Kn9bPwVs/sba+PaGpvRZAr0Yy4H/UqstgYL5Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714327906; c=relaxed/simple;
	bh=hq4tWay3zTxCJG51kYwzKjv0UjEYn9Os1tfxB5I4KKI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OH5Bdo6TDyYlK+MyH/wfryhiUB3QK4w/ghFRlq9mKLGCNaFKk/SLoycUv4uM1wcADLHUXefdC+jdpOlHXEnNmF4y4e6g2vlnQlR08Wa3Z4uIFGITaxf/S2hRjNN7QLFvQlELFHaIIdTZrwDLFixE0W+ln9CPXq6cNjyQ2qSPe3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G2AgAEHE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G2AgAEHE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714327904; x=1745863904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hq4tWay3zTxCJG51kYwzKjv0UjEYn9Os1tfxB5I4KKI=;
  b=G2AgAEHE/pw+K563TLH3xJoAw+T+DI8wDwOS+n9OIuwbp35vKNwPt8xe
   ptUcohpTM5l2wilbeaFPnNgjmbQ4ucr91P6eFIrsAfgONzvdOuX/NQV0E
   YTQzCrFIAckf0Fe6HveBV/Jduxnjm0saWRXDUDWMn9a6wE39e8pQXEXy9
   OAhoAkO+EJs7F4U7hATlg2oeMkjisqyGypzULqEpd5VVZgoS1XvyInBLR
   J9NOJJkFIU8w6o8iNWoRGvz6zcamGPICborsFB4ORcQj0QHz+DghO1nND
   6dy0hP22SfH7zs/bTuuIIdcVhcyhYa6DbczF6eXcu4BGrA9yzS5a9lk6G
   w==;
X-CSE-ConnectionGUID: FgzqChGRT7Kb80aX1aAIkw==
X-CSE-MsgGUID: NP1ITBDkSLqZt77TC4a8MQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="20544757"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="20544757"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 11:11:41 -0700
X-CSE-ConnectionGUID: dTzemWXKTtuMNRFloJWqlA==
X-CSE-MsgGUID: glaYrnigTDaQY7QOdhzp1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="26313813"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Apr 2024 11:11:39 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s18zx-0006Xg-14;
	Sun, 28 Apr 2024 18:11:37 +0000
Date: Mon, 29 Apr 2024 02:11:16 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_v3 14/16] net/sched/em_meta.c:593:43:
 error: passing 'const struct page_frag_cache *' to parameter of type 'struct
 page_frag_cache *' discards qualifiers
Message-ID: <202404290256.p4jVY7IB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_v3
head:   245e8a4d98fee0307884585dbeb3dbb7ee1bf8fa
commit: 49d60804ba15895c09e4b47eb20fdc8b56ed6878 [14/16] net: replace page_frag with page_frag_cache
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240429/202404290256.p4jVY7IB-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404290256.p4jVY7IB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404290256.p4jVY7IB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/sched/em_meta.c:64:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from net/sched/em_meta.c:64:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from net/sched/em_meta.c:64:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from net/sched/em_meta.c:64:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> net/sched/em_meta.c:593:43: error: passing 'const struct page_frag_cache *' to parameter of type 'struct page_frag_cache *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     593 |         dst->value = page_frag_cache_page_offset(&sk->sk_frag);
         |                                                  ^~~~~~~~~~~~
   include/linux/page_frag_cache.h:41:80: note: passing argument to parameter 'nc' here
      41 | static inline unsigned int page_frag_cache_page_offset(struct page_frag_cache *nc)
         |                                                                                ^
   7 warnings and 1 error generated.


vim +593 net/sched/em_meta.c

   584	
   585	META_COLLECTOR(int_sk_sendmsg_off)
   586	{
   587		const struct sock *sk = skb_to_full_sk(skb);
   588	
   589		if (!sk) {
   590			*err = -1;
   591			return;
   592		}
 > 593		dst->value = page_frag_cache_page_offset(&sk->sk_frag);
   594	}
   595	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
