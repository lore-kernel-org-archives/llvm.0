Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC36F9E1;
	Mon, 24 Jul 2023 17:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690220055; x=1721756055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4a5ZXFUaM6toh97BoMkChv5GdlzM4u4g8uVpDMiiNb0=;
  b=nATRzRdVEdlWB4/2S/zFHU733v1NFpyw542Drcuxj3jF6BH4vh8b7flu
   OaBwW1xC12WQ9TzAUAo4na2Md/JD5nRlP2O1F7kBfQHm5c5QGlB/G3En3
   8BHrY+7b3HV2SilPH02YlCQe6nOocAko+FHqRw2T+4PE9S5qYBeSODfhh
   3WMfQ5CKyD1wTZe9n3HqgNoKI+cGpDncDyOd16uHJT9mJr++jukE5+OEX
   4zgmyEYKdBZvUcq6WeQRYeOU32YeZ08QdSC0NXmNZMwEEgRqzNe/pu++u
   fqWei/8ZdmuhvfwFKZY99AEpJiO0Ea5w5HPgeB1YF2AqK5j29qHy4pyjo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="398415580"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="398415580"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 10:34:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="755385765"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="755385765"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 24 Jul 2023 10:34:10 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNzRi-0009uq-0K;
	Mon, 24 Jul 2023 17:34:10 +0000
Date: Tue, 25 Jul 2023 01:33:44 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usama.arif@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/4] mm/memblock: Add hugepage_size member to struct
 memblock_region
Message-ID: <202307250139.EDNyQbWQ-lkp@intel.com>
References: <20230724134644.1299963-3-usama.arif@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724134644.1299963-3-usama.arif@bytedance.com>

Hi Usama,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/mm-hugetlb-Skip-prep-of-tail-pages-when-HVO-is-enabled/20230724-214832
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230724134644.1299963-3-usama.arif%40bytedance.com
patch subject: [RFC 2/4] mm/memblock: Add hugepage_size member to struct memblock_region
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230725/202307250139.EDNyQbWQ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307250139.EDNyQbWQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307250139.EDNyQbWQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/memblock.c:18:
   In file included from include/linux/memblock.h:13:
   In file included from arch/um/include/asm/dma.h:5:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from mm/memblock.c:18:
   In file included from include/linux/memblock.h:13:
   In file included from arch/um/include/asm/dma.h:5:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from mm/memblock.c:18:
   In file included from include/linux/memblock.h:13:
   In file included from arch/um/include/asm/dma.h:5:
   In file included from arch/um/include/asm/io.h:24:
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
>> mm/memblock.c:869:21: warning: no previous prototype for function 'memblock_reserve_huge' [-Wmissing-prototypes]
     869 | int __init_memblock memblock_reserve_huge(phys_addr_t base, phys_addr_t size,
         |                     ^
   mm/memblock.c:869:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     869 | int __init_memblock memblock_reserve_huge(phys_addr_t base, phys_addr_t size,
         | ^
         | static 
   13 warnings generated.


vim +/memblock_reserve_huge +869 mm/memblock.c

   868	
 > 869	int __init_memblock memblock_reserve_huge(phys_addr_t base, phys_addr_t size,
   870						   phys_addr_t hugepage_size)
   871	{
   872		phys_addr_t end = base + size - 1;
   873	
   874		memblock_dbg("%s: [%pa-%pa] %pS\n", __func__,
   875			     &base, &end, (void *)_RET_IP_);
   876	
   877		return memblock_add_range(&memblock.reserved, base, size, MAX_NUMNODES, 0, hugepage_size);
   878	}
   879	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
