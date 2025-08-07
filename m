Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D3C21D3DC;
	Thu,  7 Aug 2025 19:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754594658; cv=none; b=YbVjQsZFcyBZXSufHnjo4TkykMdn3Bxkln3kzKGN/hR5t9GUpiTtdx2MaBmYwTta/gzuMWNoCNQVt4Y/gX1NfFo+NARSRtmssLL8d6MPHS7hhHNImAcxQQvhH7gNRBEIpy3DsMNtGZEz75HztJuVjl/RxFObEHYtin1tywPwsiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754594658; c=relaxed/simple;
	bh=+losrJN7+Op5KIqM1H9Jh63SXza9I7A6KAPLi3wsTuw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EWMs0qn7q5fz7hEQuLDMlP3F16rScg99bR1eGScieOYzu3d/GfSOTbhqYjWATpyO632Bv7h2Uu+AruTH4dk8b68+1BRbs0jgC87SokUiZXOuCmnjTY1idwdLeAWOKn7FHmrMp+2EKXdM6OFaOKr73E2C+sQBoOiWqBo4UK68P48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DmPmOE86; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DmPmOE86"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754594655; x=1786130655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+losrJN7+Op5KIqM1H9Jh63SXza9I7A6KAPLi3wsTuw=;
  b=DmPmOE86vSdA6zSt+Mw2A8KheAGBqxFasfyj/E1mV9JSWRuPKodpfLeE
   TeYfXxjKoyyXNA5j+TsNRfj3QfYW5qtK2rnbOOZmnJi9M40ovbeDZ3UuR
   RblIQBqHSbrtcWenwTbRTz3L1A5D+0LNo5sLwRtCOwXGRwqSiHqx/g9CN
   rr/eLM+nIZlBFCH54RANZ3FCStusZqpX0VpZu3gmJnRwOPTdbRF4V9Dj9
   VDjxCddOV6JqFoziK932LAzCuKKoyP9ZnXSkSdM+1PMJBHj2OAKsruyiS
   Zs2aH2wP5KnXIJIo3v3NkJaQhDD/FxHNv/1YNDuOqALYeDWW0YjzIKoTP
   Q==;
X-CSE-ConnectionGUID: 4ez01MetTVak1ECbApfjTQ==
X-CSE-MsgGUID: Jhu4c+RrRQO6wN645j7DQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67533724"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="67533724"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 12:24:15 -0700
X-CSE-ConnectionGUID: elz//RuuRE2Ggu3hWhwkHQ==
X-CSE-MsgGUID: 7yLY0qjzQuGmD/L28CohVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="165485929"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 07 Aug 2025 12:24:14 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk6Dh-000394-02;
	Thu, 07 Aug 2025 19:24:09 +0000
Date: Fri, 8 Aug 2025 03:23:38 +0800
From: kernel test robot <lkp@intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ackerley Tng <ackerleytng@google.com>
Subject: [intel-tdx:huge_page_v2 194/204]
 arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1447:3: error: call to
 undeclared function 'kvm_gmem_invalidate_begin'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202508080344.qXKoVsWI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git huge_page_v2
head:   0744d0b90629d528fa94ff73dce7ceeaaed1560c
commit: bee3734f98a1de8b3926f6706f5900750f5023fc [194/204] KVM: guest_memfd: Split for punch hole and private-to-shared conversion
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250808/202508080344.qXKoVsWI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080344.qXKoVsWI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080344.qXKoVsWI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1447:3: error: call to undeclared function 'kvm_gmem_invalidate_begin'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1447 |                 kvm_gmem_invalidate_begin(gmem, start, end);
         |                 ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1447:3: note: did you mean 'kvm_mmu_invalidate_begin'?
   include/linux/kvm_host.h:1537:6: note: 'kvm_mmu_invalidate_begin' declared here
    1537 | void kvm_mmu_invalidate_begin(struct kvm *kvm);
         |      ^
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1451:9: error: call to undeclared function 'kvm_gmem_split_private'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1451 |                 ret = kvm_gmem_split_private(gmem, start, end);
         |                       ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1451:9: note: did you mean 'kvm_gmem_is_private'?
   include/linux/kvm_host.h:2512:20: note: 'kvm_gmem_is_private' declared here
    2512 | static inline bool kvm_gmem_is_private(struct kvm_memory_slot *slot, gfn_t gfn)
         |                    ^
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1467:3: error: call to undeclared function 'kvm_gmem_zap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1467 |                 kvm_gmem_zap(gmem, start, end, filter);
         |                 ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1598:2: error: call to undeclared function 'kvm_gmem_invalidate_begin'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1598 |         kvm_gmem_invalidate_begin(gmem, 0, -1ul);
         |         ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1599:2: error: call to undeclared function 'kvm_gmem_zap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1599 |         kvm_gmem_zap(gmem, 0, -1ul, KVM_FILTER_PRIVATE | KVM_FILTER_SHARED);
         |         ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1770:15: warning: variable 'argp' set but not used [-Wunused-but-set-variable]
    1770 |         void __user *argp;
         |                      ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1933:3: error: call to undeclared function 'kvm_gmem_invalidate_begin'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1933 |                 kvm_gmem_invalidate_begin(gmem, start, end);
         |                 ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1935:3: error: call to undeclared function 'kvm_gmem_zap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1935 |                 kvm_gmem_zap(gmem, start, end, filter);
         |                 ^
   1 warning and 7 errors generated.


vim +/kvm_gmem_invalidate_begin +1447 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

  1431	
  1432	static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
  1433	{
  1434		struct list_head *gmem_list = &inode->i_mapping->i_private_list;
  1435		pgoff_t start = offset >> PAGE_SHIFT;
  1436		pgoff_t end = (offset + len) >> PAGE_SHIFT;
  1437		struct kvm_gmem *gmem;
  1438		long ret;
  1439	
  1440		/*
  1441		 * Bindings must be stable across invalidation to ensure the start+end
  1442		 * are balanced.
  1443		 */
  1444		filemap_invalidate_lock(inode->i_mapping);
  1445	
  1446		list_for_each_entry(gmem, gmem_list, entry)
> 1447			kvm_gmem_invalidate_begin(gmem, start, end);
  1448	
  1449		ret = 0;
  1450		list_for_each_entry(gmem, gmem_list, entry) {
> 1451			ret = kvm_gmem_split_private(gmem, start, end);
  1452			if (ret)
  1453				goto out;
  1454		}
  1455		list_for_each_entry(gmem, gmem_list, entry) {
  1456			enum kvm_gfn_range_filter filter;
  1457	
  1458			/*
  1459			 * kvm_gmem_invalidate_begin() would have unmapped shared
  1460			 * mappings via mmu notifiers, but only if those mappings were
  1461			 * actually set up. Since guest_memfd cannot assume that shared
  1462			 * mappings were set up, zap both private and shared mappings
  1463			 * here. If shared mappings were zapped, this should not be
  1464			 * expensive.
  1465			 */
  1466			filter = KVM_FILTER_PRIVATE | KVM_FILTER_SHARED;
> 1467			kvm_gmem_zap(gmem, start, end, filter);
  1468		}
  1469		if (kvm_gmem_has_custom_allocator(inode)) {
  1470			ret = kvm_gmem_truncate_inode_range(inode, offset, offset + len);
  1471		} else {
  1472			/* Page size is PAGE_SIZE, so use optimized truncation function. */
  1473			truncate_inode_pages_range(inode->i_mapping, offset, offset + len - 1);
  1474		}
  1475	
  1476	out:
  1477		list_for_each_entry(gmem, gmem_list, entry)
  1478			kvm_gmem_invalidate_end(gmem, start, end);
  1479	
  1480		filemap_invalidate_unlock(inode->i_mapping);
  1481	
  1482		return ret;
  1483	}
  1484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
