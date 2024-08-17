Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21904CA6B;
	Sat, 17 Aug 2024 17:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723915011; cv=none; b=Xtuilcpqm0CUg4OCwtfBTfNxwmUbSqg6z9p0LixRsftfYWAD2kBcQ4piMcM3vLkcBAgQt0tAEh3yfs4DDDZglPmejGBgUwo95wR8zSsDC7OvgR3wbO86Ra+l77tiPdG9cCLE0jaxpw9bGpIFsN50+vBfLJiFya6x5dr4ZIzEu/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723915011; c=relaxed/simple;
	bh=iYMjBPhJsoioVV9CJROaNsxxcROM/y3sjF55ial3TCM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CqQDvOWi0QG+8bsJxxObWGJIvL1Is6fo10IMpwWZo9WTDa1PnYiqzuyscG/UAV0dHSuuFAH/LyZWtXSOFClM600LeD6jgR2Or2bYPKSA37uB3lVT0tK2bhsK4tXmWhEhTR9TA37u8PtG65gC4WM3YpyWqym8kCjD6nZqsFoEsM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KWiIgZ/c; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KWiIgZ/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723915009; x=1755451009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iYMjBPhJsoioVV9CJROaNsxxcROM/y3sjF55ial3TCM=;
  b=KWiIgZ/cfQy9tKHgDG2wTXVbeuYzY+OlaKoSf15G4zMD/ezhq9q2ZSZ4
   FN/t3CgIJBhnZ9biKmq+ndsEDBNtB8PrJzF37JUklL5LHCNmFmu/o4rFO
   ip8RH74Efw/YDoPMbAwHkhnPR3CS++c3cVimPmeXez5ffcGkA1FSbFvqW
   VuigXcUDp9MKUGGCrwhqZUqpmqypJWI5IDdN/7W/VfApjU2Ree3O/9XKw
   zPWgTPTnjU1D5dpw+9hWQsArkicLnvQV4YK/cy3i80wV/Ul+6cAlFdlF9
   HTn1Wor9IHAP5japRFuG10ZBs3l9UUEua+6fNtERmhFIhm57PR5hQObeq
   w==;
X-CSE-ConnectionGUID: 3MqLL6JhTq69BCQ+3rTuxw==
X-CSE-MsgGUID: x3PabJUFTGe2bRjxM66yfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="39647173"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="39647173"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 10:16:49 -0700
X-CSE-ConnectionGUID: iiU5ApLKQ9yL32/0QfX/6w==
X-CSE-MsgGUID: KEU2hyaxR2e+wLh+EKdIkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="59971624"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Aug 2024 10:16:48 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfN2j-0007go-0z;
	Sat, 17 Aug 2024 17:16:45 +0000
Date: Sun, 18 Aug 2024 01:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:mm_id 12/12] mm/rmap.c:1185:6: error: assigning to
 'int' from incompatible type 'void'
Message-ID: <202408180147.mIGuGF3L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux mm_id
head:   3d79f5b8dd7c22fa4d00ea6de3e5d3517482dee4
commit: 3d79f5b8dd7c22fa4d00ea6de3e5d3517482dee4 [12/12] page_mapcount
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240818/202408180147.mIGuGF3L-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240818/202408180147.mIGuGF3L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408180147.mIGuGF3L-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/rmap.c:56:
   In file included from include/linux/mm.h:2216:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/rmap.c:59:
   In file included from include/linux/pagemap.h:11:
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
   In file included from mm/rmap.c:59:
   In file included from include/linux/pagemap.h:11:
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
   In file included from mm/rmap.c:59:
   In file included from include/linux/pagemap.h:11:
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
   In file included from mm/rmap.c:77:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/rmap.c:1185:6: error: assigning to 'int' from incompatible type 'void'
    1185 |                 nr = folio_add_large_mapcount(folio, orig_nr_pages, false, vma);
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/rmap.c:1213:6: error: assigning to 'int' from incompatible type 'void'
    1213 |                 nr = folio_inc_large_mapcount(folio, false, vma);
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/rmap.c:1589:6: error: assigning to 'int' from incompatible type 'void'
    1589 |                 nr = folio_sub_large_mapcount(folio, nr_pages, vma);
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/rmap.c:1623:6: error: assigning to 'int' from incompatible type 'void'
    1623 |                 nr = folio_dec_large_mapcount(folio, vma);
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   9 warnings and 4 errors generated.


vim +1185 mm/rmap.c

  1154	
  1155	static __always_inline unsigned int __folio_add_rmap(struct folio *folio,
  1156			struct page *page, int nr_pages, struct vm_area_struct *vma,
  1157			enum rmap_level level, int *nr_pmdmapped)
  1158	{
  1159	#ifdef CONFIG_PAGE_MAPCOUNT
  1160		atomic_t *mapped = &folio->_nr_pages_mapped;
  1161	#endif
  1162		const int orig_nr_pages = nr_pages;
  1163		int first = 0, nr = 0;
  1164	
  1165		__folio_rmap_sanity_checks(folio, page, nr_pages, level);
  1166	
  1167		switch (level) {
  1168		case RMAP_LEVEL_PTE:
  1169			if (!folio_test_large(folio)) {
  1170				nr = atomic_inc_and_test(&folio->_mapcount);
  1171				break;
  1172			}
  1173	
  1174	#ifdef CONFIG_PAGE_MAPCOUNT
  1175			do {
  1176				first += atomic_inc_and_test(&page->_mapcount);
  1177			} while (page++, --nr_pages > 0);
  1178	
  1179			if (first &&
  1180			    atomic_add_return_relaxed(first, mapped) < ENTIRELY_MAPPED)
  1181				nr = first;
  1182	
  1183			folio_add_large_mapcount(folio, orig_nr_pages, false, vma);
  1184	#else /* !CONFIG_PAGE_MAPCOUNT */
> 1185			nr = folio_add_large_mapcount(folio, orig_nr_pages, false, vma);
  1186			if (nr == orig_nr_pages)
  1187				/* Was completely unmapped. */
  1188				nr = folio_large_nr_pages(folio);
  1189			else
  1190				nr = 0;
  1191	#endif /* CONFIG_PAGE_MAPCOUNT */
  1192			break;
  1193		case RMAP_LEVEL_PMD:
  1194			first = atomic_inc_and_test(&folio->_entire_mapcount);
  1195	#ifdef CONFIG_PAGE_MAPCOUNT
  1196			if (first) {
  1197				nr = atomic_add_return_relaxed(ENTIRELY_MAPPED, mapped);
  1198				if (likely(nr < ENTIRELY_MAPPED + ENTIRELY_MAPPED)) {
  1199					*nr_pmdmapped = folio_large_nr_pages(folio);
  1200					nr = *nr_pmdmapped - (nr & FOLIO_PAGES_MAPPED);
  1201					/* Raced ahead of a remove and another add? */
  1202					if (unlikely(nr < 0))
  1203						nr = 0;
  1204				} else {
  1205					/* Raced ahead of a remove of ENTIRELY_MAPPED */
  1206					nr = 0;
  1207				}
  1208			}
  1209			folio_inc_large_mapcount(folio, false, vma);
  1210	#else /* !CONFIG_PAGE_MAPCOUNT */
  1211			if (first)
  1212				*nr_pmdmapped = folio_large_nr_pages(folio);
  1213			nr = folio_inc_large_mapcount(folio, false, vma);
  1214			if (nr == 1)
  1215				/* Was completely unmapped. */
  1216				nr = folio_large_nr_pages(folio);
  1217			else
  1218				nr = 0;
  1219	#endif /* CONFIG_PAGE_MAPCOUNT */
  1220			break;
  1221		}
  1222		return nr;
  1223	}
  1224	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
