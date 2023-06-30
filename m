Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8A4C8DF;
	Fri, 30 Jun 2023 11:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688125767; x=1719661767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pH/uCHK9G9aEbRR0qSghGciP5iMmQmA4dJLFpAO+SQM=;
  b=GgnGwxMSZzbAfI3ibLpQfb7AlaDtKRt58FfBxOcGZwqtq7zgc6ndEuFE
   fv57kvN+cbvYMICC8cCwFpdu0uxV6f3wjucNDfGloF6aMyvkUlsezRa7N
   /vgan4aRWWlJuWwcb1LbsgRVk2NTH1FA61IL0ktkhQ0MVpkGGMCCpLgiE
   0N3dqRD5XtLMiK5Uircd+s0XKFsT4W2mbYusVQvZtnyMVw6NjFkvqa9a5
   2+zufj1YYtKAg5K+KYFJdTrJuPv0II8dq+hv5vVU8jMpI2DliD5hhTSYr
   kt/V8cGmlwC5/plp2GFXb/WL2q3g3PVxIEajh4KIh6JUJEefXiJMbD26T
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="342714961"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="342714961"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 04:49:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="891733807"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="891733807"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 Jun 2023 04:49:24 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFCcu-000Evt-0U;
	Fri, 30 Jun 2023 11:49:24 +0000
Date: Fri, 30 Jun 2023 19:48:54 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-extract 18/20] include/linux/skbuff.h:405:29:
 error: use of undeclared identifier 'FOLL_PIN'
Message-ID: <202306301958.Fsoo0W6g-lkp@intel.com>
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
config: s390-randconfig-r023-20230630 (https://download.01.org/0day-ci/archive/20230630/202306301958.Fsoo0W6g-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306301958.Fsoo0W6g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306301958.Fsoo0W6g-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:41:
   In file included from include/linux/kvm_para.h:5:
   In file included from include/uapi/linux/kvm_para.h:37:
   In file included from arch/s390/include/asm/kvm_para.h:25:
   In file included from arch/s390/include/asm/diag.h:12:
   In file included from include/linux/if_ether.h:19:
>> include/linux/skbuff.h:405:29: error: use of undeclared identifier 'FOLL_PIN'
           cleanup_mode &= FOLL_GET | FOLL_PIN;
                                      ^
>> include/linux/skbuff.h:2475:8: error: no member named 'bv_offset' in 'struct skb_frag'; did you mean 'offset'?
           frag->bv_offset = off;
                 ^~~~~~~~~
                 offset
   include/linux/skbuff.h:366:15: note: 'offset' declared here
           unsigned int    offset;
                           ^
>> include/linux/skbuff.h:3454:2: error: call to undeclared function 'try_grab_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           try_grab_page(page, skb_frag_cleanup(frag));
           ^
   include/linux/skbuff.h:3454:2: note: did you mean 'try_get_page'?
   include/linux/mm.h:1396:33: note: 'try_get_page' declared here
   static inline __must_check bool try_get_page(struct page *page)
                                   ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:41:
   In file included from include/linux/kvm_para.h:5:
   In file included from include/uapi/linux/kvm_para.h:37:
   In file included from arch/s390/include/asm/kvm_para.h:25:
   In file included from arch/s390/include/asm/diag.h:12:
   In file included from include/linux/if_ether.h:19:
>> include/linux/skbuff.h:3478:2: error: call to undeclared function 'page_put_unpin'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           page_put_unpin(page, skb_frag_cleanup(frag));
           ^
   include/linux/skbuff.h:3478:2: note: did you mean 'page_put_link'?
   include/linux/fs.h:2887:13: note: 'page_put_link' declared here
   extern void page_put_link(void *);
               ^
   12 warnings and 4 errors generated.
   make[2]: *** [scripts/Makefile.build:114: arch/s390/kernel/asm-offsets.s] Error 1 shuffle=2117999504
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1294: prepare0] Error 2 shuffle=2117999504
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:227: __sub-make] Error 2 shuffle=2117999504
   make: Target 'prepare' not remade because of errors.


vim +/FOLL_PIN +405 include/linux/skbuff.h

   392	
   393	/**
   394	 * __skb_frag_set_page() - Sets the page in an skb fragment
   395	 * @frag: skb fragment
   396	 * @page: The page to set
   397	 * @cleanup_mode: The cleanup mode to set (0, FOLL_GET, FOLL_PIN)
   398	 *
   399	 * Sets the fragment @frag to contain @page with the specified method of
   400	 * cleaning it up.
   401	 */
   402	static inline void __skb_frag_set_page(skb_frag_t *frag, struct page *page,
   403					       unsigned int cleanup_mode)
   404	{
 > 405		cleanup_mode &= FOLL_GET | FOLL_PIN;
   406		frag->page_and_mode = (unsigned long)page | cleanup_mode;
   407	}
   408	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
