Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518FC13D53D;
	Fri, 25 Oct 2024 02:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729822721; cv=none; b=IH8TuHXYu4pU4JpYfjdb5Kvu/T1vfmvR0GmBumLGerct8smmeMXsuaJrUd0Y/g9gzLe/ZNELd+E/6QIVlm5rtiP08nMlvbhW53ThmHjKPb7mYBEJ46ZdW3lnwcwesIA/BHGXz1PsX8oLDrfyXL/QmGjINPsnmLPBsUD3cgL0VmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729822721; c=relaxed/simple;
	bh=azrymmLvhtuecaJkl4vkmJh88Vgz+F6cJb/5S7DEFMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JaSg6bfPYcMiFlcbcOyhPTpZ216f/h1ws/l4Gps/sz6xXllsGHyTXg9NF7B3Hm70MmUtVxr0nQDTnNthbh01owPsbdU1fPekvQpV1B0n2QRHvA7NrOzeEtaDVc3Q3wY2nJYIzzLl7EOq6Kvpjdi48FpQRy2rM2U1hGCxvXY5JCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ejwfIm00; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ejwfIm00"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729822719; x=1761358719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=azrymmLvhtuecaJkl4vkmJh88Vgz+F6cJb/5S7DEFMc=;
  b=ejwfIm00F15nDbUGs0N52XgmyERVugSlbyjlbLMIrmnH7T04KWiL4aCI
   b/xdRcPouCHm8nlCNjmlBKVACf74hvfAbFd745yJPtWuLhDrKQU2VBb4J
   d0blwBis3rbi9EzfY5Dl8hC69xe96rj2Bn1GylA7X1VLdQQPKZNwMmChl
   8DoeRr/biuFGmnAqTzkDnSsUflBrlxM8p1nLkQPeTi7jo85MXHYsv09nR
   SA+cww9pzOQvSiYCpFq+SlYzOVsIU8TZIl9NVEkx6xYYuRn4OEebCeYZL
   diN5NyYFUyODDzGTMuRH+Yu9Hx7zDsn77kPT4N5eoqsh5VfCYO/vsQnRQ
   w==;
X-CSE-ConnectionGUID: aVS3dMunTiWYw4/OZ3oNdQ==
X-CSE-MsgGUID: 5ya4x1fcSSWbOEFHZkKDrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="54885884"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="54885884"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 19:18:37 -0700
X-CSE-ConnectionGUID: JdGZjimgRwC+oY7WlTVoIw==
X-CSE-MsgGUID: j4Z/A1l8Qx2X/tnU2/n6TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="81088912"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Oct 2024 19:18:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t49uL-000XSO-0Q;
	Fri, 25 Oct 2024 02:18:33 +0000
Date: Fri, 25 Oct 2024 10:17:55 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: [jarkko-tpmdd:lgp-v2 2/4] mm/madvise.c:1098:3: error: field
 designator 'install_pte' does not refer to any field in type 'const struct
 mm_walk_ops'
Message-ID: <202410251055.UG8FVFhd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git lgp-v2
head:   7ed651841db9f18744191e575637d69239102a73
commit: 94de21c76e54641539032105ccd3f36801fa9d85 [2/4] mm: madvise: implement lightweight guard page mechanism
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241025/202410251055.UG8FVFhd-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251055.UG8FVFhd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251055.UG8FVFhd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/madvise.c:9:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/madvise.c:21:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/madvise.c:1098:3: error: field designator 'install_pte' does not refer to any field in type 'const struct mm_walk_ops'
    1098 |         .install_pte            = guard_poison_install_pte,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/madvise.c:1130:9: error: call to undeclared function 'walk_page_range_mm'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1130 |                 err = walk_page_range_mm(vma->vm_mm, start, end,
         |                       ^
   mm/madvise.c:1130:9: note: did you mean 'walk_page_range_vma'?
   include/linux/pagewalk.h:124:5: note: 'walk_page_range_vma' declared here
     124 | int walk_page_range_vma(struct vm_area_struct *vma, unsigned long start,
         |     ^
   6 warnings and 2 errors generated.


vim +1098 mm/madvise.c

  1093	
  1094	static const struct mm_walk_ops guard_poison_walk_ops = {
  1095		.pud_entry		= guard_poison_pud_entry,
  1096		.pmd_entry		= guard_poison_pmd_entry,
  1097		.pte_entry		= guard_poison_pte_entry,
> 1098		.install_pte		= guard_poison_install_pte,
  1099		.walk_lock		= PGWALK_RDLOCK,
  1100	};
  1101	
  1102	static long madvise_guard_poison(struct vm_area_struct *vma,
  1103					 struct vm_area_struct **prev,
  1104					 unsigned long start, unsigned long end)
  1105	{
  1106		long err;
  1107	
  1108		*prev = vma;
  1109		if (!is_valid_guard_vma(vma, /* allow_locked = */false))
  1110			return -EINVAL;
  1111	
  1112		/*
  1113		 * If we install poison markers, then the range is no longer
  1114		 * empty from a page table perspective and therefore it's
  1115		 * appropriate to have an anon_vma.
  1116		 *
  1117		 * This ensures that on fork, we copy page tables correctly.
  1118		 */
  1119		err = anon_vma_prepare(vma);
  1120		if (err)
  1121			return err;
  1122	
  1123		/*
  1124		 * Optimistically try to install the guard poison pages first. If any
  1125		 * non-guard pages are encountered, give up and zap the range before
  1126		 * trying again.
  1127		 */
  1128		while (true) {
  1129			/* Returns < 0 on error, == 0 if success, > 0 if zap needed. */
> 1130			err = walk_page_range_mm(vma->vm_mm, start, end,
  1131						 &guard_poison_walk_ops, NULL);
  1132			if (err <= 0)
  1133				return err;
  1134	
  1135			/*
  1136			 * OK some of the range have non-guard pages mapped, zap
  1137			 * them. This leaves existing guard pages in place.
  1138			 */
  1139			zap_page_range_single(vma, start, end - start, NULL);
  1140	
  1141			if (fatal_signal_pending(current))
  1142				return -EINTR;
  1143			cond_resched();
  1144		}
  1145	}
  1146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
