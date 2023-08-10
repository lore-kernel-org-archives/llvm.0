Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE3F6AB6;
	Thu, 10 Aug 2023 23:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691710406; x=1723246406;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=frMEM46fLSR0HtEX3kY3yZgIvcX89FvVK6JcSuWR7A4=;
  b=hvXbY8d1gI3QPo8WLjzlf4ya5JiL29WQGwJk8H3zVNkMlSOSuwOLv6ry
   YRL+V4QJVb/qC04B+BKRAzO1nlObc5puMDHAk9SFTB8mNSVWeb3BvDx3h
   tVxLR/Xzn6olWCRk9NzhOnsxZFoI6QLj9hw6uI7y/Zwyk0De6csjU2+xN
   CU8hYkGi6GhFmuS9LbiEfvJZ/A0B8CBQ2VqbA6Iefw0IdeVdLWRnzYL5q
   nBI+EguZofC2DRlrldCk4bvESxxeK6NUzLGW2y8Le1EeHWN6Nf++FlBMU
   +hLp+EVaTY1rsZC6D6kRatejMG6EjRsIJbZDPXPulJVjZWDJorL5tvRLK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="370448000"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="370448000"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 16:33:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="726024219"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="726024219"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Aug 2023 16:33:23 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUF9e-0007Ku-31;
	Thu, 10 Aug 2023 23:33:22 +0000
Date: Fri, 11 Aug 2023 07:32:30 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Xu <peterx@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] mm: Properly document tail pages for compound pages
Message-ID: <202308110731.UFaTZGhn-lkp@intel.com>
References: <20230810204944.53471-1-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810204944.53471-1-peterx@redhat.com>

Hi Peter,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Xu/mm-Properly-document-tail-pages-for-compound-pages/20230811-045015
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230810204944.53471-1-peterx%40redhat.com
patch subject: [PATCH RFC] mm: Properly document tail pages for compound pages
config: s390-randconfig-r033-20230811 (https://download.01.org/0day-ci/archive/20230811/202308110731.UFaTZGhn-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308110731.UFaTZGhn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308110731.UFaTZGhn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
>> include/linux/mm_types.h:436:1: error: static assertion failed due to requirement '__builtin_offsetof(struct folio, _flags_2) == __builtin_offsetof(struct page, flags) + 2 * sizeof(struct page)': offsetof(struct folio, _flags_2) == offsetof(struct page, flags) + 2 * sizeof(struct page)
   FOLIO_MATCH(flags, _flags_2);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:434:2: note: expanded from macro 'FOLIO_MATCH'
           static_assert(offsetof(struct folio, fl) ==                     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                           ^              ~~~~
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
>> include/linux/mm_types.h:437:1: error: static assertion failed due to requirement '__builtin_offsetof(struct folio, _head_2) == __builtin_offsetof(struct page, compound_head) + 2 * sizeof(struct page)': offsetof(struct folio, _head_2) == offsetof(struct page, compound_head) + 2 * sizeof(struct page)
   FOLIO_MATCH(compound_head, _head_2);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:434:2: note: expanded from macro 'FOLIO_MATCH'
           static_assert(offsetof(struct folio, fl) ==                     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                           ^              ~~~~
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
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
   In file included from arch/s390/include/asm/io.h:78:
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
   In file included from arch/s390/include/asm/io.h:78:
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
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:609:
   In file included from arch/s390/include/asm/hw_irq.h:6:
   In file included from include/linux/pci.h:37:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:454:22: warning: array index 3 is past the end of the array (which contains 1 element) [-Warray-bounds]
           case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
                               ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:609:
   In file included from arch/s390/include/asm/hw_irq.h:6:
   In file included from include/linux/pci.h:37:


vim +436 include/linux/mm_types.h

7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  412) 
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  413) #define FOLIO_MATCH(pg, fl)						\
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  414) 	static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  415) FOLIO_MATCH(flags, flags);
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  416) FOLIO_MATCH(lru, lru);
536f4217ced62b Wei Yang                2022-01-29  417  FOLIO_MATCH(mapping, mapping);
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  418) FOLIO_MATCH(compound_head, lru);
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  419) FOLIO_MATCH(index, index);
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  420) FOLIO_MATCH(private, private);
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  421) FOLIO_MATCH(_mapcount, _mapcount);
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  422) FOLIO_MATCH(_refcount, _refcount);
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  423) #ifdef CONFIG_MEMCG
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  424) FOLIO_MATCH(memcg_data, memcg_data);
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  425) #endif
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  426) #undef FOLIO_MATCH
379708ffde1b04 Matthew Wilcox (Oracle  2022-09-02  427) #define FOLIO_MATCH(pg, fl)						\
379708ffde1b04 Matthew Wilcox (Oracle  2022-09-02  428) 	static_assert(offsetof(struct folio, fl) ==			\
379708ffde1b04 Matthew Wilcox (Oracle  2022-09-02  429) 			offsetof(struct page, pg) + sizeof(struct page))
379708ffde1b04 Matthew Wilcox (Oracle  2022-09-02  430) FOLIO_MATCH(flags, _flags_1);
dad6a5eb555648 Hugh Dickins            2022-11-02  431  FOLIO_MATCH(compound_head, _head_1);
379708ffde1b04 Matthew Wilcox (Oracle  2022-09-02  432) #undef FOLIO_MATCH
dad6a5eb555648 Hugh Dickins            2022-11-02  433  #define FOLIO_MATCH(pg, fl)						\
dad6a5eb555648 Hugh Dickins            2022-11-02  434  	static_assert(offsetof(struct folio, fl) ==			\
dad6a5eb555648 Hugh Dickins            2022-11-02  435  			offsetof(struct page, pg) + 2 * sizeof(struct page))
dad6a5eb555648 Hugh Dickins            2022-11-02 @436  FOLIO_MATCH(flags, _flags_2);
dad6a5eb555648 Hugh Dickins            2022-11-02 @437  FOLIO_MATCH(compound_head, _head_2);
dad6a5eb555648 Hugh Dickins            2022-11-02  438  #undef FOLIO_MATCH
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  439) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
