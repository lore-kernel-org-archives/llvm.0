Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84EA41C71;
	Sun, 13 Oct 2024 03:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728790236; cv=none; b=RHzYMha4IN8sYxarwbM7PgYXIhdcdumY/Y68zjvf8N4OCeUxvMl6pbL+8Nj3UwcYogfpxUftxJ/+ScUvwQ+vm4DyE5f9LcQcQwML5VdMHPnvKhuwYPelYMRh6bCxjIHF+ta3Zprk3qSV7UXAPb38g6oO/MeoRWJq8hihelzKlgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728790236; c=relaxed/simple;
	bh=7u2irpTVVEUyvhOwi6NnU+2drSImgq8841q3nkDVyhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOK6pIPe2nB4y40yW1Qv+q9WpRWolt2Lc8YTT71Pls1yeuDyHiA089fFXLvhTqrJJVGrC8bMLMXH8Gz+nELMANytIHBZqv+502I724Poodq+fO3c1N747fWz23kBLL9FjM05pdlPNFkIU8t9W9grXftC4FVZPrsdL+iEtKgvlzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jrVV9EDk; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrVV9EDk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728790235; x=1760326235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7u2irpTVVEUyvhOwi6NnU+2drSImgq8841q3nkDVyhM=;
  b=jrVV9EDkdMn8L6G8UloNj14y/iBH2qa8bjoyGNuEKgwY1CDnNBuDfW4j
   NXof5lchneuvmrUSI3+XWwQAoNJo4/AbWRZvL++h7ggSkVwxRsDnpc5Vu
   aJBQmco3N3IANYTiXI7/M9Du6IzzgVV7J/rpFirSPYviQh6SfjvwbD6eR
   Hkl7J1wdzlJe5Ev8/VJ7CUrxQspQPr17RWEFbv/Mn84n8PAhDV/5k4sS5
   sNmpbeupaVmLzVERB3BoSA9aamaTH1Z2JxlsIUvTckw/PcyrSu416AE2K
   XAfdxIgMuCVyn7C61TYaA8k4EIcfNgaY6ZvpFs3Eo3aBsUo/KY+rpJVT9
   g==;
X-CSE-ConnectionGUID: l4MX0oQ6TJSBxdYNQYRjAA==
X-CSE-MsgGUID: LR6ftyxOT4a5I1dcxFFBDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28103078"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28103078"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 20:30:34 -0700
X-CSE-ConnectionGUID: x/a5C88rQ/inrlLw9ETefw==
X-CSE-MsgGUID: 03nyYIcaTweHRcZHf15hIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="77709021"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Oct 2024 20:30:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szpJO-000E2N-21;
	Sun, 13 Oct 2024 03:30:30 +0000
Date: Sun, 13 Oct 2024 11:30:23 +0800
From: kernel test robot <lkp@intel.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 2/4] mm: shmem: change shmem_huge_global_enabled()
 to return huge order bitmap
Message-ID: <202410131132.b6FEas2V-lkp@intel.com>
References: <b1804b973d3ee800a2f233be45732b71ce3917cb.1728548374.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1804b973d3ee800a2f233be45732b71ce3917cb.1728548374.git.baolin.wang@linux.alibaba.com>

Hi Baolin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.12-rc2 next-20241011]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baolin-Wang/mm-factor-out-the-order-calculation-into-a-new-helper/20241010-175904
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/b1804b973d3ee800a2f233be45732b71ce3917cb.1728548374.git.baolin.wang%40linux.alibaba.com
patch subject: [RFC PATCH v3 2/4] mm: shmem: change shmem_huge_global_enabled() to return huge order bitmap
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20241013/202410131132.b6FEas2V-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410131132.b6FEas2V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410131132.b6FEas2V-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/shmem.c:28:
   In file included from include/linux/ramfs.h:5:
   In file included from include/linux/fs_parser.h:11:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/shmem.c:86:
   In file included from mm/internal.h:13:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/shmem.c:1608:20: warning: unused function 'shmem_show_mpol' [-Wunused-function]
    1608 | static inline void shmem_show_mpol(struct seq_file *seq, struct mempolicy *mpol)
         |                    ^~~~~~~~~~~~~~~
>> mm/shmem.c:1174:10: error: call to '__compiletime_assert_405' declared with 'error' attribute: BUILD_BUG failed
    1174 |             BIT(HPAGE_PMD_ORDER))
         |                 ^
   include/linux/huge_mm.h:108:26: note: expanded from macro 'HPAGE_PMD_ORDER'
     108 | #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
         |                          ^
   include/linux/huge_mm.h:104:28: note: expanded from macro 'HPAGE_PMD_SHIFT'
     104 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
         |                            ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:505:2: note: expanded from macro '_compiletime_assert'
     505 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:498:4: note: expanded from macro '__compiletime_assert'
     498 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:118:1: note: expanded from here
     118 | __compiletime_assert_405
         | ^
   4 warnings and 1 error generated.


vim +1174 mm/shmem.c

  1149	
  1150	static int shmem_getattr(struct mnt_idmap *idmap,
  1151				 const struct path *path, struct kstat *stat,
  1152				 u32 request_mask, unsigned int query_flags)
  1153	{
  1154		struct inode *inode = path->dentry->d_inode;
  1155		struct shmem_inode_info *info = SHMEM_I(inode);
  1156	
  1157		if (info->alloced - info->swapped != inode->i_mapping->nrpages)
  1158			shmem_recalc_inode(inode, 0, 0);
  1159	
  1160		if (info->fsflags & FS_APPEND_FL)
  1161			stat->attributes |= STATX_ATTR_APPEND;
  1162		if (info->fsflags & FS_IMMUTABLE_FL)
  1163			stat->attributes |= STATX_ATTR_IMMUTABLE;
  1164		if (info->fsflags & FS_NODUMP_FL)
  1165			stat->attributes |= STATX_ATTR_NODUMP;
  1166		stat->attributes_mask |= (STATX_ATTR_APPEND |
  1167				STATX_ATTR_IMMUTABLE |
  1168				STATX_ATTR_NODUMP);
  1169		inode_lock_shared(inode);
  1170		generic_fillattr(idmap, request_mask, inode, stat);
  1171		inode_unlock_shared(inode);
  1172	
  1173		if (shmem_huge_global_enabled(inode, 0, 0, false, NULL, 0) ==
> 1174		    BIT(HPAGE_PMD_ORDER))
  1175			stat->blksize = HPAGE_PMD_SIZE;
  1176	
  1177		if (request_mask & STATX_BTIME) {
  1178			stat->result_mask |= STATX_BTIME;
  1179			stat->btime.tv_sec = info->i_crtime.tv_sec;
  1180			stat->btime.tv_nsec = info->i_crtime.tv_nsec;
  1181		}
  1182	
  1183		return 0;
  1184	}
  1185	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
