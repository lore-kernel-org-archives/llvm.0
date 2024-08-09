Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9655C14831F;
	Fri,  9 Aug 2024 17:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723226150; cv=none; b=WI2P/4i7CsIqlXSaOINhSIhgLvwM2wyH0SfNOXDbxifG52D6kUPpF649Wvj3+XWzdNyFVsRs7SqmFPHi8BYTVdYTMim5q1xbNr8I55TCF++DuJkGLL2075OEPsj2YTWwEy99jFz//bq7iyGOsst2fs1wE1y/Qwr2j4RbyE7MDnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723226150; c=relaxed/simple;
	bh=+iXpuPgid6DxBYa77w6sggo41fe1Ace0EXgPhx7Xwpk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=blJUmmLlfsi4Voy6Z7iJwzddv/3u+lFbcOY9q+261mn1OFcGrARSpNPXChYpF8zvjHiNfO0epodXopJMGwti/y/QxjUDm1IT+Xxx7q/CWW2aL9WKkYsaRp8OO4iEghNOT2vt+oPo4+WaOAziof6qRm0Topo4PQ02VfZbaJQjZno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mzfJ1d+L; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mzfJ1d+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723226147; x=1754762147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+iXpuPgid6DxBYa77w6sggo41fe1Ace0EXgPhx7Xwpk=;
  b=mzfJ1d+LuloCItp33Xqka6T4FCNgreSt+Md0D3um0WYbsUsjoRLKRkas
   OR5noap/xAxlhSbfwRJ2l59mFkevffGsZ9AU1v7GZ4eR+3kqdOEy+86KR
   CWNUS/0pnKzjnPn8vRFM20XpJ60TBCzQtWt/dDM5bJNCEmYS7/4z5NpRk
   CZvzopd6yF3siTES3QzLb5F8nN559Xf8GzUSJVZHb/iiHVShZggxvYmQx
   G06EklHpyeOEJTyARvW1DCNYNo4TrSXiAd9n01HxeQGwaTm2rWLycanoG
   z6Ot/okAwfd4GD0QxjWtqh8v1Pg6oNf5/1oF1hz1z2dz09YeeTemH2J28
   Q==;
X-CSE-ConnectionGUID: R/3p0M9UQgu127caKyA/lg==
X-CSE-MsgGUID: WxSyZfhFQMm7O3zcLIqPJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="25276723"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="25276723"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 10:55:46 -0700
X-CSE-ConnectionGUID: bwO5QsAGQDy27iTyCy9gwA==
X-CSE-MsgGUID: kau1XRtIRo+XBCQPN6dzow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="62034555"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 09 Aug 2024 10:55:45 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scTq3-00097z-2M;
	Fri, 09 Aug 2024 17:55:43 +0000
Date: Sat, 10 Aug 2024 01:55:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v6.11-rc2/alloc-per-call-site 5/5] mm/slub.c:4143:35:
 error: no member named 'alloc_tag' in 'struct task_struct'
Message-ID: <202408100156.mj7EpsVv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v6.11-rc2/alloc-per-call-site
head:   d6fc9b7195894f3cdbef0bb406efa3b376b6c0f7
commit: d6fc9b7195894f3cdbef0bb406efa3b376b6c0f7 [5/5] slab: Allocate and use per-call-site caches
config: x86_64-buildonly-randconfig-002-20240810 (https://download.01.org/0day-ci/archive/20240810/202408100156.mj7EpsVv-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408100156.mj7EpsVv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408100156.mj7EpsVv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:4143:35: error: no member named 'alloc_tag' in 'struct task_struct'
    4143 |         struct alloc_tag *tag = current->alloc_tag;
         |                                 ~~~~~~~  ^
>> mm/slub.c:4148:9: error: initializing 'void *' with an expression of incompatible type 'void'
    4148 |                 void *p = READ_ONCE(tag->meta.cache);
         |                       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4152:6: error: assigning to 'void *' from incompatible type 'void'
    4152 |                         p = READ_ONCE(tag->meta.cache);
         |                           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +4143 mm/slub.c

  4137	
  4138	static __always_inline
  4139	struct kmem_cache *choose_slab(size_t size, kmem_buckets *b, gfp_t flags,
  4140				       unsigned long caller)
  4141	{
  4142	#ifdef CONFIG_SLAB_PER_SITE
> 4143		struct alloc_tag *tag = current->alloc_tag;
  4144	
  4145		if (!b && tag && tag->meta.sized &&
  4146		    kmalloc_type(flags, caller) == KMALLOC_NORMAL &&
  4147		    (flags & GFP_ATOMIC) != GFP_ATOMIC) {
> 4148			void *p = READ_ONCE(tag->meta.cache);
  4149	
  4150			if (!p && slab_state >= UP) {
  4151				alloc_tag_site_init(&tag->ct, true);
> 4152				p = READ_ONCE(tag->meta.cache);
  4153			}
  4154	
  4155			if (tag->meta.sized < SIZE_MAX) {
  4156				if (p)
  4157					return p;
  4158				/* Otherwise continue with default buckets. */
  4159			} else {
  4160				b = p;
  4161			}
  4162		}
  4163	#endif
  4164		return kmalloc_slab(size, b, flags, caller);
  4165	}
  4166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
