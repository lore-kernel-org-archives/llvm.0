Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA69219A80;
	Sat, 12 Apr 2025 18:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744483131; cv=none; b=t8zu4WQ+Bl7Xjcc/5GtlJfCkpL0WXE0EJspY9sWzxhJHZ4S1AjUJUKRN9atu2LKlEc4vDi9hBXgKwdt3T1J5j2+1uNAPzh4KhX1GKTwVTPp5BMzc3RS9+tchfRUkymspiRZv0HbpRsqxQ8ndlb+OzIeFSDm4Bh0tsQqFYGZcQqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744483131; c=relaxed/simple;
	bh=FvGQGEa/HBNqEGDMqlVr8t3K2ZvgshuyUnByH5SIcbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N7Hw3NiSyEaiKWKRJg/SPoqpd/Y3a1xnkaxOtkzzIdmsE14+7eYNjBu/XCoEgSJoQqAb0d5ey6QLaNOjxBkQgbjcw7lARoRYZegrh5EYWwpKZGFRJ5WcfDj81hUeisnESaKXodbXDlRCVIXjJZNJkPMaszYwHghmrtmv5uGQQUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FRNqzO2Q; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FRNqzO2Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744483129; x=1776019129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FvGQGEa/HBNqEGDMqlVr8t3K2ZvgshuyUnByH5SIcbg=;
  b=FRNqzO2QcDsj+f+yfTpEikjkQwNuZ9rDkjZXffln5Lp39ldExLSUo9bi
   o1RgkbXOnkd1e/tu1JeW7hgl8+heTXoyQIlIyrKbdl1RfJzh0hcCyNFWF
   xSnPSOVX6XeBFOmXqBJMiH1eDB/1mA0WxZYHjFmIhn6Jn/by28pO3J3Tj
   y+83aDPJiV34EfYfcITcxM+tfQOMSCXmARQqgg3DTopOEWKyn22auWoDz
   7fIZVUmwB9dv13GiQr3pLWOHXi12eZ5gqf20J5GbyomUbokZzgVLF6dd3
   71cNH4qcg6XkRJLQzpUDjc52TpRQqdEnF1iYA+NtfNOvA4cPcRwmHK7Mj
   g==;
X-CSE-ConnectionGUID: qdc1pCHCTRCmaEhXLLMC2g==
X-CSE-MsgGUID: WbMJztINRvWLahNjsFtXqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45892590"
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="45892590"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 11:38:48 -0700
X-CSE-ConnectionGUID: QwiBznzeQi+vLisZO5kv+g==
X-CSE-MsgGUID: ca9+CL0ATHSUmY0j40uyKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="166652915"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Apr 2025 11:38:47 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3fka-000C1m-2X;
	Sat, 12 Apr 2025 18:38:44 +0000
Date: Sun, 13 Apr 2025 02:37:44 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:migration 16/16]
 include/linux/page-flags.h:989:40: error: no member named 'type' in 'struct
 page'
Message-ID: <202504130235.Qzo24zR9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux migration
head:   803af5b7e068ea5c68e5b908e799abf3f254c646
commit: 803af5b7e068ea5c68e5b908e799abf3f254c646 [16/16] tmp
config: arm-randconfig-001-20250412 (https://download.01.org/0day-ci/archive/20250413/202504130235.Qzo24zR9-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504130235.Qzo24zR9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504130235.Qzo24zR9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:23:
>> include/linux/page-flags.h:989:40: error: no member named 'type' in 'struct page'
     989 |         const int page_type = data_race(page->type);
         |                                         ~~~~  ^
   include/linux/compiler.h:189:21: note: expanded from macro 'data_race'
     189 |         __auto_type __v = (expr);                                       \
         |                            ^~~~
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:23:
>> include/linux/page-flags.h:1198:67: error: expected ';' after return statement
    1198 |         return PageNonFolioMovable(page) && page_has_non_folio_type(page)
         |                                                                          ^
         |                                                                          ;
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:139:8: note: expanded from macro '_SIG_SET_BINOP'
     139 |                 b3 = b->sig[3]; b2 = b->sig[2];                         \
         |                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here


vim +989 include/linux/page-flags.h

   977	
   978	/**
   979	 * page_has_non_folio_type - test whether the page has a non-folio type
   980	 * @page: The page.
   981	 *
   982	 * Test whether the page has a non-folio type. Helpful to identify pages
   983	 * that might be non-folio movable.
   984	 *
   985	 * Returns true if the page has a non-folio type, otherwise false.
   986	 */
   987	static inline bool page_has_non_folio_type(const struct page *page)
   988	{
 > 989		const int page_type = data_race(page->type);
   990	
   991		return page_type_has_type(page_type) &&
   992		       (page_type >> 24 != PGTY_hugetlb);
   993	}
   994	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
