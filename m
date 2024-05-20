Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82C910799;
	Mon, 20 May 2024 03:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716174800; cv=none; b=a83I2n8aG3clRac4LRhnvAb1WVrpQZOIhkj9QfagFaz2YkhMyrIdTVk8qHpAXo2hI25mlAxZypiOD4SFL1ymVOeMkSMRu8biIGA736G9wnmfhF3SNjDRXdjXX42IwbBSaVIfq24M3cKzeY/DWI7SeL0l7ZJoHtqAVWfK7YYO/3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716174800; c=relaxed/simple;
	bh=daziMATvgwAR4R0/cAe1UTLzIGq2ycNfLdl2Tp1jyMw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZOU7Hlu3WkskC7DmqKm635t/+172XEVrhv06VK7d81U+fqcYFSkdpddNgJNHcz2fmEeUcvXxAmjNh46yCPbY2ayld20LLGE+YaUo9nujsEq0SuWlygpVX6Sfb/bnOb2ucmO/HCQ7II0SePVuG+Tuqu5oCBv4wqmV+NX9MBjb370=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fzovv5Vw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fzovv5Vw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716174798; x=1747710798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=daziMATvgwAR4R0/cAe1UTLzIGq2ycNfLdl2Tp1jyMw=;
  b=Fzovv5VwUQxDXkM7wLKP80CRs5HTHkL2ca+ad7Alt62BDvub4DiaWWBd
   PhN6F7LUk0LqWaa586oUW5AeJTdBsqqVpP7QspmW3H5Zvgl/MFRstywal
   Adz6DCTe7J8IIUWb2gF5tCtG4FY4E8zKRQLdgjMe1Av8v6ZXH78sKDPgm
   gnxfDFzwHTOgZzUlhXfSbU2U8rcO0lqYX7ii0HBPr5tbQYNx+99VywXgc
   atLh45VtmlpNFsjZ72aAgixLlR6d4K3BJ2gtoCtRDmCDgdjpqwvca6lVz
   sCbNX8m2xJDLb8GbGkYrjchjunczbHl4kf0uUC2K2EAODT79WgOfvhjby
   g==;
X-CSE-ConnectionGUID: EvJaeBbZRO2x4DIWIq4a5g==
X-CSE-MsgGUID: n+y+6WpUTUymZhNoxPY4UQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="12080290"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="12080290"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2024 20:13:18 -0700
X-CSE-ConnectionGUID: dwl66iXMQYqdc+Ql+GTU6g==
X-CSE-MsgGUID: 7JNULlFkR5+Blr9RxxpHDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="36966182"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 19 May 2024 20:13:17 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8tSc-0004YD-2H;
	Mon, 20 May 2024 03:13:14 +0000
Date: Mon, 20 May 2024 11:02:07 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:page_mapcount 3/9] fs/proc/internal.h:172:15:
 error: call to undeclared function 'folio_entire_mapcount'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202405201040.sGy8962n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux page_mapcount
head:   1171bcc67b5d6372f0ebb9a4f6d6a51aa9654090
commit: 1cab4fe6abdd27c1736a35914765ef6358fa45ce [3/9] fs/proc: move page_mapcount() to fs/proc/internal.h
config: um-x86_64_defconfig (https://download.01.org/0day-ci/archive/20240520/202405201040.sGy8962n-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240520/202405201040.sGy8962n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405201040.sGy8962n-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/proc/proc_tty.c:16:
>> fs/proc/internal.h:172:15: error: call to undeclared function 'folio_entire_mapcount'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   mapcount += folio_entire_mapcount(folio);
                               ^
   1 error generated.
--
   In file included from fs/proc/uptime.c:9:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from fs/proc/uptime.c:9:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from fs/proc/uptime.c:9:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   In file included from fs/proc/uptime.c:10:
>> fs/proc/internal.h:172:15: error: call to undeclared function 'folio_entire_mapcount'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   mapcount += folio_entire_mapcount(folio);
                               ^
   12 warnings and 1 error generated.


vim +/folio_entire_mapcount +172 fs/proc/internal.h

   144	
   145	/**
   146	 * folio_precise_page_mapcount() - Number of mappings of this folio page.
   147	 * @folio: The folio.
   148	 * @page: The page.
   149	 *
   150	 * The number of present user page tables that reference this page as tracked
   151	 * via the RMAP: either referenced directly (PTE) or as part of a larger
   152	 * area that covers this page (e.g., PMD).
   153	 *
   154	 * Use this function only for the calculation of existing statistics
   155	 * (USS, PSS, mapcount_max) and for debugging purposes (/proc/kpagecount).
   156	 *
   157	 * Do not add new users.
   158	 *
   159	 * Returns: The number of mappings of this folio page. 0 for
   160	 * folios that are not mapped to user space or are not tracked via the RMAP
   161	 * (e.g., shared zeropage).
   162	 */
   163	static inline int folio_precise_page_mapcount(struct folio *folio,
   164			struct page *page)
   165	{
   166		int mapcount = atomic_read(&page->_mapcount) + 1;
   167	
   168		/* Handle page_has_type() pages */
   169		if (mapcount < PAGE_MAPCOUNT_RESERVE + 1)
   170			mapcount = 0;
   171		if (folio_test_large(folio))
 > 172			mapcount += folio_entire_mapcount(folio);
   173	
   174		return mapcount;
   175	}
   176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
