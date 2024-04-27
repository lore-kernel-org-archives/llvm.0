Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0583BBD2;
	Sat, 27 Apr 2024 07:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714202613; cv=none; b=NVwjdR/5os0aZPwZf5TNBijKtb37VvZh6L0l7ADfCYJfRSdJi5mRk7jJj44ePSI8PPvol9yBoW8NPq8RAWBpc/xQD6vHn9UCXRKEzEnIQSG95BAlDTrKKjjehGbkRWMU3rcjSBS+sjnZaZd1Mj8JUp0bajiVtX3SmyAL7cu1ocs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714202613; c=relaxed/simple;
	bh=RPm2XP32BCDPQzjVArvY0800OJdpqTLc1x+QG2YEoNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKjJJ7DPN+aZU8looLFWCxWq34RZNknIsulMnqjJVc6RzWL5M5nLDBCOJi/e6rAu2sl5FGTcRHU2zu7CIFVGKOZIvSi9tcoxGgzAr1N3uPH+ifxFoIfWZUZNKor4rNJ3qoGxtb+tPrNiB/qHLNIV58FOfkb5cHu3PxQOuUXSgJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IqU/nvGp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IqU/nvGp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714202611; x=1745738611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RPm2XP32BCDPQzjVArvY0800OJdpqTLc1x+QG2YEoNs=;
  b=IqU/nvGprJdHt6HEEacM9jr9JwvoXHMvj5Nlxq44lrxvc7HUVgjm8KGj
   c9Tg8y/IG0TXEBiqUxIzDEaiBHvQKu1S+WIsPngBw6GTgQ39LHEuXcxfL
   s0pRC8Xi87XXtePZX/SnNGOryV7KSRo6t0nx9kl3PpqzlsGni9qZ6ePMu
   3l+K+TDu4YV61OaNiC+xYfDpehTCv9NmFyt/YS0GILs62ESz6BNsjXpx0
   mfxi3kINSeIYVRN3wadc/cXplNFzf31dNMBBvCjYV/7/qU/n6F/sJ592e
   EDHXJ/ALVWXbHQGS9DJQ6RlomlZ+xaroSYpSlPhUphXHQAPih4YqvUeqh
   w==;
X-CSE-ConnectionGUID: yXngHpL3TFiaWOm8J+rnuQ==
X-CSE-MsgGUID: 1UXrn80LQNujvkhIhkf10g==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="32440473"
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="32440473"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 00:23:31 -0700
X-CSE-ConnectionGUID: G99nj9nQRj+Mcr3cakxJzg==
X-CSE-MsgGUID: tLg9q/dyRWWoHpu6IOC4rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="25605193"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Apr 2024 00:23:27 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0cP6-0004ks-0V;
	Sat, 27 Apr 2024 07:23:24 +0000
Date: Sat, 27 Apr 2024 15:23:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	willy@infradead.org, David Hildenbrand <david@redhat.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	Vishal Moola <vishal.moola@gmail.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v2 01/10] mm: memory_hotplug: check hwpoisoned page
 firstly in do_migrate_range()
Message-ID: <202404271547.obYnCedG-lkp@intel.com>
References: <20240425084028.3888403-2-wangkefeng.wang@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425084028.3888403-2-wangkefeng.wang@huawei.com>

Hi Kefeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/mm-memory_hotplug-check-hwpoisoned-page-firstly-in-do_migrate_range/20240425-164317
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240425084028.3888403-2-wangkefeng.wang%40huawei.com
patch subject: [PATCH v2 01/10] mm: memory_hotplug: check hwpoisoned page firstly in do_migrate_range()
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240427/202404271547.obYnCedG-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404271547.obYnCedG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404271547.obYnCedG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/memory_hotplug.c:9:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/memory_hotplug.c:30:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/memory_hotplug.c:34:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
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
   In file included from mm/memory_hotplug.c:34:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from mm/memory_hotplug.c:34:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:78:
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
>> mm/memory_hotplug.c:1786:13: error: call to undeclared function 'hugetlb_page_mapping_lock_write'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1786 |                 mapping = hugetlb_page_mapping_lock_write(&folio->page);
         |                           ^
   mm/memory_hotplug.c:1786:13: note: did you mean 'hugetlb_folio_mapping_lock_write'?
   include/linux/hugetlb.h:181:23: note: 'hugetlb_folio_mapping_lock_write' declared here
     181 | struct address_space *hugetlb_folio_mapping_lock_write(struct folio *folio);
         |                       ^
>> mm/memory_hotplug.c:1786:11: error: incompatible integer to pointer conversion assigning to 'struct address_space *' from 'int' [-Wint-conversion]
    1786 |                 mapping = hugetlb_page_mapping_lock_write(&folio->page);
         |                         ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   19 warnings and 2 errors generated.


vim +/hugetlb_page_mapping_lock_write +1786 mm/memory_hotplug.c

  1774	
  1775	static bool isolate_and_unmap_hwposion_folio(struct folio *folio)
  1776	{
  1777		if (WARN_ON(folio_test_lru(folio)))
  1778			folio_isolate_lru(folio);
  1779	
  1780		if (!folio_mapped(folio))
  1781			return true;
  1782	
  1783		if (folio_test_hugetlb(folio) && !folio_test_anon(folio)) {
  1784			struct address_space *mapping;
  1785	
> 1786			mapping = hugetlb_page_mapping_lock_write(&folio->page);
  1787			if (mapping) {
  1788				/*
  1789				 * In shared mappings, try_to_unmap could potentially
  1790				 * call huge_pmd_unshare.  Because of this, take
  1791				 * semaphore in write mode here and set TTU_RMAP_LOCKED
  1792				 * to let lower levels know we have taken the lock.
  1793				 */
  1794				try_to_unmap(folio, TTU_IGNORE_MLOCK | TTU_RMAP_LOCKED);
  1795				i_mmap_unlock_write(mapping);
  1796			}
  1797		} else {
  1798			try_to_unmap(folio, TTU_IGNORE_MLOCK);
  1799		}
  1800	
  1801		return folio_mapped(folio);
  1802	}
  1803	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
