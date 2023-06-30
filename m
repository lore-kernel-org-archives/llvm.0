Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F73810796;
	Fri, 30 Jun 2023 12:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688129609; x=1719665609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PxUMpZkIYAbj5iq4AgwjkY7R767xjM4SSNQxVRHClf0=;
  b=QsgYISyKI+I6QhWXYZYpMa/2pNiVwhJJBiW8Qli5MV9wh4Z3oMyLq3Dd
   VfvDjDpZvhVurIVdft9buS6wBwilOQ4nqw074ksxCwI6HJuaRQ1xN6LaW
   gSCNPCjhwR+ekWWqg/ZQPmWqfDJgoKEySO6FKt5znbM6yxNj1eZkBJQc+
   moQTScyy31o0P3XPspr41UQUNjSWXlj/ON7P0+kN7oaqdEq5J+RP82hct
   gU0NnUidqM7y/ruM6PSGLzHuUFw9vaOAa+l9/4gVAQPy4A7nQfZykm6fM
   IOz4k7wgOtc8LQkXP0CnVTgb6jU0nydM6KC6AkNXNzn0I4dJep2VDKqIH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="393112182"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="393112182"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 05:53:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="720949144"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="720949144"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Jun 2023 05:53:26 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFDcs-000EyI-00;
	Fri, 30 Jun 2023 12:53:26 +0000
Date: Fri, 30 Jun 2023 20:53:10 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-extract 18/20] net/sched/cls_flow.c:64:52: warning:
 shift count >= width of type
Message-ID: <202306302045.SH3UCJnL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-extract
head:   19ee2529bb48ab3bba1d2cfc7a0811ae08a22505
commit: b466221531e2d73043d4b1abe1bbea1dfc38cde8 [18/20] net: [WIP] Mark each skb_frags as to how they should be cleaned up
config: hexagon-randconfig-r045-20230629 (https://download.01.org/0day-ci/archive/20230630/202306302045.SH3UCJnL-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306302045.SH3UCJnL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306302045.SH3UCJnL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/sched/cls_flow.c:14:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from net/sched/cls_flow.c:14:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from net/sched/cls_flow.c:14:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from net/sched/cls_flow.c:14:
   include/linux/skbuff.h:405:29: error: use of undeclared identifier 'FOLL_PIN'
     405 |         cleanup_mode &= FOLL_GET | FOLL_PIN;
         |                                    ^
   include/linux/skbuff.h:2475:8: error: no member named 'bv_offset' in 'struct skb_frag'; did you mean 'offset'?
    2475 |         frag->bv_offset = off;
         |               ^~~~~~~~~
         |               offset
   include/linux/skbuff.h:366:15: note: 'offset' declared here
     366 |         unsigned int    offset;
         |                         ^
   include/linux/skbuff.h:3454:2: error: call to undeclared function 'try_grab_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3454 |         try_grab_page(page, skb_frag_cleanup(frag));
         |         ^
   include/linux/skbuff.h:3454:2: note: did you mean 'try_get_page'?
   include/linux/mm.h:1396:33: note: 'try_get_page' declared here
    1396 | static inline __must_check bool try_get_page(struct page *page)
         |                                 ^
   In file included from net/sched/cls_flow.c:14:
   include/linux/skbuff.h:3478:2: error: call to undeclared function 'page_put_unpin'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3478 |         page_put_unpin(page, skb_frag_cleanup(frag));
         |         ^
   include/linux/skbuff.h:3478:2: note: did you mean 'page_put_link'?
   include/linux/fs.h:2887:13: note: 'page_put_link' declared here
    2887 | extern void page_put_link(void *);
         |             ^
>> net/sched/cls_flow.c:64:52: warning: shift count >= width of type [-Wshift-count-overflow]
      64 |         return (a & 0xFFFFFFFF) ^ (BITS_PER_LONG > 32 ? a >> 32 : 0);
         |                                                           ^  ~~
   7 warnings and 4 errors generated.


vim +64 net/sched/cls_flow.c

e5dfb815181fcb Patrick McHardy 2008-01-31  59  
e5dfb815181fcb Patrick McHardy 2008-01-31  60  static inline u32 addr_fold(void *addr)
e5dfb815181fcb Patrick McHardy 2008-01-31  61  {
e5dfb815181fcb Patrick McHardy 2008-01-31  62  	unsigned long a = (unsigned long)addr;
e5dfb815181fcb Patrick McHardy 2008-01-31  63  
e5dfb815181fcb Patrick McHardy 2008-01-31 @64  	return (a & 0xFFFFFFFF) ^ (BITS_PER_LONG > 32 ? a >> 32 : 0);
e5dfb815181fcb Patrick McHardy 2008-01-31  65  }
e5dfb815181fcb Patrick McHardy 2008-01-31  66  

:::::: The code at line 64 was first introduced by commit
:::::: e5dfb815181fcb186d6080ac3a091eadff2d98fe [NET_SCHED]: Add flow classifier

:::::: TO: Patrick McHardy <kaber@trash.net>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
