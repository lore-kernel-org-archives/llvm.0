Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1AD1EB9F2;
	Sun, 22 Feb 2026 08:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771750359; cv=none; b=C0Sy+VLVkOoIvNzEblWEUguHfJB+sw24qoZip+lfs2sXiX0XQi/AN6REJqlOGktZriGvN1Up7k82Dml33eX8kt2cf61s+/zIUfmNRx/4Halxhdp2re6/YAJ6dS+JKlufOw88qRzitvJfRl1Ndhu8+vmOLXiaeSPjnSDLAcl7Tbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771750359; c=relaxed/simple;
	bh=A44LJojZI9oK6v0BSoppQGd3OtvCMUxhtQSKhaFd1J0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fz5EO8kursWp/GuZ9zRprZ8dcOFLAwve7MwzqPDyKC9VoEpeG1cGYFImAnQ0Ffze8uaNCLv4cA9rOEzRXzK+0W6flssw6fOcrQ7Yjepen77u+wX97FY/fHTsa2kP6df25AsxV4GiDSJpxNCMB4dIaTVRV7JEiq5eoIZgXz1dwds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JS6vb0uV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JS6vb0uV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771750357; x=1803286357;
  h=date:from:to:cc:subject:message-id;
  bh=A44LJojZI9oK6v0BSoppQGd3OtvCMUxhtQSKhaFd1J0=;
  b=JS6vb0uV8/EgdLHZxHATYQYF/FaEKdJZdeu8I3hxgvlTvMepKN0lQ/Fa
   Vv1rmRvEXdkcbFrR5H8LSdky6SgFIbFKvuW4QHYtW+m0dLfrTyui5wBZH
   t8oTDTLm4LSq2TSRGY6mqEFzZTtPPfigSxVFXlVO17IPQAB96xibTwLv3
   Vd3WptQ3jTQCPF1TGUH+peFhE7QYr/VfRn9JMdwfvj7hI/aqBQxs5yAVk
   k+q2FsuJygfv6hA7RLIZZiFjPxPqGSVxIkxsfS71j6yWVKTBYtR6TvGkK
   jg2uEMwvXs2T30KD2H1B1qVjWSi2mccQVObvpkjIgKIXrHi7686x+nFTi
   Q==;
X-CSE-ConnectionGUID: gIfauER1RlmHeOQlnY05Nw==
X-CSE-MsgGUID: E1JcnCmcTHynxnQ4OfqQBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="76640652"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="76640652"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 00:52:36 -0800
X-CSE-ConnectionGUID: 20mzLyCCTTCjKVNsNTA+RQ==
X-CSE-MsgGUID: gCXcRy8IS0K3dSjS9Uox9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="219800929"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Feb 2026 00:52:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vu5Ca-000000015Ou-46ZG;
	Sun, 22 Feb 2026 08:52:32 +0000
Date: Sun, 22 Feb 2026 16:52:14 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:private_compression 48/60]
 mm/internal.h:1534:7: error: call to undeclared function 'pte_write'; ISO C99
 and later do not support implicit function declarations
Message-ID: <202602221615.CP75D6Df-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux private_compression
head:   9fa5ffee4fd4726e31f05deebb938cccfa0b460f
commit: 48a8ea8dcaa2781e2ab529cf440334d15dca5512 [48/60] mm/mprotect: NP_OPS_PROTECT_WRITE - gate PTE/PMD write-upgrades
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260222/202602221615.CP75D6Df-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260222/202602221615.CP75D6Df-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602221615.CP75D6Df-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:54:
>> mm/internal.h:1534:7: error: call to undeclared function 'pte_write'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1534 |                 if (pte_write(pte))
         |                     ^
   mm/internal.h:1534:7: note: did you mean 'pgd_write'?
   include/linux/hugetlb.h:475:19: note: 'pgd_write' declared here
     475 | static inline int pgd_write(pgd_t pgd)
         |                   ^
   In file included from mm/filemap.c:54:
>> mm/internal.h:1535:12: error: call to undeclared function 'make_writable_device_private_entry'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1535 |                         entry = make_writable_device_private_entry(
         |                                 ^
>> mm/internal.h:1535:10: error: assigning to 'softleaf_t' (aka 'swp_entry_t') from incompatible type 'int'
    1535 |                         entry = make_writable_device_private_entry(
         |                               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1536 |                                                 page_to_pfn(new));
         |                                                 ~~~~~~~~~~~~~~~~~
>> mm/internal.h:1538:12: error: call to undeclared function 'make_readable_device_private_entry'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1538 |                         entry = make_readable_device_private_entry(
         |                                 ^
   mm/internal.h:1538:10: error: assigning to 'softleaf_t' (aka 'swp_entry_t') from incompatible type 'int'
    1538 |                         entry = make_readable_device_private_entry(
         |                               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1539 |                                                 page_to_pfn(new));
         |                                                 ~~~~~~~~~~~~~~~~~
>> mm/internal.h:1540:9: error: call to undeclared function 'softleaf_to_pte'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1540 |                 pte = softleaf_to_pte(entry);
         |                       ^
>> mm/internal.h:1543:7: error: call to undeclared function 'pte_swp_uffd_wp'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1543 |                 if (pte_swp_uffd_wp(old_pte))
         |                     ^
   mm/internal.h:1543:7: note: did you mean 'pte_swp_uffd_wp_any'?
   include/linux/userfaultfd_k.h:463:20: note: 'pte_swp_uffd_wp_any' declared here
     463 | static inline bool pte_swp_uffd_wp_any(pte_t pte)
         |                    ^
   In file included from mm/filemap.c:54:
>> mm/internal.h:1544:10: error: call to undeclared function 'pte_swp_mkuffd_wp'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1544 |                         pte = pte_swp_mkuffd_wp(pte);
         |                               ^
>> mm/internal.h:1546:9: error: call to undeclared function 'pte_wrprotect'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1546 |                 pte = pte_wrprotect(pte);
         |                       ^
   9 errors generated.
--
   In file included from mm/oom_kill.c:50:
>> mm/internal.h:1534:7: error: call to undeclared function 'pte_write'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1534 |                 if (pte_write(pte))
         |                     ^
>> mm/internal.h:1535:12: error: call to undeclared function 'make_writable_device_private_entry'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1535 |                         entry = make_writable_device_private_entry(
         |                                 ^
>> mm/internal.h:1535:10: error: assigning to 'softleaf_t' (aka 'swp_entry_t') from incompatible type 'int'
    1535 |                         entry = make_writable_device_private_entry(
         |                               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1536 |                                                 page_to_pfn(new));
         |                                                 ~~~~~~~~~~~~~~~~~
>> mm/internal.h:1538:12: error: call to undeclared function 'make_readable_device_private_entry'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1538 |                         entry = make_readable_device_private_entry(
         |                                 ^
   mm/internal.h:1538:10: error: assigning to 'softleaf_t' (aka 'swp_entry_t') from incompatible type 'int'
    1538 |                         entry = make_readable_device_private_entry(
         |                               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1539 |                                                 page_to_pfn(new));
         |                                                 ~~~~~~~~~~~~~~~~~
>> mm/internal.h:1540:9: error: call to undeclared function 'softleaf_to_pte'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1540 |                 pte = softleaf_to_pte(entry);
         |                       ^
>> mm/internal.h:1543:7: error: call to undeclared function 'pte_swp_uffd_wp'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1543 |                 if (pte_swp_uffd_wp(old_pte))
         |                     ^
   mm/internal.h:1543:7: note: did you mean 'pte_swp_uffd_wp_any'?
   include/linux/userfaultfd_k.h:463:20: note: 'pte_swp_uffd_wp_any' declared here
     463 | static inline bool pte_swp_uffd_wp_any(pte_t pte)
         |                    ^
   In file included from mm/oom_kill.c:50:
>> mm/internal.h:1544:10: error: call to undeclared function 'pte_swp_mkuffd_wp'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1544 |                         pte = pte_swp_mkuffd_wp(pte);
         |                               ^
>> mm/internal.h:1546:9: error: call to undeclared function 'pte_wrprotect'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1546 |                 pte = pte_wrprotect(pte);
         |                       ^
   9 errors generated.


vim +/pte_write +1534 mm/internal.h

  1509	
  1510	/**
  1511	 * folio_managed_fixup_migration_pte - Fixup PTE after migration for
  1512	 *                                     managed memory pages.
  1513	 * @new: the destination page
  1514	 * @pte: the PTE being installed (normal PTE built by caller)
  1515	 * @old_pte: the original PTE (before migration, for swap entry flags)
  1516	 * @vma: the VMA
  1517	 *
  1518	 * For MEMORY_DEVICE_PRIVATE pages: replaces the PTE with a device-private
  1519	 * swap entry, preserving soft_dirty and uffd_wp from old_pte.
  1520	 *
  1521	 * For N_MEMORY_PRIVATE pages with NP_OPS_PROTECT_WRITE: strips the write
  1522	 * bit so the next write triggers the fault handler for promotion.
  1523	 *
  1524	 * For normal pages: returns pte unmodified.
  1525	 */
  1526	static inline pte_t folio_managed_fixup_migration_pte(struct page *new,
  1527							      pte_t pte,
  1528							      pte_t old_pte,
  1529							      struct vm_area_struct *vma)
  1530	{
  1531		if (unlikely(is_device_private_page(new))) {
  1532			softleaf_t entry;
  1533	
> 1534			if (pte_write(pte))
> 1535				entry = make_writable_device_private_entry(
  1536							page_to_pfn(new));
  1537			else
> 1538				entry = make_readable_device_private_entry(
  1539							page_to_pfn(new));
> 1540			pte = softleaf_to_pte(entry);
  1541			if (pte_swp_soft_dirty(old_pte))
  1542				pte = pte_swp_mksoft_dirty(pte);
> 1543			if (pte_swp_uffd_wp(old_pte))
> 1544				pte = pte_swp_mkuffd_wp(pte);
  1545		} else if (folio_managed_wrprotect(page_folio(new))) {
> 1546			pte = pte_wrprotect(pte);
  1547		}
  1548		return pte;
  1549	}
  1550	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
